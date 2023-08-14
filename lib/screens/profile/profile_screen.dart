import 'dart:io';
import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:image_picker/image_picker.dart';
import 'package:yumi_resto/screens/about_us/aboutus_screen.dart';
// import 'package:yumi_resto/screens/location/location_screen.dart';
import 'package:yumi_resto/screens/profile/profile_location/location.dart';
import 'package:yumi_resto/widgets/loading.dart';
import 'package:yumi_resto/screens/basket/basket_screen.dart';
import 'package:yumi_resto/screens/privasy_policy/privasypolicy.dart';
import 'package:yumi_resto/screens/profile/photo_profile.dart';
// import 'package:yumi_resto/screens/location/order_track.dart';
import '../Login/sign_in.dart';
import '../home/Home_Screen.dart';
import '../settings/setting_screen.dart';
import '../updates/update.dart';
import 'delete_account.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

late Reference ref;
bool _isTap = false;
final String uId = "${FirebaseAuth.instance.currentUser?.uid}";
//final String userDelete = "${FirebaseAuth.instance.currentUser?.email}";
CollectionReference userref = FirebaseFirestore.instance.collection('Users');
var userDelete = FirebaseAuth.instance.currentUser;
var image = FirebaseFirestore.instance
    .collection("Users")
    .doc(uId)
    .collection("Images")
    .where("");
CollectionReference userIam = FirebaseFirestore.instance
    .collection('Users')
    .doc(uId)
    .collection('Images');
final storageRef = FirebaseStorage.instance.ref();
File? file;
var imagepicker = ImagePicker();
late String imageUrl;
getImage() {
  file == null
      ? Image.asset('assets/user.png')
      : StreamBuilder(
          stream: userIam.doc(uId).snapshots(),
          builder: (conext, snapshot) {
            return Image.network(
              "${snapshot.data?['imageurl']}",
              fit: BoxFit.cover,
            );
          },
        );
}

