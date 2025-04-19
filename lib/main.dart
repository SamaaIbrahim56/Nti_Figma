import 'package:flutter/material.dart';
import 'package:nti_figma/Home_Screen.dart';
import 'package:nti_figma/LoginScreen.dart';

void main(){
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        "RegisterScreen" :(context)=> HomeScreen(),
        "LoginScreen": (context)=> Loginscreen(),
      },
      home: HomeScreen(),
    );
  }
}