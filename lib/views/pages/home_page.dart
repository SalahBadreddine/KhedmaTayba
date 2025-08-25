import 'package:flutter/material.dart';
import 'package:food_delivery/constants/constants.dart';
import 'package:food_delivery/views/widgets/category_widget.dart';
import 'package:food_delivery/views/widgets/home_selection_widget.dart';
import 'package:food_delivery/views/widgets/restaurant_card_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<List<String>> list = [
    ["All", "assets/images/allcategoryfood.png"],
    ["Hot Dog", "assets/images/hotdog.png"],
    ["Burger", "assets/images/burger.png"],
    ["Pizza", "assets/images/pizza.png"],
  ];

  String selectedCtegory = "All Categories";
  int selectedCategoryIndex = 0;
  List<List<dynamic>> restaurants = [
    ["assets/images/restaurant1.jpg", "Rose Garden Restaurant", ["Burger", "Chiken", "Riche", "Wings"], "4.7", "20"],
    ["assets/images/restaurant2.webp", "Mama's Kitchen", ["Soupe", "Salade", "Couscous"], "4.9", "30"]
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Container(
                          margin: EdgeInsets.only(right: 20),
                          height: 45,
                          width: 45,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Color(0xFFECF0F4),
                          ),
                          child: IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.menu),
                            iconSize: 30,
                            color: AppColors.homeDark,
                            padding: EdgeInsets.zero,
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "DELIVER TO",
                              style: TextStyle(
                                color: AppColors.primaryColor,
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            DropdownButton(
                              isDense: true,
                              items: [
                                DropdownMenuItem(
                                  child: Text(
                                    "Halal Lab office",
                                    style: TextStyle(
                                      color: Color(0xFF676767),
                                      fontSize: 14,
                                    ),
                                  ),
                                ),
                              ],
                              icon: Icon(
                                Icons.arrow_drop_down,
                                color: AppColors.homeDark,
                              ),
                              underline: SizedBox(),
                              onChanged: (value) {},
                            ),
                          ],
                        ),
                      ],
                    ),
                    Container(
                      width: 45,
                      height: 49,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColors.homeDark,
                      ),
                      child: IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.shopping_cart),
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 30),
                RichText(
                  text: TextSpan(
                    text: "Hey Halal, ",
                    style: TextStyle(color: Color(0xFF1E1D1D), fontSize: 16),
                    children: [
                      TextSpan(
                        text: "Good Afternoon!",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 15),
                TextFormField(
                  decoration: InputDecoration(
                    hintText: "Search dishes, restaurants",
                    filled: true,
                    fillColor: Color(0xFFF6F6F6),
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    prefixIcon: Icon(Icons.search, color: AppColors.iconColor),
                    contentPadding: EdgeInsets.all(20),
                  ),
                ),
                SizedBox(height: 30),
                HomeSelectionWidget(selectedCtegory: selectedCtegory),
                SizedBox(height: 10),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: List.generate(4, (index) {
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedCategoryIndex = index;
                            selectedCtegory = list
                                .elementAt(index)
                                .elementAt(0);
                          });
                        },
                        child: CategoryWidget(
                          isSelected: index == selectedCategoryIndex,
                          text: list.elementAt(index).elementAt(0),
                          image: list.elementAt(index).elementAt(1),
                        ),
                      );
                    }),
                  ),
                ),
                SizedBox(height: 20),
                HomeSelectionWidget(selectedCtegory: "Open Restaurants"),
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
