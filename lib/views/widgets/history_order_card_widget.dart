import 'package:flutter/material.dart';
import 'package:food_delivery/constants/constants.dart';
import 'package:food_delivery/views/pages/track_order_page.dart';

class HistoryOrderCardWidget extends StatelessWidget {
  const HistoryOrderCardWidget({
    super.key,
    required this.foodtype,
    required this.foodImage,
    required this.restaurantName,
    required this.price,
    required this.items,
    required this.id,
    required this.isCompleted,
  });

  final String foodtype;
  final String foodImage;
  final String restaurantName;
  final String price;
  final int items;
  final String id;
  final bool isCompleted;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                foodtype,
                style: TextStyle(color: AppColors.homeDark, fontSize: 14),
              ),
              SizedBox(width: 20,),
              isCompleted
                  ? Text(
                      "Completed",
                      style: TextStyle(
                        color: Color(0xFF059C6A),
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  : Text(
                      "Canceled",
                      style: TextStyle(
                        color: Color(0xFFFF0000),
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
            ],
          ),
          SizedBox(height: 10),
          Divider(color: Color(0xFFEEF2F6), thickness: 2),
          SizedBox(height: 10),
          Column(
            spacing: 20,
            children: [
              ListTile(
                contentPadding: EdgeInsets.all(0),
                leading: Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    image: DecorationImage(
                      image: AssetImage(foodImage),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                title: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      restaurantName,
                      style: TextStyle(
                        color: AppColors.homeDark,
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        Text(
                          "\$$price",
                          style: TextStyle(
                            color: AppColors.homeDark,
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(width: 10),
                        Container(
                          height: 16,
                          width: 1,
                          color: Color(0xFFCACCDA),
                        ),
                        SizedBox(width: 10),
                        Text(
                          "0${items.toString()} Items",
                          style: TextStyle(
                            color: Color(0xFF6B6E82),
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                trailing: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      id,
                      style: TextStyle(
                        color: Color(0xFF6B6E82),
                        fontSize: 14,
                        decoration: TextDecoration.underline,
                        decorationColor: Color(0xFF6B6E82),
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return TrackOrderPage();
                        },
                      ),
                    ),
                    child: Container(
                      width: 139,
                      height: 38,
                      decoration: BoxDecoration(
                        color: AppColors.primaryColor,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Center(
                        child: Text(
                          "Rate",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: 139,
                    height: 38,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: AppColors.primaryColor,
                        width: 1,
                      ),
                    ),
                    child: Center(
                      child: Text(
                        "Re-Order",
                        style: TextStyle(
                          color: AppColors.primaryColor,
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
