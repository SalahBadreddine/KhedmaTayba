import 'package:flutter/material.dart';
import 'package:food_delivery/constants/constants.dart';
import 'package:food_delivery/views/widgets/navigation_widget.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  String numcartitems = "2";

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
                NavigationWidget(
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
                SizedBox(height: 30),
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
                    prefixIcon: Icon(
                      Icons.search,
                      color: AppColors.iconColor,
                    ),
                    contentPadding: EdgeInsets.all(20),
                  ),
                ),
                SizedBox(height: 30),
                
              ],
            ),
          ),
        ),
      ),
    );
  }
}
