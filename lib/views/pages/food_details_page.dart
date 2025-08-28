import 'package:flutter/material.dart';
import 'package:food_delivery/constants/constants.dart';
import 'package:food_delivery/views/widgets/card_info_widget.dart';
import 'package:food_delivery/views/widgets/icon_home_widget.dart';
import 'package:food_delivery/views/widgets/navigation_widget.dart';

class FoodDetailsPage extends StatelessWidget {
  const FoodDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    String foodImage = "assets/images/burger_background.webp";
    String foodName = "Burger Bistro";
    String restaurantImage = "assets/images/restaurant1.jpg";
    String restaurantName = "Rose Garden";
    String restaurantRating = "4.7";
    String duration = "20";
    String foodDescription =
        "Maecenas sed diam eget risus varius blandit sit amet non magna. Integer posuere erat a ante venenatis dapibus posuere velit aliquet.";

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            // image
            Stack(
              children: [
                Container(
                  width: double.infinity,
                  height: 321,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(33),
                    image: DecorationImage(
                      image: AssetImage(foodImage),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: NavigationWidget(
                      icon1: Icons.arrow_back_ios,
                      title: SizedBox(),
                      suffixicon: Container(
                        height: 45,
                        width: 45,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white,
                        ),
                        child: IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.favorite,
                            color: AppColors.primaryColor,
                          ),
                          iconSize: 15,
                        ),
                      ),
                      onTapLeadingButton: () => Navigator.pop(context),
                    ),
                  ),
                ),
              ],
            ),
            // padding
            Padding(
              padding: EdgeInsets.all(30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    foodName,
                    style: TextStyle(
                      color: AppColors.homeDark,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 5),
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 11,
                        backgroundImage: AssetImage(restaurantImage),
                      ),
                      SizedBox(width: 10),
                      Text(
                        restaurantName,
                        style: TextStyle(
                          color: AppColors.homeDark,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Row(
                    children: [
                      CardInfoWidget(
                        info: restaurantRating,
                        icon: IconHomeWidget(icon: Icons.star_outline),
                        isBold: true,
                      ),
                      SizedBox(width: 15),
                      CardInfoWidget(
                        info: "Free",
                        icon: IconHomeWidget(
                          icon: Icons.local_shipping_outlined,
                        ),
                        isBold: false,
                      ),
                      SizedBox(width: 15),
                      CardInfoWidget(
                        info: "$duration min",
                        icon: IconHomeWidget(icon: Icons.access_time),
                        isBold: false,
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Text(foodDescription, style: TextStyle(
                    color: Color(0xFFA0A5BA),
                    fontSize: 14,
                  )),
                  SizedBox(height: 20),
                  // Row - to be finished later 
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
