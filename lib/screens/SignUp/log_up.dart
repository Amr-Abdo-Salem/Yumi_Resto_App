import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:yumi_resto/widgets/loading.dart';
import 'package:yumi_resto/widgets/textformfeild.dart';
import '../../widgets/button.dart';
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
    double defaultIconSize = 17;
    String defaultFontFamily = 'Roboto-Light.ttf';
    double defaultFontSize = 14;
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 245, 198, 184),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 245, 198, 184),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
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
                      width: 230,
                      height: 100,
                      alignment: Alignment.center,
                      child: Image.asset(
                        'assets/logup.jpg',
                      ),
                    ),
                  ),
                  CustomTextFormField(
                    labelText: 'User Name',
                    prefixIcon: Icon(
                      Icons.person_outline,
                      size: defaultIconSize,
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
                  const SizedBox(height: 15),
                  CustomTextFormField(
                    labelText: 'Location',
                    prefixIcon: Icon(
                      Icons.location_on_outlined,
                      size: defaultIconSize,
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
                  const SizedBox(height: 15),
                  CustomTextFormField(
                    prefixIcon: Icon(
                      Icons.phone,
                      size: defaultIconSize,
                    ),
                    labelText: 'Phone number',
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
                  const SizedBox(height: 15),
                  CustomTextFormField(
                    prefixIcon: Icon(
                      Icons.email_outlined,
                      size: defaultIconSize,
                    ),
                    labelText: 'E-mail',
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
                  const SizedBox(height: 15),
                  TextFormField(
                    showCursor: true,
                    obscureText: isVisable,
                    decoration: InputDecoration(
                      border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        borderSide: BorderSide(
                          width: 0,
                          style: BorderStyle.solid,
                        ),
                      ),
                      filled: true,
                      prefixIcon: Icon(
                        Icons.password,
                        color: Color(0xFF666666),
                        size: defaultIconSize,
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
                                Icons.visibility,
                                color: Colors.blue,
                              ),
                      ),
                      fillColor: Color(0xFFF2F3F5),
                      hintStyle: TextStyle(
                        color: Color(0xFF666666),
                        fontFamily: defaultFontFamily,
                        fontSize: defaultFontSize,
                      ),
                      labelText: ' password',
                      hintTextDirection: TextDirection.ltr,
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please Enter Your password';
                      }
                      return null;
                    },
                    onSaved: (newValue) {
                      mypassword = newValue!;
                    },
                  ),
                  const SizedBox(height: 15),
                  SignInButtonWidget(
                    text: 'SIGN UP',
                    ontap: () async {
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
                      FirebaseMessaging.instance.subscribeToTopic('yumi');
                    },
                  ),
                  const SizedBox(height: 25),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
