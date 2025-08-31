import 'package:flutter/material.dart';
import 'package:food_delivery/constants/constants.dart';

class AddCardTextfieldWidget extends StatefulWidget {
  const AddCardTextfieldWidget({
    super.key,
    required this.title,
    this.initialValue = "",
    this.hintText = "",
  });
  final String title;
  final String initialValue;
  final String hintText;

  @override
  State<AddCardTextfieldWidget> createState() => _AddCardTextfieldWidgetState();
}

class _AddCardTextfieldWidgetState extends State<AddCardTextfieldWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.title,
          style: TextStyle(color: AppColors.iconColor, fontSize: 14),
        ),
        SizedBox(height: 10),
        TextFormField(
          style: TextStyle(color: AppColors.darkColor, fontSize: 16),
          decoration: InputDecoration(
            fillColor: AppColors.greyBackgroundColor,
            filled: true,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide.none,
            ),
            contentPadding: EdgeInsets.all(20),
            hintText: widget.hintText,
            hintStyle: TextStyle(
              color: AppColors.iconColor,
              fontSize: 16,
            )
          ),
          initialValue: widget.initialValue,
        ),
      ],
    );
  }
}
