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
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      margin: EdgeInsets.only(right: 10),
      decoration: BoxDecoration(
        color: isSelected ? AppColors.orangeColor : Colors.white,
        borderRadius: BorderRadius.circular(33),
        border: Border.all(color: Color(0xFFEDEDED), width: isSelected ? 0 : 2),
      ),
      child: Text(
        title,
        style: TextStyle(color: isSelected ? Colors.white : AppColors.homeDark, fontSize: 16),
      ),
    );
  }
}
