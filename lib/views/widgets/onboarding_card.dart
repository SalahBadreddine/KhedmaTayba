import 'package:flutter/material.dart';

class OnboardingCard extends StatelessWidget {
  const OnboardingCard({
    super.key,
    required this.title,
    required this.description,
    required this.image,
  });

  final String title;
  final String description;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 50.0),
      child: Column(
        children: [
          Image.asset(image,
          height: 292,
          width: 240
          ),
          Text(title, style: TextStyle(
            fontFamily: "Sen",
            fontWeight: FontWeight.w900,
            fontSize: 24.0,
          )),
          Text(description, style: TextStyle(
            fontFamily: "Sen",
            fontWeight: FontWeight.normal,
            fontSize: 16.0,
          ),
          textAlign: TextAlign.center,)
        ],
      ),
    );
  }
}
