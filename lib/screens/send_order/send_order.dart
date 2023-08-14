import 'dart:convert';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class SendOrderScreen extends StatefulWidget {
  const SendOrderScreen({super.key});

  @override
  State<SendOrderScreen> createState() => _SendOrderScreenState();
}

class _SendOrderScreenState extends State<SendOrderScreen> {
  var serverToken =
      "AAAAaQEzGlA:APA91bFoVmXjwkUbXijVEdzfWZ_CoWHlA9ATSkQGVmqutH8SYgZ_LB-SP7zN7Obz0ZsUGVmK6TV-Rh7H6l8gt1XU-vkQupWzrSGQPC0O7dAXHmmBVem7aPJdedZwh8ITkmI2M0FCr6qt";
  sendNotificatin(String title, String body, String id) async {
    await http.post(
      Uri.parse('https://fcm.googleapis.com/fcm/send'),
      headers: <String, String>{
        'Content-Type': 'application/json',
        'Authorization': 'key=$serverToken',
      },
      body: jsonEncode(
        <String, dynamic>{
          'notification': <String, dynamic>{
            'body': 'this is a body',
            'title': 'this is a title'
          },
          'priority': 'high',
          'data': <String, dynamic>{
            'click_action': 'FLUTTER_NOTIFICATION_CLICK',
            'id': '1',
            'status': 'done'
          },
          'to': await FirebaseMessaging.instance.getToken(),
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        elevation: 10,
        color: Colors.grey[500],
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
          ),
          child: MaterialButton(
            onPressed: () {
              sendNotificatin("Mack", "Checken", "1");
            },
            child: Text(
              'Check Out',
              style: TextStyle(
                fontSize: 35,
                color: Colors.black,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
