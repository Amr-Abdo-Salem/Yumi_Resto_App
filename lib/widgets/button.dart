// import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

// class ButtonWidget extends StatelessWidget {
//   final String buttonText;
//   final VoidCallback onPressed;
//   final Widget backgroundColor;
//
//   ButtonWidget({required this.buttonText, required this.onPressed, required this.backgroundColor});
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialButton(
//       shape: const RoundedRectangleBorder(
//         borderRadius: BorderRadius.only(topLeft: Radius.circular(25), bottomRight: Radius.circular(25)),
//         side: BorderSide(color: Colors.greenAccent),
//       ),
//       padding: const EdgeInsets.all(15),
//       onPressed: onPressed,
//       child: Container(
//         decoration: const BoxDecoration(
//           gradient: LinearGradient(
//             colors: [Colors.red, Colors.blue],
//             begin: Alignment.topLeft,
//             end: Alignment.bottomRight,
//           ),
//           borderRadius: BorderRadius.only(topLeft: Radius.circular(25), bottomRight: Radius.circular(25)),
//         ),
//         padding: const EdgeInsets.all(15),
//         child: Text(buttonText),
//       ),
//     );
//   }
// }

class SignInButtonWidget extends StatelessWidget {
  final String text;
  final VoidCallback ontap;

  SignInButtonWidget({
    required this.text,
    required this.ontap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(5.0)),
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Color(0xFFfbab66),
          ),
          BoxShadow(
            color: Color(0xFFf7418c),
          ),
        ],
        gradient: LinearGradient(
            colors: [Color(0xFFf7418c), Color(0xFFfbab66)],
            begin: FractionalOffset(0.2, 0.2),
            end: FractionalOffset(1.0, 1.0),
            stops: [0.0, 1.0],
            tileMode: TileMode.clamp),
      ),
      child: MaterialButton(
          highlightColor: Colors.transparent,
          splashColor: Color(0xFFf7418c),
          child: Text(
            text,
            style: TextStyle(
                color: Colors.white,
                fontSize: 25.0,
                fontFamily: "WorkSansBold"),
          ),
          onPressed: ontap),
    );
  }
}
