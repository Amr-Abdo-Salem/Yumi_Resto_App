import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../home/Home_Screen.dart';

class UpdateScreen extends StatefulWidget {
  const UpdateScreen({super.key});

  @override
  State<UpdateScreen> createState() => _UpdateScreenState();
}

class _UpdateScreenState extends State<UpdateScreen> {
  var updateUserName = TextEditingController();
  var formkey = GlobalKey<FormState>();
  var user = FirebaseAuth.instance.currentUser?.email;
  String uId = "${FirebaseAuth.instance.currentUser?.uid}";
  CollectionReference userref = FirebaseFirestore.instance.collection('Users');
  updatedata() async {
    if (formkey.currentState!.validate()) {
      userref.doc(uId).update({
        "UserName": updateUserName.text,
      });

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => HomeScreen(),
        ),
      );
    } else {
      AwesomeDialog(
        context: context,
        title: "ERROR",
        body: const Text("Can not Update Succeed !"),
      ).show();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 245, 198, 184),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 119, 82, 71),
        centerTitle: true,
        title: const Text(
          "User Update",
          style: TextStyle(
            color: Colors.white,
            fontSize: 30,
            letterSpacing: 3,
            wordSpacing: 2,
          ),
        ),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new,
            color: Colors.white,
            size: 30,
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
          child: SingleChildScrollView(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              const SizedBox(
                height: 300,
              ),
              //______________________________________________________________________________
              TextFormField(
                controller: updateUserName,
                keyboardType: TextInputType.name,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  prefixIcon: const Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Icon(
                        Icons.person,
                      )),
                  labelText: 'User Name',
                  hintTextDirection: TextDirection.ltr,
                  hintStyle: GoogleFonts.vazirmatn().copyWith(
                    fontSize: 14,
                    color: const Color(0xffC2C2C2),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please Enter Your User Name';
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
                    print(updateUserName.text);
                  },
                  child: const Text(
                    ' Update ',
                    style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
