import 'package:flutter/material.dart';
import 'package:food_delivery/constants/classes.dart';
import 'package:food_delivery/constants/constants.dart';
import 'package:food_delivery/views/widgets/navigation_widget.dart';
import 'package:food_delivery/views/widgets/orange_button_widget.dart';
import 'package:food_delivery/views/widgets/textfield_widget.dart';

class AddNewAddressPage extends StatefulWidget {
  const AddNewAddressPage({super.key});

  @override
  State<AddNewAddressPage> createState() => _AddNewAddressPageState();
}

class _AddNewAddressPageState extends State<AddNewAddressPage> {
  List<String> labels = ["Home", "Work", "Other"];
  int selection = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //TODO: implement the map 
      backgroundColor: Color(0xFFD0D9E1),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Color(0xFFD0D9E1),
        title: Padding(
          padding: const EdgeInsets.all(10.0),
          child: NavigationWidget(
            icon1: Icons.arrow_back_ios,
            title: SizedBox(),
            suffixicon: SizedBox(),
            onTapLeadingButton: () => Navigator.pop(context),
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height * 0.65,
            decoration: BoxDecoration(color: Colors.white),
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(30.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextfieldWidget(
                      title: "ADDRESS",
                      placeholder: "3235 Royal Ln. mesa, new jersy 34567",
                      isPassword: false,
                      leadingIcon: Icon(
                        Icons.location_on_sharp,
                        color: Color(0xFF6B6E82),
                        size: 25,
                      ),
                    ),
                    SizedBox(height: 25),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Expanded(
                          child: TextfieldWidget(
                            title: "STREET",
                            placeholder: "hason nagar",
                            isPassword: false,
                          ),
                        ),
                        SizedBox(width: 15),
                        Expanded(
                          child: TextfieldWidget(
                            title: "POST CODE",
                            placeholder: "34567",
                            isPassword: false,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 25),
                    TextfieldWidget(
                      title: "APPARTMENT",
                      placeholder: "11",
                      isPassword: false,
                    ),
                    SizedBox(height: 25),
                    Text("LABEL AS", style: KTextStyle.TextfieldInfo),
                    SizedBox(height: 12),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: List.generate(labels.length, (index) {
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              selection = index;
                            });
                          },
                          child: Container(
                            margin: EdgeInsets.only(right: 10),
                            padding: EdgeInsets.symmetric(
                              horizontal: 25,
                              vertical: 12,
                            ),
                            decoration: BoxDecoration(
                              color: index == selection
                                  ? AppColors.orangeColor
                                  : AppColors.greyBackgroundColor,
                              borderRadius: BorderRadius.circular(33),
                            ),
                            child: Text(
                              labels.elementAt(index),
                              style: TextStyle(
                                color: index == selection
                                    ? Colors.white
                                    : AppColors.homeDark,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        );
                      }),
                    ),
                    SizedBox(height: 30),
                    OrangeButtonWidget(
                      onPressed: () {},
                      buttontext: "SAVE LOCATION",
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
