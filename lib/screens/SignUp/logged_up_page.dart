import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:yumi_resto/widgets/loading.dart';
import '../home/Home_Screen.dart';

class Logged_up extends StatefulWidget {
  const Logged_up({Key? key}) : super(key: key);

  @override
  State<Logged_up> createState() => _Logged_upState();
}

class _Logged_upState extends State<Logged_up> {
  // var _image;
  bool isVisable = true;
  late String username;
  late String myemail;
  late String location;
  late String phone;
  late String mypassword;
  late String uidUser = "${FirebaseAuth.instance.currentUser?.uid}";
  late String emailUser = "${FirebaseAuth.instance.currentUser?.email}";

  // DocumentReference userref = FirebaseFirestore.instance.collection("Users").doc();
  signUp() async {
    var formdata = key.currentState;
    if (formdata!.validate()) {
      formdata.save();
      try {
        showloading(context);
        UserCredential credential =
            await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: myemail,
          password: mypassword,
        );
        return credential;
      } on FirebaseAuthException catch (e) {
        if (e.code == 'weak-password') {
          Navigator.of(context).pop();
          AwesomeDialog(
            context: context,
            title: "ERROR",
            body: Text("The password provided is too weak."),
          )..show();
        } else if (e.code == 'email-already-in-use') {
          Navigator.of(context).pop();
          AwesomeDialog(
            context: context,
            title: "ERROR",
            body: Text("The account already exists for that email."),
          )..show();
        }
      }
      //catch (e) {
      //   return _signInWithForm();
      // }
    } else {
      print("ERROR");
    }
  }

