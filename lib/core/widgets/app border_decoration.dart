import 'package:flutter/material.dart';

import '../utils/app_colors.dart';

abstract class AppBorderDecoration {
  static const double _radius = 20;
  static const Color _borderColor = AppColors.lightGrey;
  static const Color _errorColor = Colors.red;

  static final OutlineInputBorder enabledBorder = OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(_radius)),
    borderSide: BorderSide(color: _borderColor),
  );

  static final OutlineInputBorder disabledBorder = OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(_radius)),
    borderSide: BorderSide(color: _borderColor),
  );

  static final OutlineInputBorder errorBorder = OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(_radius)),
    borderSide: BorderSide(color: _errorColor),
  );
}
