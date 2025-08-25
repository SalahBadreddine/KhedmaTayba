import 'package:flutter/material.dart';
import 'package:food_delivery/constants/constants.dart';

class HomeSelectionWidget extends StatelessWidget {
  const HomeSelectionWidget({super.key, required this.selectedCtegory});

  final String selectedCtegory;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          selectedCtegory == "All" ? "All Categories" : selectedCtegory,
          style: TextStyle(color: AppColors.darkColor, fontSize: 20),
        ),
        TextButton(
          onPressed: () {},
          child: Row(
            children: [
              Text(
                "See All",
                style: TextStyle(color: Color(0xFF333333), fontSize: 16),
              ),
              SizedBox(width: 5),
              Icon(Icons.arrow_forward_ios, color: AppColors.iconColor),
            ],
          ),
        ),
      ],
    );
  }
}
