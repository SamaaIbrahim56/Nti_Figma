import 'package:flutter/material.dart';
import '../utils/app_colors.dart';
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
        shadowColor: AppColors.backgroundButtom,
        elevation: 10,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(14),
        ),
      ),
      onPressed: onPressed,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12,horizontal: 8),
        child: child,
      ),
    );
  }
}