import 'package:flutter/material.dart';
import 'package:food_delivery/constants/constants.dart';
import 'package:food_delivery/views/pages/payment_successful_page.dart';
import 'package:food_delivery/views/widgets/add_card_textfield_widget.dart';
import 'package:food_delivery/views/widgets/navigation_widget.dart';
import 'package:food_delivery/views/widgets/orange_button_widget.dart';

class AddCardPage extends StatefulWidget {
  const AddCardPage({super.key});

  @override
  State<AddCardPage> createState() => _AddCardPageState();
}

class _AddCardPageState extends State<AddCardPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Padding(
          padding: const EdgeInsets.all(10.0),
          child: NavigationWidget(
            icon1: Icons.arrow_back_ios,
            title: Text(
              "Add Card",
              style: TextStyle(color: AppColors.homeDark, fontSize: 17),
            ),
            suffixicon: SizedBox(),
            onTapLeadingButton: () => Navigator.pop(context),
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(30.0),
        child: OrangeButtonWidget(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return PaymentSuccessfulPage();
                },
              ),
            );
          },
          buttontext: "ADD & MAKE PAYMENT",
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(30),
        child: Column(
          children: [
            AddCardTextfieldWidget(
              title: "CARD HOLDER NAME",
              initialValue: "Badreddine Salah",
            ),
            SizedBox(height: 20),
            AddCardTextfieldWidget(title: "CARD NUMBER", initialValue: "2134 "),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: AddCardTextfieldWidget(
                    title: "EXPIRE DATE",
                    hintText: "mm/yyyy",
                  ),
                ),
                SizedBox(width: 30),
                Expanded(child: AddCardTextfieldWidget(title: "CVC", hintText: "***",)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
