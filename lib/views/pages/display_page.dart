import 'package:flutter/material.dart';
import 'package:food_delivery/constants/classes.dart';
import 'package:food_delivery/constants/constants.dart';
import 'package:food_delivery/views/widgets/food_card_widget.dart';
import 'package:food_delivery/views/widgets/home_selection_widget.dart';
import 'package:food_delivery/views/widgets/navigation_widget.dart';
import 'package:food_delivery/views/widgets/restaurant_card_widget.dart';

class DisplayPage extends StatelessWidget {
  const DisplayPage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    List<List<String>> popularfood = [
      // is used in Popular fast food, unlimited suggestions
      ["assets/images/burger.png", "American Burger", "America's Burger", "70"],
      ["assets/images/pizza.png", "European Pizza", "Pansi Restaurant", "40"],
      ["assets/images/hotdog.png", "German Hot Dog", "The Grill", "55"],
      ["assets/images/hotdog.png", "Algerian Hot Dog", "Signature", "100"],
    ];
    List<List<dynamic>> restaurants = [
      [
        "assets/images/restaurant1.jpg",
        "Rose Garden Restaurant",
        ["Burger", "Chiken", "Riche", "Wings"],
        "4.7",
        "20",
      ],
      [
        "assets/images/restaurant2.webp",
        "Mama's Kitchen",
        ["Soupe", "Salade", "Couscous"],
        "4.6",
        "30",
      ],
      [
        "assets/images/restaurant3.jpg",
        "The Grill Restaurant",
        ["Chawarma", "Grillade", "Meat"],
        "4.5",
        "70",
      ]
    ];

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(30),
            child: Column(
              children: [
                NavigationWidget(
                  icon1: Icons.arrow_back_ios,
                  title: DropdownButton(
                    value: title,
                    items: [
                      DropdownMenuItem(
                        value: "Burger",
                        child: Text(
                          "Burger",
                          style: KTextStyle.dropButtonTextStyle,
                        ),
                      ),
                      DropdownMenuItem(
                        value: "Pizza",
                        child: Text(
                          "Pizza",
                          style: KTextStyle.dropButtonTextStyle,
                        ),
                      ),
                      DropdownMenuItem(
                        value: "Hotdog",
                        child: Text(
                          "Hotdog",
                          style: KTextStyle.dropButtonTextStyle,
                        ),
                      ),
                      DropdownMenuItem(
                        value: "Salade",
                        child: Text(
                          "Salade",
                          style: KTextStyle.dropButtonTextStyle,
                        ),
                      ),
                      DropdownMenuItem(
                        value: "Sandwich",
                        child: Text("Sandwich", style: KTextStyle.dropButtonTextStyle,),
                      ),
                    ],
                    onChanged: (value) {},
                    iconEnabledColor: AppColors.primaryColor,
                    borderRadius: BorderRadius.circular(12),
                    underline: SizedBox(),
                    isDense: true,
                  ),
                  suffixicon: Row(
                    children: [
                      Container(
                        height: 46,
                        width: 46,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColors.homeDark,
                        ),
                        child: IconButton(
                          focusColor: AppColors.homeDark,
                          onPressed: () {},
                          icon: Icon(Icons.search, fontWeight: FontWeight.bold),
                          iconSize: 20,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(width: 10),
                      Container(
                        height: 46,
                        width: 46,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color(0xFFECF0F4),
                        ),
                        child: IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.filter_list,
                            fontWeight: FontWeight.bold,
                          ),
                          iconSize: 20,
                          color: AppColors.homeDark,
                        ),
                      ),
                    ],
                  ),
                  onTapLeadingButton: () => Navigator.pop(context),
                ),
                SizedBox(height: 20,),
                HomeSelectionWidget(
                  selectedInfo: "Popular $title\s",
                  isSeeAll: false,
                ),
                SizedBox(height: 20,),
                GridView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: popularfood.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, // 2 items per row
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 20,
                    childAspectRatio: 153 / 170, // keep consistent card shape
                  ),
                  itemBuilder: (context, index) {
                    return FoodCardWidget(
                      image: popularfood.elementAt(index).elementAt(0),
                      foodName: popularfood.elementAt(index).elementAt(1),
                      restaurantName: popularfood
                          .elementAt(index)
                          .elementAt(2),
                      foodPrice: popularfood.elementAt(index).elementAt(3),
                    );
                  },
                ),
                SizedBox(height: 30),
                HomeSelectionWidget(selectedInfo: "Open Restaurants", isSeeAll: false,),
                SizedBox(height: 10),
                ...List.generate(restaurants.length, (index) {
                  return RestaurantCardWidget(
                    image: restaurants.elementAt(index).elementAt(0),
                    name: restaurants.elementAt(index).elementAt(1),
                    types: restaurants.elementAt(index).elementAt(2),
                    rating: restaurants.elementAt(index).elementAt(3),
                    time: restaurants.elementAt(index).elementAt(4),
                  );
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
