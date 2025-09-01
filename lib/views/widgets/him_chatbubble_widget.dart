import 'package:flutter/material.dart';
import 'package:food_delivery/constants/constants.dart';

class HimChatbubbleWidget extends StatelessWidget {
  const HimChatbubbleWidget({
    super.key,
    required this.text,
    required this.time,
  });

  final String text;
  final String time;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
              image: AssetImage("assets/images/deliveryman.jpg"),
              fit: BoxFit.cover,
            ),
          ),
        ),
        SizedBox(width: 10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              time,
              style: TextStyle(color: Color(0xFFABABAB), fontSize: 12),
            ),
            SizedBox(height: 3),
            SizedBox(width: 5),
            Container(
              constraints: BoxConstraints(
                maxWidth: MediaQuery.of(context).size.width * 0.6,
              ),
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: AppColors.greyBackgroundColor,
              ),
              child: Text(
                text,
                style: TextStyle(color: AppColors.darkColor, fontSize: 14),
                softWrap: true,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
