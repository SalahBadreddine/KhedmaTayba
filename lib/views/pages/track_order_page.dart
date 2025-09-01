import 'package:flutter/material.dart';
import 'package:food_delivery/constants/constants.dart';
import 'package:food_delivery/views/pages/delivery_man_call_page.dart';
import 'package:food_delivery/views/pages/delivery_man_chat_page.dart';
import 'package:food_delivery/views/widgets/navigation_widget.dart';

class TrackOrderPage extends StatelessWidget {
  const TrackOrderPage({super.key});

  @override
  Widget build(BuildContext context) {
    List<List<String>> orders = [
      ["2", "Burger"],
      ["4", "Sandwich"],
    ];
    List<List<dynamic>> status = [
      ["Your order has been received", true],
      ["The restaurant is preparing your food", true],
      ["Your order has been picked up for delivery", false],
      ["Order arriving soon!", false],
    ];
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/map.jpeg"),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.transparent,
          title: Padding(
            padding: const EdgeInsets.all(10.0),
            child: NavigationWidget(
              icon1: Icons.arrow_back_ios,
              title: Text(
                "Track Order",
                style: TextStyle(color: AppColors.homeDark, fontSize: 17),
              ),
              suffixicon: SizedBox(),
              onTapLeadingButton: () =>
                  Navigator.popUntil(context, ModalRoute.withName('/home')),
            ),
          ),
        ),
        body: Stack(
          children: [
            DraggableScrollableSheet(
              initialChildSize: 0.25,
              minChildSize: 0.25,
              maxChildSize: 0.85,
              builder: (context, scrollController) {
                return Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(24),
                    ),
                  ),
                  child: ListView(
                    controller: scrollController,
                    children: [
                      Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: Container(
                              width: 70,
                              height: 7,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(80),
                                color: Color(0xFFD8E3ED),
                              ),
                            ),
                          ),
                          SizedBox(height: 10),
                          Padding(
                            padding: const EdgeInsets.all(30.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    ClipRRect(
                                      borderRadius:
                                          BorderRadiusGeometry.circular(12),
                                      child: Image.asset(
                                        "assets/images/restaurant2.webp",
                                        height: 63,
                                        width: 63,
                                      ),
                                    ),
                                    SizedBox(width: 5),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Uttora Coffee House",
                                          style: TextStyle(
                                            color: AppColors.homeDark,
                                            fontSize: 18,
                                          ),
                                        ),
                                        SizedBox(height: 5),
                                        Text(
                                          "Orderd at 06 Sept, 10:00pm",
                                          style: TextStyle(
                                            color: Color(0xFFA0A5BA),
                                            fontSize: 14,
                                          ),
                                        ),
                                        SizedBox(height: 20),
                                        ...List.generate(orders.length, (
                                          index,
                                        ) {
                                          return RichText(
                                            text: TextSpan(
                                              text:
                                                  "${orders.elementAt(index).elementAt(0)}x ",
                                              style: TextStyle(
                                                fontSize: 13,
                                                color: Color(0xFF646982),
                                                fontWeight: FontWeight.bold,
                                              ),
                                              children: [
                                                TextSpan(
                                                  text: orders
                                                      .elementAt(index)
                                                      .elementAt(1),
                                                  style: TextStyle(
                                                    fontWeight:
                                                        FontWeight.normal,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          );
                                        }),
                                      ],
                                    ),
                                  ],
                                ),
                                SizedBox(height: 30),
                                Center(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        "20 min",
                                        style: TextStyle(
                                          color: AppColors.homeDark,
                                          fontSize: 30,
                                          fontFamily: "Poppins",
                                          fontWeight: FontWeight.w800,
                                        ),
                                      ),
                                      Text(
                                        "ESTIMATED DELIVERY TIME",
                                        style: TextStyle(
                                          color: Color(0xFFA0A5BA),
                                          fontSize: 14,
                                          fontWeight: FontWeight.normal,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(height: 30),
                                Column(
                                  children: List.generate(status.length, (
                                    index,
                                  ) {
                                    return Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Column(
                                          children: [
                                            Container(
                                              width: 17,
                                              height: 17,
                                              decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                color:
                                                    status.elementAt(index)[1]
                                                    ? AppColors.primaryColor
                                                    : Color(0xFFA0A5BA),
                                              ),
                                              child: index < status.length - 1
                                                  ? Icon(
                                                      status.elementAt(
                                                                index,
                                                              )[1] &
                                                              !status.elementAt(
                                                                index + 1,
                                                              )[1]
                                                          ? Icons.timer
                                                          : Icons.check,
                                                      size: 10,
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    )
                                                  : Icon(
                                                      Icons.check,
                                                      size: 10,
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                            ),
                                            index < status.length - 1
                                                ? Container(
                                                    height: 45,
                                                    width: 2,
                                                    color:
                                                        status.elementAt(
                                                          index + 1,
                                                        )[1]
                                                        ? AppColors.primaryColor
                                                        : Color(0xFFA0A5BA),
                                                  )
                                                : SizedBox(),
                                          ],
                                        ),
                                        SizedBox(width: 15),
                                        Text(
                                          status.elementAt(index).elementAt(0),
                                          style: index < status.length - 1
                                              ? TextStyle(
                                                  color:
                                                      status.elementAt(
                                                            index,
                                                          )[1] &
                                                          status.elementAt(
                                                            index + 1,
                                                          )[1]
                                                      ? AppColors.primaryColor
                                                      : Color(0xFFA0A5BA),
                                                  fontSize: 13,
                                                )
                                              : TextStyle(
                                                  color:
                                                      status.elementAt(index)[1]
                                                      ? AppColors.primaryColor
                                                      : Color(0xFFA0A5BA),
                                                  fontSize: 13,
                                                ),
                                        ),
                                      ],
                                    );
                                  }),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            width: double.infinity,
                            height: 116,
                            padding: EdgeInsets.only(bottom: 10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.vertical(
                                top: Radius.circular(24),
                              ),
                              border: Border(
                                top: BorderSide(
                                  color: Color(0xFFE8E8E8),
                                  width: 1,
                                ),
                              ),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SizedBox(
                                  height: 54,
                                  child: Row(
                                    children: [
                                      Container(
                                        width: 54,
                                        height: 54,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          image: DecorationImage(
                                            image: AssetImage(
                                              "assets/images/deliveryman.jpg",
                                            ),
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                      SizedBox(width: 10),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Robert F.",
                                            style: TextStyle(
                                              color: AppColors.homeDark,
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          Text(
                                            "Courier",
                                            style: TextStyle(
                                              color: Color(0xFFA0A5BA),
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                Row(
                                  children: [
                                    Container(
                                      width: 45,
                                      height: 45,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: AppColors.primaryColor,
                                      ),
                                      child: IconButton(
                                        padding: EdgeInsets.all(0),
                                        icon: Icon(
                                          Icons.call_outlined,
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                        ),
                                        onPressed: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) {
                                                return DeliveryManCallPage();
                                              },
                                            ),
                                          );
                                        },
                                      ),
                                    ),
                                    SizedBox(width: 15),
                                    Container(
                                      width: 45,
                                      height: 45,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.white,
                                        border: Border.all(
                                          color: AppColors.primaryColor,
                                          width: 1.5,
                                        ),
                                      ),
                                      child: IconButton(
                                        padding: EdgeInsets.all(0),
                                        icon: Icon(
                                          Icons.messenger_outline_outlined,
                                          color: AppColors.primaryColor,
                                          fontWeight: FontWeight.bold,
                                        ),
                                        onPressed: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) {
                                                return DeliveryManChatPage();
                                              },
                                            ),
                                          );
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
