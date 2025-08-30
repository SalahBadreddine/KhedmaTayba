import 'package:flutter/material.dart';
import 'package:food_delivery/views/pages/restaurant_details_page.dart';
import 'package:food_delivery/views/widgets/card_info_widget.dart';
import 'package:food_delivery/views/widgets/icon_home_widget.dart';

class RestaurantCardWidget extends StatelessWidget {
  const RestaurantCardWidget({
    super.key,
    required this.image,
    required this.name,
    required this.types,
    required this.rating,
    required this.time,
  });
  final String image;
  final String name;
  final List<String> types;
  final String rating;
  final String time;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) {
            return RestaurantDetailsPage();
          },
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(bottom: 25.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 137,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                image: DecorationImage(
                  image: AssetImage(image),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(height: 8),
            Text(
              name,
              style: TextStyle(
                color: Color(0xFF181C2E),
                fontSize: 20,
                fontWeight: FontWeight.normal,
              ),
            ),
            Row(
              children: List.generate(types.length, (index) {
                return index < types.length - 1
                    ? Text(
                        "${types.elementAt(index)} - ",
                        style: TextStyle(
                          color: Color(0xFFA0A5BA),
                          fontSize: 14,
                        ),
                      )
                    : Text(
                        types.elementAt(index),
                        style: TextStyle(
                          color: Color(0xFFA0A5BA),
                          fontSize: 14,
                        ),
                      );
              }),
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                CardInfoWidget(
                  info: rating,
                  icon: IconHomeWidget(icon: Icons.star_outline),
                  isBold: true,
                ),
                CardInfoWidget(
                  info: "Free",
                  icon: IconHomeWidget(icon: Icons.local_shipping_outlined),
                ),
                CardInfoWidget(
                  info: "$time min",
                  icon: IconHomeWidget(icon: Icons.access_time),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
