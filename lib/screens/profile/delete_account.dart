import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:yumi_resto/widgets/loading.dart';
import 'package:yumi_resto/screens/Login/sign_in.dart';

class DeleteAccountScreen extends StatefulWidget {
  const DeleteAccountScreen({super.key});

  @override
  State<DeleteAccountScreen> createState() => _DeleteAccountScreenState();
}

class _DeleteAccountScreenState extends State<DeleteAccountScreen> {
  bool isVisable = true;
  late String myemail;
  late String mypassword;
  bool isSignPass = true;
  late UserCredential credential;
  var userDelete = FirebaseAuth.instance.currentUser;
  late GlobalKey<FormState> key;
  final String uId = "${FirebaseAuth.instance.currentUser?.uid}";
  signIn() async {
    var formdata = key.currentState;
    formdata?.save();
    if (formdata!.validate()) {
      try {
        showloading(context);
        // ignore: unused_local_variable
        UserCredential credential =
            await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: myemail,
          password: mypassword,
        );
        return UserCredential;
      } on FirebaseAuthException catch (e) {
        if (e.code == 'user-not-found') {
          Navigator.of(context).pop();
          AwesomeDialog(
            context: context,
            title: "ERROR",
            body: const Text("No user found for that email."),
          ).show();
        } else if (e.code == 'wrong-password') {
          Navigator.of(context).pop();
          AwesomeDialog(
            context: context,
            title: "ERROR",
            body: const Text("Wrong password provided for that user."),
          ).show();
        }
      }
    }
  }

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
          icon: const Icon(
            Icons.arrow_back_ios_new,
            size: 22,
          ),
        ),
        elevation: 0,
        title: const Text(
          'Delete Account',
          style: TextStyle(
            color: Colors.white,
            fontSize: 25,
            letterSpacing: 3,
            wordSpacing: 2,
          ),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Form(
                    key: key,
                    child: Column(
                      children: [
                        Text(
                          'Delete Account',
                          style: TextStyle(
                            fontSize: 40,
                          ),
                        ),
                        SizedBox(
                          height: 35,
                        ),
                        Card(
                          elevation: 10,
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
                                labelText: ' Email',
                                hintStyle: GoogleFonts.vazirmatn().copyWith(
                                  fontSize: 14,
                                  color: const Color(0xffC2C2C2),
                                ),
                              ),
                              onSaved: (newValue) {
                                myemail = newValue!;
                              },
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please Enter Your email';
                                }
                                return null;
                              },
                            ),
                          ),
                        ),
                        const SizedBox(height: 18),
                        Card(
                          elevation: 10,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Directionality(
                            textDirection: TextDirection.ltr,
                            child: TextFormField(
                              obscureText: isSignPass,
                              decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15.0),
                                ),
                                prefixIcon: Icon(Icons.password),
                                suffixIcon: IconButton(
                                  onPressed: () {
                                    setState(() {
                                      isSignPass = !isSignPass;
                                    });
                                  },
                                  icon: isSignPass
                                      ? const Icon(
                                          Icons.visibility_off,
                                          color: Colors.grey,
                                        )
                                      : const Icon(
                                          Icons.visibility,
                                          color: Colors.blue,
                                        ),
                                ),
                                labelText: ' password',
                                // hintTextDirection: TextDirection.ltr,
                                // hintStyle: GoogleFonts.vazirmatn().copyWith(
                                //   fontSize: 14,
                                //   color: const Color(0xffC2C2C2),
                                // ),
                              ),
                              onSaved: (newValue) {
                                mypassword = newValue!;
                              },
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please Enter Your password';
                                }
                                return null;
                              },
                            ),
                          ),
                        ),
                      ],
                    )),
                const SizedBox(height: 55),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Directionality(
                      textDirection: TextDirection.rtl,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.grey[500],
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(
                            color: Colors.black,
                            width: 2,
                          ),
                        ),
                        height: 55,
                        width: 300,
                        child: MaterialButton(
                          onPressed: () async {
                            var userSign = await signIn();
                            if (userSign != null) {
                              Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                  builder: (context) => SignInScreen(),
                                ),
                              );
                              userDelete?.delete();

                              // ignore: unnecessary_null_comparison
                              if (uId == null) {
                                FirebaseFirestore.instance
                                    .collection('Users')
                                    .doc(uId)
                                    .delete();
                              }

                              FirebaseMessaging.instance
                                  .unsubscribeFromTopic('yumi');
                            }

                            FirebaseMessaging.instance.subscribeToTopic('yumi');
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Text(
                                ' Delete ',
                                style: TextStyle(fontSize: 18),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                  color: Colors.amber,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
