import 'package:flutter/material.dart';
import 'package:food_delivery/constants/constants.dart';

class KTextStyle {
  static const TextStyle title = TextStyle(
    color: Color(0xFFFFFFFF),
    fontSize: 30,
    fontWeight: FontWeight.w900,
  );

  static const TextStyle subtitle = TextStyle(
    color: Color(0xFFFFFFFF),
    fontSize: 16,
    fontWeight: FontWeight.normal,
  );

  static const TextStyle TextfieldInfo = TextStyle(
    color: AppColors.darkColor,
    fontSize: 13,
    fontWeight: FontWeight.normal,
  );

  static const TextStyle dropButtonTextStyle = TextStyle(
    color: AppColors.homeDark,
    fontSize: 15,
    fontWeight: FontWeight.bold,
  );

  static const TextStyle FilterTitle = TextStyle(
    color: AppColors.homeDark,
    fontSize: 13,
  );

  static const selectedTextStyle = TextStyle(
    color: AppColors.primaryColor,
    fontSize: 14,
    fontWeight: FontWeight.bold,
  );

  static const unselectedTextStyle = TextStyle(
    color: Color(0xFFA5A7B9),
    fontSize: 14,
    fontWeight: FontWeight.normal,
  );
}
