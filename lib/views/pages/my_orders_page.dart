import 'package:flutter/material.dart';
import 'package:food_delivery/constants/classes.dart';
import 'package:food_delivery/constants/constants.dart';
import 'package:food_delivery/views/widgets/history_order_card_widget.dart';
import 'package:food_delivery/views/widgets/navigation_widget.dart';
import 'package:food_delivery/views/widgets/order_card_widget.dart';

class MyOrdersPage extends StatefulWidget {
  const MyOrdersPage({super.key});

  @override
  State<MyOrdersPage> createState() => _MyOrdersPageState();
}

class _MyOrdersPageState extends State<MyOrdersPage> {
  bool ongoingSelected = true;
  @override
  Widget build(BuildContext context) {
    List<List<dynamic>> orders = [
      [
        "Food",
        "assets/images/burger_background.webp",
        "Burger Hut",
        "35.25",
        3,
        "#162432",
      ],
      [
        "Food",
        "assets/images/signaturedz.png",
        "Signature Dz",
        "44",
        2,
        "#242432",
      ],
      [
        "Food",
        "assets/images/megapizza.jpeg",
        "Mega Pizza",
        "12.5",
        5,
        "#240112",
      ],
      ["Drink", "assets/images/frenchydz.png", "Frenchy", "10", 2, "#254212"],
    ];
    List<List<dynamic>> historyOrders = [
      [
        "Food",
        "assets/images/burger_background.webp",
        "Burger",
        "14.25",
        1,
        "#163432",
        true,
      ],
      [
        "Food",
        "assets/images/signaturedz.png",
        "Signature Dz",
        "33",
        2,
        "#233432",
        true,
      ],
      [
        "Food",
        "assets/images/megapizza.jpeg",
        "Mega Pizza",
        "5",
        1,
        "#223412",
        false,
      ],
      [
        "Drink",
        "assets/images/frenchydz.png",
        "Frenchy",
        "10",
        2,
        "#266212",
        false,
      ],
    ];
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Padding(
          padding: const EdgeInsets.all(10.0),
          child: NavigationWidget(
            icon1: Icons.arrow_back_ios,
            title: Text(
              "My Orders",
              style: TextStyle(color: AppColors.darkColor, fontSize: 17),
            ),
            suffixicon: SizedBox(),
            onTapLeadingButton: () => Navigator.pop(context),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            width: 2,
                            color: ongoingSelected
                                ? AppColors.primaryColor
                                : Color(0xFFA5A7B9),
                          ),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 15.0),
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              ongoingSelected = true;
                            });
                          },
                          child: Text(
                            "Ongoing",
                            textAlign: TextAlign.center,
                            style: ongoingSelected
                                ? KTextStyle.selectedTextStyle
                                : KTextStyle.unselectedTextStyle,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            width: 2,
                            color: ongoingSelected
                                ? Color(0xFFA5A7B9)
                                : AppColors.primaryColor,
                          ),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 15.0),
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              ongoingSelected = false;
                            });
                          },
                          child: Text(
                            "History",
                            textAlign: TextAlign.center,
                            style: ongoingSelected
                                ? KTextStyle.unselectedTextStyle
                                : KTextStyle.selectedTextStyle,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: Column(
                children: List.generate(orders.length, (index) {
                  return ongoingSelected
                      ? OrderCardWidget(
                          foodtype: orders.elementAt(index)[0],
                          foodImage: orders.elementAt(index)[1],
                          restaurantName: orders.elementAt(index)[2],
                          price: orders.elementAt(index)[3],
                          items: orders.elementAt(index)[4],
                          id: orders.elementAt(index)[5],
                        )
                      : HistoryOrderCardWidget(
                          foodtype: historyOrders.elementAt(index)[0],
                          foodImage: historyOrders.elementAt(index)[1],
                          restaurantName: historyOrders.elementAt(index)[2],
                          price: historyOrders.elementAt(index)[3],
                          items: historyOrders.elementAt(index)[4],
                          id: historyOrders.elementAt(index)[5],
                          isCompleted: historyOrders.elementAt(index)[6],
                        );
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
