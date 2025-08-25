import 'package:flutter/material.dart';
import 'package:food_delivery/constants/classes.dart';

class PageTitleWidget extends StatelessWidget {
  const PageTitleWidget({
    super.key,
    required this.title,
    required this.subtitle,
  });

  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(title, style: KTextStyle.title),
        Text(
          subtitle,
          style: KTextStyle.subtitle,
        ),
      ],
    );
  }
}
