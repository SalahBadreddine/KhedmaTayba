import 'package:flutter/material.dart';
import 'package:food_delivery/constants/constants.dart';
import 'package:food_delivery/views/widgets/card_info_widget.dart';
import 'package:food_delivery/views/widgets/food_card_widget.dart';
import 'package:food_delivery/views/widgets/home_selection_widget.dart';
import 'package:food_delivery/views/widgets/icon_home_widget.dart';
import 'package:food_delivery/views/widgets/keyword_scroll_widget.dart';
import 'package:food_delivery/views/widgets/navigation_widget.dart';

class RestaurantDetailsPage extends StatefulWidget {
  const RestaurantDetailsPage({super.key});

  @override
  State<RestaurantDetailsPage> createState() => _RestaurantDetailsPageState();
}

class _RestaurantDetailsPageState extends State<RestaurantDetailsPage> {
  int selection = 0;
  int foodQuantity = 1;
  int selectedFood = 0;
  // int NumAvailable -> available food in this category

  @override
  Widget build(BuildContext context) {
    String restaurantImage = "assets/images/restaurant1.jpg";
    String restaurantName = "Aldenaire Catering";
    String restaurantRating = "4.7";
    String duration = "20";
    String restaurantDescription =
        "Maecenas sed diam eget risus varius blandit sit amet non magna. Integer posuere erat a ante venenatis dapibus posuere velit aliquet.";
    List<String> keywords = ["Burger", "Sandwich", "Pizza", "Salade"];
    List<List<String>> CategoryFoods = [
      // is used in Popular fast food, unlimited suggestions
      ["assets/images/burger.png", "American Burger", "America's Burger", "70"],
      ["assets/images/pizza.png", "European Pizza", "Pansi Restaurant", "40"],
      ["assets/images/hotdog.png", "German Hot Dog", "The Grill", "55"],
      ["assets/images/hotdog.png", "Algerian Hot Dog", "Signature", "100"],
    ];

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            // image
            // TODO: implement scroll functionality
            Stack(
              children: [
                Container(
                  width: double.infinity,
                  height: 321,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(33),
                    image: DecorationImage(
                      image: AssetImage(restaurantImage),
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
                            Icons.more_horiz,
                            color: AppColors.homeDark,
                          ),
                          iconSize: 20,
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
                  SizedBox(height: 15),
                  Text(
                    restaurantName,
                    style: TextStyle(
                      color: AppColors.homeDark,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    restaurantDescription,
                    style: TextStyle(color: Color(0xFFA0A5BA), fontSize: 14),
                  ),
                  SizedBox(height: 20),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: List.generate(keywords.length, (index) {
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedFood = index;
                            });
                          },
                          child: KeywordScrollWidget(
                            title: keywords.elementAt(index),
                            isSelected: selectedFood == index,
                          ),
                        );
                      }),
                    ),
                  ),
                  SizedBox(height: 30),
                  HomeSelectionWidget(
                    selectedInfo: "${keywords.elementAt(selectedFood)} (10)",
                    isSeeAll: false,
                  ),
                  SizedBox(height: 20),
                  GridView.builder(
                    padding: EdgeInsets.zero,
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: CategoryFoods.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2, // 2 items per row
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 20,
                      childAspectRatio: 153 / 170, // keep consistent card shape
                    ),
                    itemBuilder: (context, index) {
                      return FoodCardWidget(
                        image: CategoryFoods.elementAt(index).elementAt(0),
                        foodName: CategoryFoods.elementAt(index).elementAt(1),
                        restaurantName: CategoryFoods.elementAt(
                          index,
                        ).elementAt(2),
                        foodPrice: CategoryFoods.elementAt(index).elementAt(3),
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
