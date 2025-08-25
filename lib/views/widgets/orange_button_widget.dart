import 'package:flutter/material.dart';
import 'package:food_delivery/constants/constants.dart';

class OrangeButtonWidget extends StatelessWidget {
  const OrangeButtonWidget({
    super.key,
    required this.onPressed,
    required this.buttontext,
    this.icon = const SizedBox(),
  });

  final VoidCallback onPressed;
  final String buttontext;
  final Widget icon;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 62,
      child: FilledButton(
        onPressed: () {
          onPressed();
        },
        style: FilledButton.styleFrom(
          backgroundColor: AppColors.primaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              buttontext,
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            ), icon,
          ],
        ),
      ),
    );
  }
}
