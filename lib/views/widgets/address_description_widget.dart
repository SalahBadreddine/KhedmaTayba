import 'package:flutter/material.dart';
import 'package:food_delivery/constants/constants.dart';

class AddressDescriptionWidget extends StatelessWidget {
  const AddressDescriptionWidget({
    super.key,
    required this.type,
    required this.address,
  });

  final String type;
  final String address;

  static const Map<String, Widget> typeIcon = {
    "HOME": Icon(Icons.home_outlined, size: 30, color: Color(0xFF2790C3)),
    "WORK": Icon(
      Icons.work_outline_outlined,
      size: 30,
      color: Color(0xFFA03BB1),
    ),
  };
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: AppColors.greyBackgroundColor,
      ),
      padding: EdgeInsets.all(15),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
            ),
            child: typeIcon[type],
          ),
          SizedBox(width: 15),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      type,
                      style: TextStyle(
                        color: AppColors.darkColor,
                        fontSize: 14,
                      ),
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.edit_outlined,
                          color: AppColors.primaryColor,
                          size: 22,
                        ),
                        SizedBox(width: 10),
                        Icon(
                          Icons.delete_outlined,
                          color: AppColors.primaryColor,
                          size: 22,
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Text(
                  address,
                  style: TextStyle(
                    color: Color.fromARGB(255, 147, 152, 171),
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
