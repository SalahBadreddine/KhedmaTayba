import 'package:flutter/material.dart';
import 'package:food_delivery/constants/constants.dart';
import 'package:food_delivery/views/pages/display_page.dart';
import 'package:food_delivery/views/pages/restaurant_details_page.dart';
import 'package:food_delivery/views/widgets/card_info_widget.dart';
import 'package:food_delivery/views/widgets/food_card_widget.dart';
import 'package:food_delivery/views/widgets/home_selection_widget.dart';
import 'package:food_delivery/views/widgets/icon_home_widget.dart';
import 'package:food_delivery/views/widgets/keyword_scroll_widget.dart';
import 'package:food_delivery/views/widgets/navigation_widget.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  String numcartitems = "2";
  List<String> keywords = ["Burger", "Sandwich", "Pizza", "Salade"];
  // Later these lists will contain Objects (models) when integrating
  // database, then fetched and assigned
  List<List<String>> restaurants = [
    // is used in suggested restaurants, max length = 3
    ["assets/images/restaurant1.jpg", "Pansi Restaurant", "4.7"],
    ["assets/images/restaurant2.webp", "American Spicy Burger Shop", "4.3"],
    ["assets/images/restaurant3.jpg", "The Grill", "4.0"],
  ];
  List<List<String>> popularfood = [
    // is used in Popular fast food, unlimited suggestions
    ["assets/images/burger.png", "American Burger", "America's Burger", "70"],
    ["assets/images/pizza.png", "European Pizza", "Pansi Restaurant", "40"],
    ["assets/images/hotdog.png", "German Hot Dog", "The Grill", "55"],
    ["assets/images/hotdog.png", "Algerian Hot Dog", "Signature", "100"],
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Padding(
          padding: EdgeInsetsGeometry.all(10),
          child: NavigationWidget(
            onTapLeadingButton: () => Navigator.pop(context),
            icon1: Icons.arrow_back_ios,
            title: Text(
              "Search",
              style: TextStyle(fontSize: 17, color: AppColors.homeDark),
            ),
            suffixicon: Stack(
              children: [
                SizedBox(height: 49, width: 45),
                Positioned(
                  bottom: 0,
                  child: Container(
                    width: 45,
                    height: 45,
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
                ),
                Positioned(
                  top: 0,
                  right: 0,
                  child: Container(
                    height: 25,
                    width: 25,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColors.primaryColor,
                    ),
                    child: Center(
                      child: Text(
                        numcartitems,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20),
              TextFormField(
                autofocus: true,
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
              HomeSelectionWidget(
                selectedInfo: "Recent Keywords",
                isSeeAll: false,
              ),
              SizedBox(height: 10),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: List.generate(keywords.length, (index) {
                    return GestureDetector(
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return DisplayPage(title: keywords.elementAt(index),);
                          },
                        ),
                      ),
                      child: KeywordScrollWidget(
                        isSelected: false,
                        title: keywords.elementAt(index),
                      ),
                    );
                  }),
                ),
              ),
              SizedBox(height: 30),
              HomeSelectionWidget(
                selectedInfo: "Suggested Restaurants",
                isSeeAll: false,
              ),
              SizedBox(height: 10),
              ListView.separated(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                padding: EdgeInsets.zero,
                itemBuilder: (context, index) {
                  return ListTile(
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return RestaurantDetailsPage();
                        },
                      ),
                    ),
                    contentPadding: EdgeInsets.zero,
                    leading: Container(
                      width: 60,
                      height: 50,
                      padding: EdgeInsets.zero,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        image: DecorationImage(
                          image: AssetImage(
                            restaurants.elementAt(index).elementAt(0),
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    title: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          restaurants.elementAt(index).elementAt(1),
                          style: TextStyle(
                            color: AppColors.homeDark,
                            fontSize: 16,
                          ),
                        ),
                        CardInfoWidget(
                          info: restaurants.elementAt(index).elementAt(2),
                          icon: IconHomeWidget(icon: Icons.star_outline),
                        ),
                      ],
                    ),
                  );
                },
                separatorBuilder: (context, index) {
                  return Divider(color: Color(0xFFEDEDED), thickness: 1.5);
                },
                itemCount: 3,
              ),
              Divider(color: Color(0xFFEDEDED), thickness: 1.5),
              SizedBox(height: 15),
              HomeSelectionWidget(
                selectedInfo: "Popular Fast food",
                isSeeAll: false,
              ),
              SizedBox(height: 20),
              GridView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: popularfood.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, 
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20,
                  childAspectRatio: 153 / 170, 
                ),
                itemBuilder: (context, index) {
                  return FoodCardWidget(
                    image: popularfood.elementAt(index).elementAt(0),
                    foodName: popularfood.elementAt(index).elementAt(1),
                    restaurantName: popularfood.elementAt(index).elementAt(2),
                    foodPrice: popularfood.elementAt(index).elementAt(3),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
