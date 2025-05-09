import 'package:flutter/material.dart';
import 'package:nti_figma/features/auth/presentation/register_body.dart';
import '../../core/utils/app_colors.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:AppColors.scaffoldBackground,
      body: RegisterBody(),
    );
  }
}


