import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Login/sign_in.dart';

class UpdatePasswordScreen extends StatefulWidget {
  const UpdatePasswordScreen({super.key});

  @override
  State<UpdatePasswordScreen> createState() => _UpdatePasswordScreenState();
}

class _UpdatePasswordScreenState extends State<UpdatePasswordScreen> {
  var updatePassword = TextEditingController();
  var configPassword = TextEditingController();
  var formkey = GlobalKey<FormState>();
  String uId = "${FirebaseAuth.instance.currentUser?.uid}";
  var user = FirebaseAuth.instance.currentUser?.email;
  CollectionReference userref = FirebaseFirestore.instance.collection('Users');
  updatedata() async {
    if (formkey.currentState!.validate()) {
      if (updatePassword.text == configPassword.text) {
        userref.doc(uId).update({
          "Password": updatePassword.text,
        });
        FirebaseAuth.instance.currentUser?.updatePassword(updatePassword.text);

        await FirebaseAuth.instance.signOut();
        Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => const SignInScreen()),
          (route) => false,
        );
      } else {
        AwesomeDialog(
          context: context,
          title: "ERROR",
          body: const Text("Password and confirmation do not match!"),
        ).show();
      }
    } else {
      AwesomeDialog(
        context: context,
        title: "ERROR",
        body: const Text("Can not Update Succeed !"),
      ).show();
    }
  }

  @override
  void initState() {
    super.initState();
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
        centerTitle: true,
        title: const Text(
          "Change Password",
          style: TextStyle(
            color: Colors.white,
            fontSize: 30,
            fontWeight: FontWeight.bold,
            letterSpacing: 3,
            wordSpacing: 2,
          ),
        ),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        elevation: 10,
      ),
//______________________________________________________________________________
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
            key: formkey,
            child: ListView(children: [
              const SizedBox(
                height: 150,
              ),
              TextFormField(
                controller: updatePassword,
                keyboardType: TextInputType.visiblePassword,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  prefixIcon: const Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Icon(
                      Icons.password,
                    ),
                  ),
                  labelText: 'Password',
                  hintTextDirection: TextDirection.ltr,
                  hintStyle: GoogleFonts.vazirmatn().copyWith(
                    fontSize: 14,
                    color: const Color(0xffC2C2C2),
                  ),
                ),
                // onSaved: (newValue) {
                //   updatePassword = newValue!;
                // },
                // onFieldSubmitted: (value) {
                //   updatePassword = value;
                // },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please Enter Your password';
                  }
                  return null;
                },
              ),
//______________________________________________________________________________
              const SizedBox(
                height: 50.0,
              ),
//______________________________________________________________________________
              TextFormField(
                controller: configPassword,
                keyboardType: TextInputType.visiblePassword,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  prefixIcon: const Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Icon(
                      Icons.password,
                    ),
                  ),
                  labelText: 'Confige Password',
                  hintTextDirection: TextDirection.ltr,
                  hintStyle: GoogleFonts.vazirmatn().copyWith(
                    fontSize: 14,
                    color: const Color(0xffC2C2C2),
                  ),
                ),
                // onSaved: (newValue) {
                //   configPassword = newValue!;
                // },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please Enter Your Confige password';
                  }
                  return null;
                },
              ),
//______________________________________________________________________________
              const SizedBox(
                height: 100.0,
              ),
//______________________________________________________________________________
              Container(
                width: 300.0,
                height: 50.0,
                decoration: BoxDecoration(
                  color: Colors.grey[500],
                  borderRadius: BorderRadius.circular(20.0),
                  border: Border.all(
                    style: BorderStyle.solid,
                    color: Colors.black,
                  ),
                ),
                child: MaterialButton(
                  onPressed: () {
                    updatedata();
                  },
                  child: const Text(
                    'Change Password',
                    style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ])),
      ),
    );
  }
}
