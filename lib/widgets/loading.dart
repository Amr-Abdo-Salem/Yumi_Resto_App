import 'package:flutter/material.dart';

showloading(context) {
  return showDialog(
      context: context,
      builder: (context) {
        return const AlertDialog(
          title: Text(
            'Please wait',
            style: TextStyle(
                color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),
          ),
          content: SizedBox(
            height: 50,
            child: Center(
              child: CircularProgressIndicator(
                color: Colors.blue,
                strokeWidth: 10.0,
              ),
            ),
          ),
        );
      });
}
