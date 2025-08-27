import 'package:flutter/material.dart';
import 'package:food_delivery/constants/constants.dart';
import 'package:food_delivery/views/widgets/icon_home_widget.dart';

class CardInfoWidget extends StatelessWidget {
  const CardInfoWidget({
    super.key,
    required this.info,
    required this.icon,
    this.isBold = false,
  });

  final String info;
  final IconHomeWidget icon;
  final bool isBold;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 20.0),
      child: Row(
        children: [
          icon,
          SizedBox(width: 3),
          Text(
            info,
            style: TextStyle(
              color: AppColors.homeDark,
              fontSize: 16,
              fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }
}
