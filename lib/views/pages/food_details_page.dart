import 'package:flutter/material.dart';
import 'package:food_delivery/constants/constants.dart';
import 'package:food_delivery/views/widgets/card_info_widget.dart';
import 'package:food_delivery/views/widgets/icon_home_widget.dart';
import 'package:food_delivery/views/widgets/navigation_widget.dart';
import 'package:food_delivery/views/widgets/orange_button_widget.dart';

class FoodDetailsPage extends StatefulWidget {
  const FoodDetailsPage({super.key});

  @override
  State<FoodDetailsPage> createState() => _FoodDetailsPageState();
}

class _FoodDetailsPageState extends State<FoodDetailsPage> {
  int selection = 0;
  int foodQuantity = 1;
  
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
    List<String> sizes = ["10", "14", "16"];
    List<List<dynamic>> ingrediants = [
      [Icons.restaurant_outlined, "Salt"],
      [Icons.fastfood_outlined, "Chicken"],
      [Icons.local_dining_outlined, "Onion"],
      [Icons.food_bank_outlined, "Garlic"],
      [Icons.kitchen_outlined, "Pappers"],
    ];
    String foodPrice = "32";

    return Scaffold(
      bottomNavigationBar: Container(
        height: 184,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: Color(0xFFF0F5FA),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 30.0,
                vertical: 15,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "\$$foodPrice",
                    style: TextStyle(color: AppColors.homeDark, fontSize: 28),
                  ),
                  Container(
                    width: 125,
                    height: 48,
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: Color(0xFF121223),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: 24,
                          height: 24,
                          decoration: BoxDecoration(
                            color: Color.fromARGB(255, 44, 44, 55),
                            shape: BoxShape.circle,
                          ),
                          child: IconButton(
                            onPressed: () {
                              setState(() {
                                if (foodQuantity > 1) {
                                  foodQuantity--;
                                }
                              });
                            },
                            icon: Icon(
                              Icons.remove,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                            padding: EdgeInsets.zero,
                            iconSize: 15,
                          ),
                        ),
                        Text(
                          foodQuantity.toString(),
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Container(
                          width: 24,
                          height: 24,
                          decoration: BoxDecoration(
                            color: Color.fromARGB(255, 44, 44, 55),
                            shape: BoxShape.circle,
                          ),
                          child: IconButton(
                            onPressed: () {
                              setState(() {
                                foodQuantity++;
                              });
                            },
                            icon: Icon(
                              Icons.add,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                            padding: EdgeInsets.zero,
                            iconSize: 15,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
              child: OrangeButtonWidget(
                onPressed: () {},
                buttontext: "ADD TO CART",
              ),
            ),
          ],
        ),
      ),
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
                  Text(
                    foodDescription,
                    style: TextStyle(color: Color(0xFFA0A5BA), fontSize: 14),
                  ),
                  SizedBox(height: 20),
                  Row(
                    children: [
                      Text(
                        "SIZE:",
                        style: TextStyle(
                          color: Color(0xFFA0A5BA),
                          fontSize: 14,
                        ),
                      ),
                      SizedBox(width: 20),
                      ...List.generate(3, (index) {
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              selection = index;
                            });
                          },
                          child: Container(
                            width: 48,
                            height: 48,
                            margin: EdgeInsets.only(right: 10),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: selection == index
                                  ? Color(0xFFF58D1D)
                                  : Color(0xFFF0F5FA),
                            ),
                            child: Center(
                              child: Text(
                                '${sizes.elementAt(index)}"',
                                style: TextStyle(
                                  color: selection == index
                                      ? Colors.white
                                      : AppColors.homeDark,
                                  fontSize: 16,
                                  fontWeight: selection == index
                                      ? FontWeight.bold
                                      : FontWeight.normal,
                                ),
                              ),
                            ),
                          ),
                        );
                      }),
                    ],
                  ),
                  SizedBox(height: 15),
                  Text(
                    "INGRIDIENTS",
                    style: TextStyle(color: AppColors.homeDark, fontSize: 13),
                  ),
                  SizedBox(height: 15),
                  Wrap(
                    spacing: 20,
                    direction: Axis.horizontal,
                    children: List.generate(5, (index) {
                      return Column(
                        children: [
                          Container(
                            width: 50,
                            height: 50,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Color(0xFFFFEBE4),
                            ),
                            child: Center(
                              child: Icon(
                                ingrediants.elementAt(index).elementAt(0),
                                color: AppColors.primaryColor,
                              ),
                            ),
                          ),
                          SizedBox(height: 8),
                          Text(
                            ingrediants.elementAt(index).elementAt(1),
                            style: TextStyle(
                              color: Color(0xFF747783),
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      );
                    }),
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
