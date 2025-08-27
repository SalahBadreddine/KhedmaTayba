import 'package:flutter/material.dart';
import 'package:food_delivery/constants/constants.dart';

class HomeSelectionWidget extends StatelessWidget {
  const HomeSelectionWidget({
    super.key,
    required this.selectedInfo,
    required this.isSeeAll,
  });

  final String selectedInfo;
  final bool isSeeAll;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          selectedInfo == "All" ? "All Categories" : selectedInfo,
          style: TextStyle(color: AppColors.darkColor, fontSize: 20),
        ),
        isSeeAll ?
        TextButton(
          style: TextButton.styleFrom(
            padding: EdgeInsets.zero,
          ),
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
        ) : SizedBox(),
      ],
    );
  }
}
