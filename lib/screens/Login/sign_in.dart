import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:yumi_resto/widgets/button.dart';
import 'package:yumi_resto/widgets/loading.dart';
import 'package:yumi_resto/widgets/textformfeild.dart';
import '../SignUp/log_up.dart';
import '../home/Home_Screen.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  bool isVisable = true;
  late String myemail;
  late String mypassword;
  bool isSignPass = true;
  late UserCredential credential;

  late GlobalKey<FormState> key;
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
    //else {
    //   print(" Not Valide ");
    // }
  }

  // Future<UserCredential> signInWithGoogle() async {
  //   showloading(context);
  //   final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
  //   final GoogleSignInAuthentication? googleAuth =
  //       await googleUser?.authentication;
  //   final credential = GoogleAuthProvider.credential(
  //     accessToken: googleAuth?.accessToken,
  //     idToken: googleAuth?.idToken,
  //   );
  //   return await FirebaseAuth.instance.signInWithCredential(credential);
  // }

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
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 55),
                  child: Container(
                      height: 100,
                      width: 230,
                      clipBehavior: Clip.antiAlias,
                      decoration: const BoxDecoration(color: Colors.grey),
                      child: Image.asset(
                          'assets/ic_food_express-removebg-preview.png')),
                ),
                const SizedBox(height: 30),
                Form(
                    key: key,
                    child: Column(
                      children: [
                        CustomTextFormField(
                          labelText: 'Email',
                          prefixIcon: Icon(Icons.person, size: 17),
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
                        const SizedBox(height: 15),
                        TextFormField(
                          showCursor: true,
                          obscureText: isSignPass,
                          decoration: InputDecoration(
                            border: const OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0)),
                              borderSide: BorderSide(
                                width: 0,
                                style: BorderStyle.solid,
                              ),
                            ),
                            filled: true,
                            prefixIcon: Icon(
                              Icons.password,
                              color: Color(0xFF666666),
                              size: 17,
                            ),
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
                            fillColor: Color(0xFFF2F3F5),
                            hintStyle: TextStyle(
                              color: Color(0xFF666666),
                              fontSize: 15,
                            ),
                            labelText: ' password',
                            hintTextDirection: TextDirection.ltr,
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
                        // Card(
                        //   elevation: 20,
                        //   shape: RoundedRectangleBorder(
                        //     borderRadius: BorderRadius.circular(15),
                        //   ),
                        //   child: Directionality(
                        //     textDirection: TextDirection.ltr,
                        //     child: TextFormField(
                        //       decoration: InputDecoration(
                        //         enabledBorder: OutlineInputBorder(
                        //           borderRadius: BorderRadius.circular(15.0),
                        //         ),
                        //         prefixIcon: Padding(
                        //           padding: const EdgeInsets.all(10.0),
                        //           child: SvgPicture.asset(
                        //             'assets/svgs/user.svg',
                        //             color: const Color(0xff8F8F8F),
                        //             height: 24,
                        //             width: 24,
                        //             fit: BoxFit.contain,
                        //             matchTextDirection: true,
                        //           ),
                        //         ),
                        //         labelText: ' Email',
                        //         hintStyle: GoogleFonts.vazirmatn().copyWith(
                        //           fontSize: 14,
                        //           color: const Color(0xffC2C2C2),
                        //         ),
                        //       ),
                        //       onSaved: (newValue) {
                        //         myemail = newValue!;
                        //       },
                        //       validator: (value) {
                        //         if (value == null || value.isEmpty) {
                        //           return 'Please Enter Your email';
                        //         }
                        //         return null;
                        //       },
                        //     ),
                        //   ),
                        // ),
                        // const SizedBox(height: 18),
                        // Card(
                        //   elevation: 20,
                        //   shape: RoundedRectangleBorder(
                        //     borderRadius: BorderRadius.circular(15),
                        //   ),
                        //   child: Directionality(
                        //     textDirection: TextDirection.ltr,
                        //     child: TextFormField(
                        //       // controller: passwordcontroller,
                        //       obscureText: isSignPass,
                        //       decoration: InputDecoration(
                        //         enabledBorder: OutlineInputBorder(
                        //           borderRadius: BorderRadius.circular(15.0),
                        //         ),
                        //         prefixIcon: Padding(
                        //           padding: const EdgeInsets.all(10.0),
                        //           child: SvgPicture.asset(
                        //             'assets/svgs/password.svg',
                        //             color: const Color(0xff8F8F8F),
                        //             height: 24,
                        //             width: 24,
                        //             fit: BoxFit.contain,
                        //             matchTextDirection: true,
                        //           ),
                        //         ),
                        //         suffixIcon: IconButton(
                        //           onPressed: () {
                        //             setState(() {
                        //               isSignPass = !isSignPass;
                        //             });
                        //           },
                        //           icon: isSignPass
                        //               ? const Icon(
                        //                   Icons.visibility_off,
                        //                   color: Colors.grey,
                        //                 )
                        //               : const Icon(
                        //                   Icons.visibility,
                        //                   color: Colors.blue,
                        //                 ),
                        //         ),
                        //         labelText: ' password',
                        //         hintTextDirection: TextDirection.ltr,
                        //         hintStyle: GoogleFonts.vazirmatn().copyWith(
                        //           fontSize: 14,
                        //           color: const Color(0xffC2C2C2),
                        //         ),
                        //       ),
                        //       onSaved: (newValue) {
                        //         mypassword = newValue!;
                        //       },
                        //       validator: (value) {
                        //         if (value == null || value.isEmpty) {
                        //           return 'Please Enter Your password';
                        //         }
                        //         return null;
                        //       },
                        //     ),
                        //   ),
                        // ),
                      ],
                    )),
                const SizedBox(height: 18),
                SignInButtonWidget(
                  text: 'SignIn',
                  ontap: () async {
                    var userSign = await signIn();
                    if (userSign != null) {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => HomeScreen(),
                        ),
                      );
                    }

                    FirebaseMessaging.instance.subscribeToTopic('yumi');
                  },
                ),
                const SizedBox(height: 18),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Directionality(
                        textDirection: TextDirection.rtl,
                        child: Text(
                          "? don't have account",
                          style: TextStyle(color: Colors.black),
                        )),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const Logged_up(),
                            ));
                      },
                      child: const Text(
                        ' Register',
                        style: TextStyle(color: Colors.blue),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
