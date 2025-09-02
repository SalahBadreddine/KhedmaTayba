import 'package:flutter/material.dart';
import 'package:food_delivery/constants/constants.dart';
import 'package:food_delivery/views/pages/addresses_page.dart';
import 'package:food_delivery/views/pages/my_orders_page.dart';
import 'package:food_delivery/views/pages/personal_info_page.dart';
import 'package:food_delivery/views/widgets/menu_info_widget.dart';
import 'package:food_delivery/views/widgets/navigation_widget.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    List<List<dynamic>> personalInfos = [
      [
        "Personal Info",
        Icon(Icons.person_outlined, color: Color(0xFFFB6F3D)),
        () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return PersonalInfoPage();
            },
          ),
        ),
      ],
      [
        "Addresses",
        Icon(Icons.map_outlined, color: Color(0xFF413DFB)),
        () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return AddressesPage();
            },
          ),
        ),
      ],
      [
        "My Orders",
        Icon(Icons.delivery_dining_outlined, color: Color(0xFF369BFF)),
        () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return MyOrdersPage();
            },
          ),
        ),
      ],
    ];

    List<List<dynamic>> appInfos = [
      [
        "Cart",
        Icon(Icons.shopping_bag_outlined, color: Color(0xFF369BFF)),
        () {},
      ],
      [
        "Favourite",
        Icon(Icons.favorite_outline, color: Color(0xFFB33DFB)),
        () {},
      ],
      [
        "Notifications",
        Icon(Icons.notifications_outlined, color: Color(0xFFFFAA2A)),
        () {},
      ],
      [
        "Payment Method",
        Icon(Icons.payment_outlined, color: Color(0xFF369BFF)),
        () {},
      ],
    ];

    List<List<dynamic>> reviewInfos = [
      [
        "FAQs",
        Icon(Icons.question_mark_outlined, color: AppColors.primaryColor),
        () {},
      ],
      [
        "User Reviews",
        Icon(Icons.reviews_outlined, color: Color(0xFF2AE1E1)),
        () {},
      ],
      [
        "Settings",
        Icon(Icons.settings_outlined, color: Color(0xFF413DFB)),
        () {},
      ],
    ];

    List<List<dynamic>> logoutInfos = [
      ["Log Out", Icon(Icons.logout_outlined, color: Color(0xFFFB4A59)), () {}],
    ];

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Padding(
          padding: const EdgeInsets.all(10.0),
          child: NavigationWidget(
            icon1: Icons.arrow_back_ios,
            title: Text(
              "Profile",
              style: TextStyle(color: AppColors.homeDark, fontSize: 17),
            ),
            suffixicon: SizedBox(),
            onTapLeadingButton: () => Navigator.pop(context),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: AssetImage("assets/images/ME.jpg"),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(width: 25),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Salah Badreddine",
                        style: TextStyle(
                          color: AppColors.darkColor,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        "Vive Rechta !!!",
                        style: TextStyle(
                          color: Color(0xFFA0A5BA),
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 30),
              MenuInfoWidget(infos: personalInfos),
              SizedBox(height: 20),
              MenuInfoWidget(infos: appInfos),
              SizedBox(height: 20),
              MenuInfoWidget(infos: reviewInfos),
              SizedBox(height: 20),
              MenuInfoWidget(infos: logoutInfos),
            ],
          ),
        ),
      ),
    );
  }
}
