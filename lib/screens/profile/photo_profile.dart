import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class PhotoProfileScreen extends StatelessWidget {
  File? file;
  PhotoProfileScreen({required this.file});

  final storageRef = FirebaseStorage.instance.ref();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 245, 198, 184),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 119, 82, 71),
        elevation: 0,
        centerTitle: true,
        //leadingWidth: 20,
        title: Text(
          "My Photo",
          style: TextStyle(
            color: Colors.black,
            fontSize: 25,
            letterSpacing: 2,
          ),
        ),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios_new,
            color: Colors.black,
            size: 30,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 700,
            width: 500,
            padding: EdgeInsets.all(16),
            child: Card(
              child: file == null
                  ? Image.asset(
                      'assets/user.png',
                      fit: BoxFit.cover,
                    )
                  : StreamBuilder(
                      stream: userIam.doc(uId).snapshots(),
                      builder: (conext, snapshot) {
                        return Image.network(
                          "${snapshot.data?['imageurl']}",
                          fit: BoxFit.cover,
                        );
                      },
                    ),
            ),
          ),
          // MaterialButton(
          //   child: Text("Delete Image"),
          //   onPressed: () async {
          //     //final desertRef = storageRef.child(imageUrl);
          //     await file?.delete();
          //     Navigator.of(context).pushReplacement(
          //       MaterialPageRoute(
          //         builder: (context) => HomeScreen(),
          //       ),
          //     );
          //   },
          // ),
        ],
      ),
    );
  }
}

final String uId = "${FirebaseAuth.instance.currentUser?.uid}";
CollectionReference userIam = FirebaseFirestore.instance
    .collection('Users')
    .doc(uId)
    .collection('Images');
