import 'package:flutter/material.dart';
import 'package:food_delivery/constants/constants.dart';

class YouChatbubbleWidget extends StatelessWidget {
  const YouChatbubbleWidget({
    super.key,
    required this.text,
    required this.time,
    this.isRecieved = false,
  });

  final String text;
  final String time;
  final bool isRecieved;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 25.0),
              child: Text(
                time,
                style: TextStyle(color: Color(0xFFABABAB), fontSize: 12),
              ),
            ),
            SizedBox(height: 3),
            Row(
              children: [
                Icon(
                  Icons.done_all,
                  color: isRecieved ? AppColors.primaryColor : Color(0xFFCACACA),
                  fontWeight: FontWeight.bold,
                  size: 16,
                ),
                SizedBox(width: 5),
                Container(
                  constraints: BoxConstraints(
                    maxWidth: MediaQuery.of(context).size.width * 0.6,
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: AppColors.primaryColor,
                  ),
                  child: Text(
                    text,
                    style: TextStyle(color: Colors.white, fontSize: 14),
                    softWrap: true,
                  ),
                ),
              ],
            ),
          ],
        ),
        SizedBox(width: 10),
        Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
              image: AssetImage("assets/images/ME.jpg"),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ],
    );
  }
}
