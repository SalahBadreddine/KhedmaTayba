import 'package:flutter/material.dart';
import 'package:food_delivery/constants/constants.dart';

class NavigationWidget extends StatelessWidget {
  const NavigationWidget({
    super.key,
    required this.icon1,
    required this.title,
    required this.suffixicon,
    required this.onTapLeadingButton,
  });

  final IconData icon1;
  final Widget title;
  final Widget suffixicon;
  final VoidCallback onTapLeadingButton;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Container(
              margin: EdgeInsets.only(right: 20),
              height: 45,
              width: 45,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Color(0xFFECF0F4),
              ),
              child: IconButton(
                padding: EdgeInsets.all(0),
                constraints: BoxConstraints(),
                onPressed: () {
                  onTapLeadingButton();
                },
                icon: Icon(icon1, fontWeight: FontWeight.bold),
                iconSize: 17,
                color: AppColors.homeDark,
              ),
            ),
            title,
          ],
        ),
        suffixicon,
      ],
    );
  }
}
