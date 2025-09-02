import 'package:flutter/material.dart';
import 'package:food_delivery/constants/constants.dart';
import 'package:food_delivery/views/pages/add_new_address_page.dart';
import 'package:food_delivery/views/widgets/address_description_widget.dart';
import 'package:food_delivery/views/widgets/navigation_widget.dart';
import 'package:food_delivery/views/widgets/orange_button_widget.dart';

class AddressesPage extends StatelessWidget {
  const AddressesPage({super.key});

  @override
  Widget build(BuildContext context) {
    List<List<String>> addresses = [
      ["HOME", "16028, Benaknoun city, Algiers, Algeria"],
      ["HOME", "3891 Ranchview Dr. Richardson, California 62639"],
      ["WORK", "16000, Hydra city, Algiers, Algeria"],
    ];
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Padding(
          padding: const EdgeInsets.all(10.0),
          child: NavigationWidget(
            icon1: Icons.arrow_back_ios,
            title: Text(
              "My Address",
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
                  return AddNewAddressPage();
                },
              ),
            );
          },
          buttontext: "ADD NEW ADDRESS",
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          children: List.generate(addresses.length, (index) {
            return AddressDescriptionWidget(
              type: addresses.elementAt(index)[0],
              address: addresses.elementAt(index)[1],
            );
          }),
        ),
      ),
    );
  }
}
