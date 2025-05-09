import 'package:flutter/material.dart';
import 'package:nti_figma/features/auth/presentation/login_body.dart';
import '../../core/utils/app_colors.dart';
class Loginscreen extends StatelessWidget {
  Loginscreen({super.key});
 @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldBackground,
      body:LoginBody() ,
    );
  }
}


