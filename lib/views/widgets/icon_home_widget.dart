import 'package:flutter/material.dart';
import 'package:food_delivery/constants/constants.dart' show AppColors;

class IconHomeWidget extends StatelessWidget {
  const IconHomeWidget({super.key, required this.icon});

  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Icon(
      icon,
      color: AppColors.primaryColor,
      fontWeight: FontWeight.w500,
      size: 25,
    );
  }
}
