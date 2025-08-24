import 'package:flutter/material.dart';
import 'package:food_delivery/constants/classes.dart';

class TextfieldWidget extends StatefulWidget {
  const TextfieldWidget({
    super.key,
    required this.title,
    required this.placeholder,
  });

  final String title;
  final String placeholder;
  @override
  State<TextfieldWidget> createState() => _TextfieldWidgetState();
}

class _TextfieldWidgetState extends State<TextfieldWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(widget.title, style: KTextStyle.TextfieldInfo),
        SizedBox(height: 8),
        TextFormField(
          style: TextStyle(
            color: Color(0xFFA0A5BA),
            fontSize: 14,
          ),
          decoration: InputDecoration(
            hintText: widget.placeholder,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide.none,
            ),
            filled: true,
            fillColor: Color(0xFFF0F5FA),
            contentPadding: EdgeInsets.all(20),
          ),
        ),
      ],
    );
  }
}
