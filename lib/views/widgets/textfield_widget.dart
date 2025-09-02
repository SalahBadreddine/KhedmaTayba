import 'package:flutter/material.dart';
import 'package:food_delivery/constants/classes.dart';

class TextfieldWidget extends StatefulWidget {
  const TextfieldWidget({
    super.key,
    required this.title,
    required this.placeholder,
    required this.isPassword,
    this.leadingIcon,
  });

  final String title;
  final String placeholder;
  final bool isPassword;
  final Widget? leadingIcon;

  @override
  State<TextfieldWidget> createState() => _TextfieldWidgetState();
}

class _TextfieldWidgetState extends State<TextfieldWidget> {
  late bool obscureText = widget.isPassword ? true : false;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(widget.title, style: KTextStyle.TextfieldInfo),
        SizedBox(height: 8),
        TextFormField(
          style: TextStyle(color: Color(0xFFA0A5BA), fontSize: 14),
          obscureText: obscureText,
          decoration: InputDecoration(
            prefixIcon: widget.leadingIcon,
            hintText: widget.placeholder,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide.none,
            ),
            filled: true,
            fillColor: Color(0xFFF0F5FA),
            contentPadding: EdgeInsets.all(20),
            suffixIcon: widget.isPassword
                ? IconButton(
                    icon: Icon(
                      obscureText ? Icons.visibility_off : Icons.visibility,
                      color: Color(0xFFA0A5BA),
                    ),
                    onPressed: () {
                      setState(() {
                        obscureText = !obscureText; // toggle visibility
                      });
                    },
                  )
                : null,
          ),
        ),
      ],
    );
  }
}
