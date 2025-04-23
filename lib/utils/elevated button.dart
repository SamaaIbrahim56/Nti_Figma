import 'package:flutter/material.dart';
import 'package:nti_figma/utils/app_colors.dart';
abstract class GreenElevatedButton{
  static const Color background = AppColors.backgroundButtom;
  static const Color foreground = AppColors.white;
  static const double width= 331;
  static const double height= 50;
  static ElevatedButton create({
    required Widget child,
    required VoidCallback onPressed,
  }) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: background,
        foregroundColor: foreground,
        minimumSize: Size(width, height),
        shadowColor: Colors.black.withOpacity(0.25),
        elevation: 4,
      ),
      onPressed: onPressed,
      child: child,
    );
  }
}