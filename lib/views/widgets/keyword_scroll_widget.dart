import 'package:flutter/material.dart';
import 'package:food_delivery/constants/constants.dart';

class KeywordScrollWidget extends StatelessWidget {
  const KeywordScrollWidget({
    super.key,
    required this.title,
    required this.isSelected,
  });

  final String title;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 10),
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      decoration: BoxDecoration(
        color: isSelected ? AppColors.orangeColor : Colors.white,
        borderRadius: BorderRadius.circular(33),
        border: Border.all(color: isSelected ? Colors.white : AppColors.greyColor, width: 2),
      ),
      child: Text(
        title,
        style: TextStyle(
          color: isSelected ? Colors.white : AppColors.homeDark,
          fontSize: 16,
        ),
      ),
    );
  }
}
