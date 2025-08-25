import 'package:flutter/material.dart';
import 'package:food_delivery/constants/constants.dart';

class CategoryWidget extends StatelessWidget {
  const CategoryWidget({
    super.key,
    required this.text,
    required this.image,
    required this.isSelected,
  });

  final String text;
  final String image;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 20),
      padding: EdgeInsets.symmetric(horizontal: 10),
      height: 60,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(39),
        color: isSelected ? Color(0xFFFFD27C) : Color(0xFFFFFFFF),
      ),
      child: ConstrainedBox(
        constraints: BoxConstraints(minWidth: 100),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              height: 44,
              width: 44,
              decoration: BoxDecoration(shape: BoxShape.circle),
              child: Image.asset(image),
            ),
            Text(
              text,
              style: TextStyle(
                color: AppColors.darkColor,
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
