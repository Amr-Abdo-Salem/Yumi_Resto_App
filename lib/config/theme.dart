import 'package:flutter/material.dart';

ThemeData theme(){
  return ThemeData(
 primaryColor: Colors.white,
 primaryColorDark: const Color.fromARGB(0, 54, 66, 88),
 primaryColorLight: Colors.grey,
 scaffoldBackgroundColor: Colors.blueAccent,
 backgroundColor: Colors.cyan ,
 fontFamily: '' ,
textTheme:const TextTheme(headline1:TextStyle(
 color:Colors.cyanAccent,
 fontWeight: FontWeight.bold,
 fontSize: 36,

) ,
headline2:TextStyle(
 color:Colors.cyanAccent,
 fontWeight: FontWeight.bold,
 fontSize: 30,

),

headline3:TextStyle(
 color:Colors.cyanAccent,
 fontWeight: FontWeight.bold,
 fontSize: 24,

),
headline4:TextStyle(
 color:Colors.cyanAccent,
 fontWeight: FontWeight.bold,
 fontSize: 20,

),
headline5:TextStyle(
 color:Colors.cyanAccent,
 fontWeight: FontWeight.bold,
 fontSize: 16,

),
headline6:TextStyle(
 color:Colors.cyanAccent,
 fontWeight: FontWeight.normal,
 fontSize: 10,
),

) 
);
}