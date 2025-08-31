import 'package:flutter/material.dart';
import 'package:food_delivery/constants/constants.dart';
import 'package:food_delivery/views/widgets/navigation_widget.dart';
import 'package:food_delivery/views/widgets/orange_button_widget.dart';

class EditCartPage extends StatefulWidget {
  const EditCartPage({super.key});

  @override
  State<EditCartPage> createState() => _EditCartPageState();
}

class _EditCartPageState extends State<EditCartPage> {
  int foodQuantity = 1; // this will be passed later
  bool onEdit = false;
  List<List<String>> cartFoods = [
    // is used in Popular fast food, unlimited suggestions
    [
      "assets/images/burger_background.webp",
      "American Burger",
      "70",
      "14",
      "2",
    ],
    ["assets/images/onboarding1.png", "European Pizza", "40", "12", "1"],
    ["assets/images/hotdog.png", "German Hot Dog", "55", "10", "1"],
    ["assets/images/hotdog.png", "Algerian Hot Dog", "100", "10", "1"],
  ];

  String calculateTotal() {
    int total = 0;
    for (int i = 0; i < cartFoods.length; i++) {
      total += int.parse(cartFoods[i][2]) * int.parse(cartFoods[i][4]);
    }
    return total.toString();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: AppColors.cartDarkColor,
        title: Padding(
          padding: EdgeInsets.all(10),
          child: NavigationWidget(
            icon1: Icons.arrow_back_ios,
            title: Text(
              "Cart",
              style: TextStyle(color: Colors.white, fontSize: 17),
            ),
            suffixicon: TextButton(
              onPressed: () {
                setState(() {
                  onEdit = !onEdit;
                });
              },
              child: Text(
                onEdit ? "DONE" : "EDIT ITEMS",
                style: TextStyle(
                  color: onEdit ? Color(0xFF059C6A) : AppColors.primaryColor,
                  decoration: TextDecoration.underline,
                  decorationColor: onEdit
                      ? Color(0xFF059C6A)
                      : AppColors.primaryColor,
                ),
              ),
            ),
            onTapLeadingButton: () => Navigator.pop(context),
          ),
        ),
      ),
      bottomNavigationBar: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
        height: 310,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(24),
            topLeft: Radius.circular(24),
          ),
          color: Colors.white,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "DELIVERY ADDRESS",
                  style: TextStyle(color: AppColors.iconColor, fontSize: 14),
                ),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    "EDIT",
                    style: TextStyle(
                      color: AppColors.primaryColor,
                      fontSize: 14,
                      decoration: TextDecoration.underline,
                      decorationColor: AppColors.primaryColor,
                    ),
                  ),
                ),
              ],
            ),
            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none,
                ),
                fillColor: Color(0xFFF0F5FA),
                filled: true,
                hintText: "2118 Thornridge Cir. Syracuse",
                hintStyle: TextStyle(color: AppColors.iconColor),
                contentPadding: EdgeInsets.all(20),
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Text(
                      "TOTAL: ",
                      style: TextStyle(
                        color: AppColors.iconColor,
                        fontSize: 14,
                      ),
                    ),
                    SizedBox(width: 10),
                    Text(
                      "\$${calculateTotal()}",
                      style: TextStyle(
                        color: AppColors.cartDarkColor,
                        fontSize: 30,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    TextButton(
                      style: TextButton.styleFrom(padding: EdgeInsets.all(3)),
                      onPressed: () {},
                      child: Text(
                        "Breakdown",
                        style: TextStyle(
                          color: AppColors.primaryColor,
                          fontSize: 14,
                        ),
                      ),
                    ),
                    Icon(
                      Icons.arrow_forward_ios,
                      color: AppColors.cartDarkColor,
                      size: 15,
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 20),
            OrangeButtonWidget(onPressed: () {}, buttontext: "PLACE ORDER"),
          ],
        ),
      ),
      backgroundColor: AppColors.cartDarkColor,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: List.generate(cartFoods.length, (index) {
              return Container(
                margin: EdgeInsets.only(bottom: 25),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(25),
                      child: Image.asset(
                        cartFoods.elementAt(index).elementAt(0),
                        fit: BoxFit.cover,
                        height: 117,
                        width: 136,
                      ),
                    ),
                    SizedBox(width: 20),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: Text(
                                  cartFoods.elementAt(index).elementAt(1),
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                  ),
                                ),
                              ),
                              onEdit ? SizedBox(width: 10) : SizedBox(),
                              onEdit
                                  ? Container(
                                      width: 27,
                                      height: 27,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Color(0xFFE04444),
                                      ),
                                      child: IconButton(
                                        onPressed: () {
                                          setState(() {
                                            cartFoods.remove(
                                              cartFoods.elementAt(index),
                                            );
                                          });
                                        },
                                        icon: Icon(Icons.close),
                                        color: Colors.white,
                                        padding: EdgeInsets.zero,
                                      ),
                                    )
                                  : SizedBox(),
                            ],
                          ),
                          SizedBox(height: 5),
                          Text(
                            "\$${cartFoods.elementAt(index).elementAt(2)}",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                '${cartFoods.elementAt(index).elementAt(3)}"',
                                style: TextStyle(
                                  color: Color.fromARGB(255, 77, 77, 97),
                                  fontSize: 18,
                                ),
                              ),
                              Container(
                                width: 89,
                                height: 22,
                                padding: EdgeInsets.zero,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(22),
                                  color: AppColors.cartDarkColor,
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      width: 22,
                                      height: 22,
                                      decoration: BoxDecoration(
                                        color: Color.fromARGB(255, 77, 77, 97),
                                        shape: BoxShape.circle,
                                      ),
                                      child: IconButton(
                                        onPressed: () {
                                          setState(() {
                                            int count = int.parse(
                                              cartFoods
                                                  .elementAt(index)
                                                  .elementAt(4),
                                            );
                                            if (count > 1) {
                                              count--;
                                              cartFoods.elementAt(index)[4] =
                                                  count.toString();
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
                                      cartFoods.elementAt(index).elementAt(4),
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Container(
                                      width: 22,
                                      height: 22,
                                      decoration: BoxDecoration(
                                        color: Color.fromARGB(255, 77, 77, 97),
                                        shape: BoxShape.circle,
                                      ),
                                      child: IconButton(
                                        onPressed: () {
                                          setState(() {
                                            int count =
                                                int.parse(
                                                  cartFoods
                                                      .elementAt(index)
                                                      .elementAt(4),
                                                ) +
                                                1;
                                            cartFoods[index][4] = count.toString();
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
                        ],
                      ),
                    ),
                  ],
                ),
              );
            }),
          ),
        ),
      ),
    );
  }
}