//  sendData() async {}

  late GlobalKey<FormState> key;

  @override
  void initState() {
    super.initState();
    key = GlobalKey<FormState>();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 245, 198, 184),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 119, 82, 71),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
        ),
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Form(
              key: key,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Container(
                      height: 180,
                      width: 180,
                      clipBehavior: Clip.antiAlias,
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                          color: Colors.grey),
                      child: Image.asset(
                        'assets/log1.jpg',
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Card(
                    elevation: 20,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Directionality(
                      textDirection: TextDirection.ltr,
                      child: TextFormField(
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          prefixIcon: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: SvgPicture.asset(
                              'assets/svgs/user.svg',
                              color: const Color(0xff8F8F8F),
                              height: 24,
                              width: 24,
                              fit: BoxFit.contain,
                              matchTextDirection: true,
                            ),
                          ),
                          labelText: ' User Name',
                          hintTextDirection: TextDirection.ltr,
                          hintStyle: GoogleFonts.vazirmatn().copyWith(
                            fontSize: 14,
                            color: const Color(0xffC2C2C2),
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please Enter Your name';
                          }
                          return null;
                        },
                        onSaved: (newValue) {
                          username = newValue!;
                        },
                      ),
                    ),
                  ),
                  const SizedBox(height: 15),
                  Card(
                    elevation: 20,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Directionality(
                      textDirection: TextDirection.ltr,
                      child: TextFormField(
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          prefixIcon: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: SvgPicture.asset(
                              'assets/svgs/location.svg',
                              color: const Color(0xff8F8F8F),
                              height: 24,
                              width: 24,
                              fit: BoxFit.contain,
                              matchTextDirection: true,
                            ),
                          ),
                          labelText: 'Location',
                          hintTextDirection: TextDirection.rtl,
                          hintStyle: GoogleFonts.vazirmatn().copyWith(
                            fontSize: 14,
                            color: const Color(0xffC2C2C2),
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please Enter Your location';
                          }
                          return null;
                        },
                        onSaved: (newValue) {
                          location = newValue!;
                        },
                      ),
                    ),
                  ),
                  const SizedBox(height: 15),
                  Card(
                    elevation: 20,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Directionality(
                      textDirection: TextDirection.ltr,
                      child: TextFormField(
                        keyboardType: TextInputType.phone,
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          prefixIcon: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: SvgPicture.asset(
                              'assets/svgs/phone.svg',
                              color: const Color(0xff8F8F8F),
                              height: 24,
                              width: 24,
                              fit: BoxFit.contain,
                              matchTextDirection: true,
                            ),
                          ),
                          labelText: ' phone number',
                          hintTextDirection: TextDirection.ltr,
                          hintStyle: GoogleFonts.vazirmatn().copyWith(
                            fontSize: 14,
                            color: const Color(0xffC2C2C2),
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please Enter Your phone';
                          }
                          return null;
                        },
                        onSaved: (newValue) {
                          phone = newValue!;
                        },
                      ),
                    ),
                  ),
                  const SizedBox(height: 15),
                  Card(
                    elevation: 20,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Directionality(
                      textDirection: TextDirection.ltr,
                      child: TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          prefixIcon: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: SvgPicture.asset(
                              'assets/svgs/email.svg',
                              color: const Color(0xff8F8F8F),
                              height: 24,
                              width: 24,
                              fit: BoxFit.contain,
                              matchTextDirection: true,
                            ),
                          ),
                          labelText: ' e-mail',
                          hintTextDirection: TextDirection.rtl,
                          hintStyle: GoogleFonts.vazirmatn().copyWith(
                            fontSize: 14,
                            color: const Color(0xffC2C2C2),
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please Enter Your email';
                          }
                          return null;
                        },
                        onSaved: (newValue) {
                          myemail = newValue!;
                        },
                      ),
                    ),
                  ),
                  const SizedBox(height: 15),
                  Card(
                    elevation: 20,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Directionality(
                      textDirection: TextDirection.ltr,
                      child: TextFormField(
                        obscureText: isVisable,
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          prefixIcon: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: SvgPicture.asset(
                              'assets/svgs/password.svg',
                              color: const Color(0xff8F8F8F),
                              height: 24,
                              width: 24,
                              fit: BoxFit.contain,
                              matchTextDirection: true,
                            ),
                          ),
                          suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                isVisable = !isVisable;
                              });
                            },
                            icon: isVisable
                                ? const Icon(
                                    Icons.visibility_off,
                                    color: Colors.grey,
                                  )
                                : const Icon(
                                    color: Colors.blue,
                                    Icons.visibility,
                                  ),
                          ),
                          labelText: ' password',
                          hintTextDirection: TextDirection.rtl,
                          hintStyle: GoogleFonts.vazirmatn().copyWith(
                            fontSize: 14,
                            color: const Color(0xffC2C2C2),
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please Enter Your password';
                          }
                          // if (value.length < 8) {
                          //   Fluttertoast.showToast(
                          //       msg: "Please Enter at least 8 chars",
                          //       toastLength: Toast.LENGTH_LONG,
                          //       gravity: ToastGravity.BOTTOM,
                          //       //  timeInSecForIosWeb: 2,
                          //       backgroundColor: Colors.white,
                          //       textColor: Colors.black,
                          //       fontSize: 16.0);
                          // }
                          return null;
                        },
                        onSaved: (newValue) {
                          mypassword = newValue!;
                        },
                      ),
                    ),
                  ),
                  const SizedBox(height: 15),
                  //
                  Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Directionality(
                          textDirection: TextDirection.rtl,
                          child: Container(
                            height: 55,
                            width: 200,
                            decoration: BoxDecoration(
                              color: Colors.grey[500],
                              borderRadius: BorderRadius.circular(15),
                              border: Border.all(
                                color: Colors.black,
                                width: 2,
                              ),
                            ),
                            child: MaterialButton(
                              onPressed: () async {
                                var respons = await signUp();
                                if (respons != null) {
                                  await FirebaseFirestore.instance
                                      .collection("Users")
                                      .doc(uidUser)
                                      .set({
                                    "UserName": username,
                                    "Location": location,
                                    "PhoneNumber": phone,
                                    "EmailAdress": emailUser,
                                    "UserId": uidUser,
                                    "Password": mypassword,
                                  });
                                  // ignore: use_build_context_synchronously
                                  Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => HomeScreen(),
                                    ),
                                  );
                                } else {
                                  print("Error");
                                }
                                FirebaseMessaging.instance
                                    .subscribeToTopic('yumi');
                              },
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: const [
                                  Text(
                                    ' Register',
                                    style: TextStyle(fontSize: 18),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ]),
                  const SizedBox(height: 25),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  // _signInWithForm() {
  //   if (!key.currentState!.validate()) return;
  //   key.currentState?.save();
  //   // log('email:$email\npassword:$password\nname:$username\nphone:$phone\n');
  //   // ignore: unnecessary_null_comparison
  //   if (username == null ||
  //       username.isEmpty ||
  //       // ignore: unnecessary_null_comparison
  //       mypassword == null ||
  //       mypassword.isEmpty ||
  //       // ignore: unnecessary_null_comparison
  //       myemail == null ||
  //       myemail.isEmpty ||
  //       location == null ||
  //       location.isEmpty ||
  //       phone == null ||
  //       phone.isEmpty) {
  //     // log('You are logged successfully');
  //     Fluttertoast.showToast(
  //         msg: '   please enter a correct data ..',
  //         toastLength: Toast.LENGTH_LONG,
  //         gravity: ToastGravity.BOTTOM,
  //         //timeInSecForIosWeb: 2,
  //         backgroundColor: Colors.white,
  //         textColor: Colors.pink,
  //         fontSize: 16.0);
  //     return;
  //   } else {
  //     Fluttertoast.showToast(
  //         msg: 'You are logged successfully',
  //         toastLength: Toast.LENGTH_LONG,
  //         gravity: ToastGravity.BOTTOM,
  //         //      timeInSecForIosWeb: 10,
  //         backgroundColor: Colors.white,
  //         textColor: Colors.indigo,
  //         fontSize: 16.0);
  //   }
  // }

  // Future pickPhotoFromGallery() async {
  //   File imageFile =
  //       (await ImagePicker().pickImage(source: ImageSource.camera)) as File;

  //   setState(() {
  //     _image = imageFile;
  //   });
  // }
}
