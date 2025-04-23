import 'package:flutter/material.dart';
import 'package:nti_figma/Home_Screen.dart';
import 'package:nti_figma/add_task_screen.dart';
import 'package:nti_figma/change_password_screen.dart';
import 'package:nti_figma/profile_screen.dart';
import 'package:nti_figma/register_screen.dart';
import 'package:nti_figma/login_screen.dart';
import 'package:nti_figma/splash_screen.dart';
import 'package:nti_figma/start_screen.dart';
import 'package:nti_figma/utils/app_colors.dart';
import 'package:nti_figma/utils/constant.dart';
import 'package:nti_figma/update_profile_screen.dart';

import 'language_screen.dart';

void main(){
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          scaffoldBackgroundColor: AppColors.scaffoldBackground,
          fontFamily: AppConstants.fontFamily
      ),
      debugShowCheckedModeBanner: false,
      routes: {
        "RegisterScreen" :(context)=> RegisterScreen(),
        "LoginScreen": (context)=> Loginscreen(),
        "HomeScreen": (context)=> HomeScreen(),
        "ProfileScreen": (context)=> ProfileScreen(),
        "UpdateProfile": (context)=> UpdateProfile(),
        "ChangePassword": (context)=> ChangePassword(),
        "Language": (context)=> Language(),
        "AddTask":(context)=>AddTask(),
      },
      home: Splash(),
    );
  }
}