class _ProfileScreenState extends State<ProfileScreen> {
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
        iconTheme: const IconThemeData(color: Colors.white),
        title: const Text(
          'Profile',
          style: TextStyle(
            color: Colors.white,
            fontSize: 25,
            letterSpacing: 3,
          ),
        ),
        centerTitle: false,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Stack(
                  alignment: AlignmentDirectional.bottomEnd,
                  children: [
                    Container(
                      height: 150,
                      width: 150,
                      color: Color.fromARGB(255, 13, 71, 161),
                      padding: const EdgeInsets.all(2),
                      // decoration: const BoxDecoration(
                      //   color: Color.fromARGB(255, 13, 71, 161),
                      //   image: DecorationImage(
                      //     image: AssetImage(
                      //       'assets/user.png',
                      //     ),
                      //     opacity: 40,
                      //   ),
                      // ),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => PhotoProfileScreen(
                                file: file,
                              ),
                            ),
                          );
                        },
                        child: Container(
                          height: 145,
                          width: 145,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                          ),
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
                    ),
                    // CircleAvatar(
                    //   backgroundColor: Color.fromARGB(255, 13, 71, 161),
                    //   radius: 75,
                    //   child: GestureDetector(
                    //     onTap: () {
                    //       Navigator.of(context).push(
                    //         MaterialPageRoute(
                    //           builder: (context) => PhotoProfileScreen(),
                    //         ),
                    //       );
                    //     },
                    //     child: CircleAvatar(
                    //       child: file == Null
                    //           ? Image.asset('assets/user.png')
                    //           : FutureBuilder(
                    //               future: userIam2.get(),
                    //               builder: ((context, snapshot) {
                    //                 return Image.network(
                    //                     "${snapshot.data?.get('imageurl')}");
                    //               }),
                    //             ),
                    //       // backgroundImage: file != null
                    //       //     ? NetworkImage(imageUrl)
                    //       //     : NetworkImage(
                    //       //         "https://static.vecteezy.com/system/resources/previews/008/442/086/original/illustration-of-human-icon-user-symbol-icon-modern-design-on-blank-background-free-vector.jpg"),
                    //       radius: 72,
                    //     ),
                    //   ),
                    // ),
                    Padding(
                      padding: const EdgeInsetsDirectional.only(
                        end: 0.0000001,
                        bottom: 0.000001,
                        //start: 20.5,
                      ),
                      child: Padding(
                        padding: const EdgeInsetsDirectional.only(
                          end: 0.000001,
                          bottom: 0.0000001,
                        ),
                        child: Stack(
                          alignment: AlignmentDirectional.center,
                          children: [
                            const CircleAvatar(
                              radius: 9.0,
                              backgroundColor: Color.fromARGB(255, 13, 71, 161),
                            ),
                            IconButton(
                              icon: const Icon(
                                Icons.camera_alt_sharp,
                                color: Colors.blue,
                                size: 25.0,
                              ),
                              onPressed: () {
                                showBottomSheet(context);
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                // ignore: unnecessary_null_comparison
                uId == null
                    ? const Text(" Not Found ")
                    : StreamBuilder(
                        stream: userref.doc(uId).snapshots(),
                        builder: (conext, snapshot) {
                          return Text(
                            "${snapshot.data?['UserName']}",
                            maxLines: 3,
                            style: const TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          );
                        },
                      ),
                Column(
                  children: [
                    IconButton(
                      color: Color.fromARGB(255, 13, 71, 161),
                      onPressed: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const UpdateScreen()));
                      },
                      icon: const Icon(
                        Icons.edit,
                        size: 27,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 10),
            Column(
              children: [
                Card(
                  color: Colors.grey[300],
                  elevation: 5,
                  margin: const EdgeInsets.fromLTRB(5, 8, 5, 10),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    children: [
                      ListTile(
                        leading: Icon(
                          Icons.location_on,
                          color: Colors.blue.shade900,
                        ),
                        title: const Text('Location'),
                        trailing: const Icon(
                          Icons.keyboard_arrow_right,
                          color: Color.fromARGB(255, 13, 71, 161),
                        ),
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              // builder: (context) => LocationScreen(),
                              // // builder: (context) => OrderTrackingPage(),
                              builder: (context) => LocationPage(),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
                // Card(
                //   color: Colors.grey[300],
                //   elevation: 4,
                //   margin: const EdgeInsets.fromLTRB(5, 8, 5, 16),
                //   shape: RoundedRectangleBorder(
                //     borderRadius: BorderRadius.circular(10),
                //   ),
                //   child: Column(
                //     children: [
                //       ListTile(
                //         leading: Icon(
                //           Icons.favorite_border_sharp,
                //           color: Colors.blue.shade900,
                //         ),
                //         title: const Text('Favorite meals'),
                //         trailing: const Icon(
                //           Icons.keyboard_arrow_right,
                //           color: Color.fromARGB(255, 13, 71, 161),
                //         ),
                //         onTap: () {},
                //       ),
                //     ],
                //   ),
                // ),
                Card(
                  color: Colors.grey[300],
                  elevation: 4,
                  margin: const EdgeInsets.fromLTRB(5, 8, 5, 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    children: [
                      ListTile(
                        leading: Icon(
                          Icons.shopping_cart,
                          color: Colors.blue.shade900,
                        ),
                        title: const Text('Cart'),
                        trailing: const Icon(
                          Icons.keyboard_arrow_right,
                          color: Color.fromARGB(255, 13, 71, 161),
                        ),
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => BasketScreen(),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
                Card(
                  color: Colors.grey[300],
                  elevation: 4,
                  margin: const EdgeInsets.fromLTRB(5, 8, 5, 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    children: [
                      ListTile(
                        leading: Icon(
                          Icons.privacy_tip,
                          color: Colors.blue.shade900,
                        ),
                        title: const Text('Privacy Policy'),
                        trailing: const Icon(
                          Icons.keyboard_arrow_right,
                          color: Color.fromARGB(255, 13, 71, 161),
                        ),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const PrivacyPolicy()),
                          );
                        },
                      ),
                    ],
                  ),
                ),
                Card(
                  color: Colors.grey[300],
                  elevation: 4,
                  margin: const EdgeInsets.fromLTRB(5, 8, 5, 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    children: [
                      ListTile(
                        leading: Icon(
                          Icons.info,
                          color: Colors.blue.shade900,
                        ),
                        title: const Text('About Us'),
                        trailing: const Icon(
                          Icons.keyboard_arrow_right,
                          color: Color.fromARGB(255, 13, 71, 161),
                        ),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const AboutUs()),
                          );
                        },
                      ),
                    ],
                  ),
                ),
                Card(
                  color: Colors.grey[300],
                  elevation: 4,
                  margin: const EdgeInsets.fromLTRB(5, 8, 5, 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    children: [
                      ListTile(
                        leading: Icon(
                          Icons.settings,
                          color: Colors.blue.shade900,
                        ),
                        title: const Text('Settings'),
                        trailing: const Icon(
                          Icons.keyboard_arrow_right,
                          color: Color.fromARGB(255, 13, 71, 161),
                        ),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const SettingScreen()),
                          );
                        },
                      ),
                    ],
                  ),
                ),
                Card(
                  color: Colors.grey[300],
                  elevation: 4,
                  margin: const EdgeInsets.fromLTRB(5, 8, 5, 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    children: [
                      ListTile(
                        leading: Icon(
                          Icons.logout,
                          color: Colors.blue.shade900,
                        ),
                        title: const Text('Log Out'),
                        trailing: const Icon(
                          Icons.keyboard_arrow_right,
                          color: Color.fromARGB(255, 13, 71, 161),
                        ),
                        onTap: () async {
                          await FirebaseAuth.instance.signOut();
                          showloading(context);
                          Navigator.of(context).pushAndRemoveUntil(
                            MaterialPageRoute(
                                builder: (context) => const SignInScreen()),
                            (route) => false,
                          );
                          FirebaseMessaging.instance
                              .unsubscribeFromTopic('yumi');
                        },
                      ),
                    ],
                  ),
                ),
                Card(
                  color: Colors.grey[300],
                  elevation: 4,
                  margin: const EdgeInsets.fromLTRB(5, 8, 5, 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    children: [
                      ListTile(
                        leading: Icon(
                          Icons.delete,
                          color: Colors.blue.shade900,
                        ),
                        title: const Text('Delete Account'),
                        trailing: const Icon(
                          Icons.keyboard_arrow_right,
                          color: Color.fromARGB(255, 13, 71, 161),
                        ),
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => DeleteAccountScreen(),
                            ),
                          );
                          // userDelete?.delete();
                          // // ignore: unnecessary_null_comparison
                          // if (uId == null) {
                          //   FirebaseFirestore.instance
                          //       .collection('Users')
                          //       .doc(uId)
                          //       .delete();
                          // }

                          // FirebaseMessaging.instance
                          //     .unsubscribeFromTopic('yumi');
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Container(
          color: Colors.grey[500],
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                icon: const Icon(Icons.home),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HomeScreen()),
                  );
                },
              ),
              IconButton(
                icon: const Icon(Icons.search),
                onPressed: () {
                  // Navigate to search screen
                },
              ),
              IconButton(
                icon: Icon(Icons.person,
                    color: _isTap ? Colors.white : Colors.indigo),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ProfileScreen()),
                  );
                },
              ),
              IconButton(
                icon: const Icon(Icons.settings),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const SettingScreen()),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  showBottomSheet(context) {
    return showModalBottomSheet(
        context: context,
        builder: (Context) {
          return Container(
            padding: const EdgeInsets.all(20),
            height: 200,
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              const Text(
                "please choose image ",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
              InkWell(
                onTap: () async {
                  var picked =
                      // ignore: deprecated_member_use
                      await ImagePicker()
                          .pickImage(source: ImageSource.gallery);
                  if (picked != null) {
                    file = File(picked.path);
                    var rand = Random().nextInt(100000);
                    var imageName = "${rand}" + basename(picked.path);
                    ref = FirebaseStorage.instance
                        .ref("${uId}")
                        .child("${imageName}");
                    await ref.putFile(file!);
                    imageUrl = await ref.getDownloadURL();
                    await FirebaseFirestore.instance
                        .collection("Users")
                        .doc(uId)
                        .collection("Images")
                        .doc(uId)
                        .set({
                      "imageurl": imageUrl,
                    });
                    Navigator.of(context).pop();
                  }
                },
                child: Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(10),
                  child: Row(children: const [
                    Icon(
                      Icons.photo_outlined,
                      size: 30,
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Text(
                      "From Gallery",
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ]),
                ),
              ),
//______________________________________________________________________________
              InkWell(
                onTap: () async {
                  var picked =
                      // ignore: deprecated_member_use
                      await ImagePicker().pickImage(source: ImageSource.camera);
                  if (picked != null) {
                    file = File(picked.path);
                    var rand = Random().nextInt(100000);
                    var imageName = "${rand}" + basename(picked.path);
                    ref = FirebaseStorage.instance
                        .ref("${uId}")
                        .child("${imageName}");
                    await ref.putFile(file!);
                    imageUrl = await ref.getDownloadURL();
                    await FirebaseFirestore.instance
                        .collection("Users")
                        .doc(uId)
                        .collection("Images")
                        .doc(uId)
                        .set({
                      "imageurl": imageUrl,
                    });
                    Navigator.of(context).pop();
                  }
                },
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(10),
                  child: Row(children: const [
                    Icon(
                      Icons.camera,
                      size: 30,
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Text(
                      "From Camera",
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ]),
                ),
              ),
            ]),
          );
        });
  }
}
