import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:food_delivery/constants/classes.dart';
import 'package:food_delivery/constants/constants.dart';
import 'package:food_delivery/views/widgets/card_info_widget.dart';
import 'package:food_delivery/views/widgets/food_card_widget.dart';
import 'package:food_delivery/views/widgets/home_selection_widget.dart';
import 'package:food_delivery/views/widgets/icon_home_widget.dart';
import 'package:food_delivery/views/widgets/keyword_scroll_widget.dart';
import 'package:food_delivery/views/widgets/navigation_widget.dart';
import 'package:food_delivery/views/widgets/orange_button_widget.dart';

class RestaurantDetailsPage extends StatefulWidget {
  const RestaurantDetailsPage({super.key});

  @override
  State<RestaurantDetailsPage> createState() => _RestaurantDetailsPageState();
}

class _RestaurantDetailsPageState extends State<RestaurantDetailsPage> {
  int selection = 0;
  int foodQuantity = 1;
  int selectedFood = 0;
  int minRate = 1;
  List<int> selectedOffers = [];
  int selectedDeliverTime = 0;
  int selectedPricing = 0;
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
    List<List<String>> categoryFoods = [
      // is used in Popular fast food, unlimited suggestions
      ["assets/images/burger.png", "American Burger", "America's Burger", "70"],
      ["assets/images/pizza.png", "European Pizza", "Pansi Restaurant", "40"],
      ["assets/images/hotdog.png", "German Hot Dog", "The Grill", "55"],
      ["assets/images/hotdog.png", "Algerian Hot Dog", "Signature", "100"],
    ];
    List<String> offers = [
      "Delivery",
      "Pick Up",
      "Offer",
      "Online payment available",
    ];
    List<String> deliverTime = ["10-15", "20", "30"];
    List<String> pricing = ["\$", "\$\$", "\$\$\$"];

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
                          onPressed: () {
                            showDialog(
                              context: context,
                              barrierDismissible: true,
                              builder: (context) {
                                return StatefulBuilder(
                                  builder: (context, setStateDialog) {
                                    return BackdropFilter(
                                      filter: ImageFilter.blur(
                                        sigmaX: 5,
                                        sigmaY: 5,
                                      ),
                                      child: Dialog(
                                        insetPadding: EdgeInsets.symmetric(
                                          vertical: 50,
                                          horizontal: 15,
                                        ),
                                        backgroundColor: Colors.white,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadiusGeometry.circular(12),
                                        ),
                                        child: SingleChildScrollView(
                                          child: ConstrainedBox(
                                            constraints: BoxConstraints(
                                              maxHeight:
                                                  MediaQuery.of(
                                                    context,
                                                  ).size.height *
                                                  0.9,
                                            ),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                    horizontal: 15,
                                                    vertical: 30,
                                                  ),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Text(
                                                        "Filter your search",
                                                        style: TextStyle(
                                                          color: AppColors
                                                              .homeDark,
                                                          fontSize: 17,
                                                        ),
                                                      ),
                                                      Container(
                                                        width: 45,
                                                        height: 45,
                                                        decoration:
                                                            BoxDecoration(
                                                              shape: BoxShape
                                                                  .circle,
                                                              color: Color(
                                                                0xFFECF0F4,
                                                              ),
                                                            ),
                                                        child: IconButton(
                                                          onPressed: () =>
                                                              Navigator.pop(
                                                                context,
                                                              ),
                                                          icon: Icon(
                                                            Icons.close,
                                                            color: Color(
                                                              0xFF464E57,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  SizedBox(height: 15),
                                                  Text(
                                                    "OFFERS",
                                                    style:
                                                        KTextStyle.FilterTitle,
                                                  ),
                                                  SizedBox(height: 10),
                                                  Wrap(
                                                    runSpacing: 10,
                                                    direction: Axis.horizontal,
                                                    children: List.generate(
                                                      offers.length,
                                                      (index) {
                                                        return GestureDetector(
                                                          onTap: () {
                                                            setStateDialog(() {
                                                              selectedOffers
                                                                      .contains(
                                                                        index,
                                                                      )
                                                                  ? selectedOffers
                                                                        .remove(
                                                                          index,
                                                                        )
                                                                  : selectedOffers
                                                                        .add(
                                                                          index,
                                                                        );
                                                            });
                                                          },
                                                          child: KeywordScrollWidget(
                                                            title: offers
                                                                .elementAt(
                                                                  index,
                                                                ),
                                                            isSelected:
                                                                selectedOffers
                                                                    .contains(
                                                                      index,
                                                                    ),
                                                          ),
                                                        );
                                                      },
                                                    ),
                                                  ),
                                                  SizedBox(height: 30),
                                                  Text(
                                                    "DELIVER TIME",
                                                    style:
                                                        KTextStyle.FilterTitle,
                                                  ),
                                                  SizedBox(height: 10),
                                                  Wrap(
                                                    runSpacing: 10,
                                                    direction: Axis.horizontal,
                                                    children: List.generate(
                                                      deliverTime.length,
                                                      (index) {
                                                        return GestureDetector(
                                                          onTap: () {
                                                            setStateDialog(() {
                                                              selectedDeliverTime =
                                                                  index;
                                                            });
                                                          },
                                                          child: KeywordScrollWidget(
                                                            title:
                                                                "${deliverTime.elementAt(index)} min",
                                                            isSelected:
                                                                selectedDeliverTime ==
                                                                index,
                                                          ),
                                                        );
                                                      },
                                                    ),
                                                  ),
                                                  SizedBox(height: 30),
                                                  Text(
                                                    "PRICING",
                                                    style:
                                                        KTextStyle.FilterTitle,
                                                  ),
                                                  SizedBox(height: 10),
                                                  Wrap(
                                                    runSpacing: 10,
                                                    direction: Axis.horizontal,
                                                    children: List.generate(
                                                      pricing.length,
                                                      (index) {
                                                        return GestureDetector(
                                                          onTap: () {
                                                            setStateDialog(() {
                                                              selectedPricing =
                                                                  index;
                                                            });
                                                          },
                                                          child: KeywordScrollWidget(
                                                            title: pricing
                                                                .elementAt(
                                                                  index,
                                                                ),
                                                            isSelected:
                                                                selectedPricing ==
                                                                index,
                                                          ),
                                                        );
                                                      },
                                                    ),
                                                  ),
                                                  SizedBox(height: 30),
                                                  Text(
                                                    "RATING",
                                                    style:
                                                        KTextStyle.FilterTitle,
                                                  ),
                                                  SizedBox(height: 10),
                                                  Wrap(
                                                    runSpacing: 10,
                                                    direction: Axis.horizontal,
                                                    children: List.generate(5, (
                                                      index,
                                                    ) {
                                                      return GestureDetector(
                                                        onTap: () {
                                                          setStateDialog(() {
                                                            minRate = index + 1;
                                                          });
                                                        },
                                                        child: Container(
                                                          width: 48,
                                                          height: 48,
                                                          margin:
                                                              EdgeInsets.only(
                                                                right: 10,
                                                              ),
                                                          decoration: BoxDecoration(
                                                            shape:
                                                                BoxShape.circle,
                                                            color: Colors.white,
                                                            border: Border.all(
                                                              color: AppColors
                                                                  .greyColor,
                                                              width: 2,
                                                            ),
                                                          ),
                                                          child: Icon(
                                                            Icons.star,
                                                            color:
                                                                index < minRate
                                                                ? AppColors
                                                                      .primaryColor
                                                                : AppColors
                                                                      .greyColor,
                                                          ),
                                                        ),
                                                      );
                                                    }),
                                                  ),
                                                  SizedBox(height: 30),
                                                  OrangeButtonWidget(
                                                    onPressed: () {},
                                                    buttontext: "FILTER",
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                );
                              },
                            );
                          },
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
                    itemCount: categoryFoods.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2, // 2 items per row
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 20,
                      childAspectRatio: 153 / 170, // keep consistent card shape
                    ),
                    itemBuilder: (context, index) {
                      return FoodCardWidget(
                        image: categoryFoods.elementAt(index).elementAt(0),
                        foodName: categoryFoods.elementAt(index).elementAt(1),
                        restaurantName: categoryFoods
                            .elementAt(index)
                            .elementAt(2),
                        foodPrice: categoryFoods.elementAt(index).elementAt(3),
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
