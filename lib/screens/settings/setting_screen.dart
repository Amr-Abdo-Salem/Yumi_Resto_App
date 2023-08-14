import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import '../home/Home_Screen.dart';
import '../profile/profile_screen.dart';
import '../updates/update1.dart';

//import 'package:cloud_firestore/cloud_firestore.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

bool _isTap = false;
var phone = FirebaseFirestore.instance.collection("Users").path;

class _SettingScreenState extends State<SettingScreen> {
  var user = FirebaseAuth.instance.currentUser?.email;
  final String uId = "${FirebaseAuth.instance.currentUser?.uid}";
  CollectionReference userref = FirebaseFirestore.instance.collection("Users");

  void initstate() {
    super.initState();
  }

  getData() async {
    // CollectionReference usersref =
    //     FirebaseFirestore.instance.collection('users');
    // await usersref
    //     .where(
    //       "email",
    //       isEqualTo: user,
    //     )
    //     .get()
    //     .then((value) => value.docs.forEach((element) {
    //           print(element.get("PhoneNumber"));
    //         }));

    FutureBuilder(
      future: userref.doc(uId).get(),
      builder: (context, snapshot) {
        return Text("${snapshot.data!['Phone Number']}");
      },
    );
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
            size: 30,
          ),
        ),
        elevation: 10,
        title: const Text(
          'Settings',
          style: TextStyle(
            fontSize: 30,
            color: Colors.white,
            letterSpacing: 3,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                "common",
                style: TextStyle(color: Colors.grey.shade700),
              ),
            ),
            Card(
              elevation: 4,
              color: Colors.grey[300],
              margin: const EdgeInsets.fromLTRB(5, 8, 5, 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                children: [
                  ListTile(
                    leading: Icon(
                      Icons.language,
                      color: Colors.blue.shade900,
                    ),
                    title: const Text('Language'),
                    trailing: const Text(
                      "English",
                      style: TextStyle(color: Colors.grey),
                    ),
                  ),
                  Container(
                    color: Colors.grey[100],
                    width: double.infinity,
                    height: 1,
                  ),
                  ListTile(
                    leading: Icon(
                      Icons.cloud,
                      color: Colors.blue.shade900,
                    ),
                    title: const Text('Environment'),
                    trailing: const Text(
                      "Production",
                      style: TextStyle(color: Colors.grey),
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    height: 1,
                    color: Colors.grey[100],
                  ),
                  ListTile(
                    leading: Icon(
                      Icons.devices,
                      color: Colors.blue.shade900,
                    ),
                    title: const Text('Platform'),
                    trailing: const Text(
                      "Default",
                      style: TextStyle(color: Colors.grey),
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    height: 1,
                    color: Colors.grey[100],
                  ),
                  SwitchListTile(
                      activeColor: Color(0xFF8BC34A),
                      secondary: Icon(
                        Icons.format_paint,
                        color: Colors.blue.shade900,
                      ),
                      title: const Text('Enable custom theme'),
                      value: false,
                      onChanged: (bool value) {}),
                ],
              ),
            ),
            const SizedBox(height: 40),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                "Contact us",
                style: TextStyle(color: Colors.grey.shade700),
              ),
            ),
            Card(
              elevation: 4,
              color: Colors.grey[300],
              margin: const EdgeInsets.fromLTRB(5, 8, 5, 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                children: [
                  ListTile(
                    leading: Icon(
                      Icons.phone,
                      color: Colors.blue.shade900,
                    ),
                    title: const Text('Phone number'),
                    subtitle: StreamBuilder(
                      stream: userref.doc(uId).snapshots(),
                      builder: (context, snapshot) {
                        return Text("${snapshot.data?['PhoneNumber']}");
                      },
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    height: 1,
                    color: Colors.grey[100],
                  ),
                  ListTile(
                    leading: Icon(
                      Icons.email,
                      color: Colors.blue.shade900,
                    ),
                    title: const Text('Email'),
                    subtitle: Text(
                      "${user}",
                      style: const TextStyle(color: Colors.grey),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 40),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                "Security",
                style: TextStyle(color: Colors.grey.shade700),
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
                  SwitchListTile(
                      activeColor: Color(0xFF8BC34A),
                      secondary: Icon(
                        Icons.screen_lock_portrait_sharp,
                        color: Colors.blue.shade900,
                      ),
                      title: const Text(
                        'Lock app in packground',
                        style: TextStyle(fontSize: 14),
                      ),
                      value: true,
                      onChanged: (bool value) {}),
                  Container(
                    width: double.infinity,
                    height: 1,
                    color: Colors.grey[100],
                  ),
                  SwitchListTile(
                      activeColor: Color(0xFF8BC34A),
                      secondary: Icon(
                        Icons.fingerprint,
                        color: Colors.blue.shade900,
                      ),
                      title: const Text('Use fingerprint'),
                      value: true,
                      onChanged: (bool value) {}),
                ],
              ),
            ),
            const SizedBox(height: 40),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                "Allow application to stored fingerprint IDs",
                style: TextStyle(color: Colors.grey.shade700),
              ),
            ),
            Card(
              elevation: 4,
              color: Colors.grey[300],
              margin: const EdgeInsets.fromLTRB(5, 8, 5, 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const UpdatePasswordScreen(),
                        ),
                      );
                    },
                    child: const ListTile(
                      leading: Icon(
                        Icons.password,
                        color: Color.fromARGB(255, 2, 78, 139),
                      ),
                      title: Text('Change password'),
                      trailing: Icon(
                        Icons.arrow_right,
                        color: Color.fromARGB(255, 2, 78, 139),
                      ),
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    height: 1,
                    color: Colors.grey[100],
                  ),
                  SwitchListTile(
                      activeColor: Color(0xFF8BC34A),
                      secondary: Icon(
                        Icons.notifications_active,
                        color: Colors.blue.shade900,
                      ),
                      title: const Text('Enable notifications'),
                      value: true,
                      onChanged: (bool value) {}),
                ],
              ),
            ),
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
                icon: Icon(Icons.home),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HomeScreen()),
                  );
                },
              ),
              IconButton(
                icon: Icon(Icons.search),
                onPressed: () {
                  // Navigate to search screen
                },
              ),
              IconButton(
                icon: Icon(Icons.person),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ProfileScreen()),
                  );
                },
              ),
              IconButton(
                icon: Icon(Icons.settings,
                    color: _isTap ? Colors.white : Colors.indigo),
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
}
