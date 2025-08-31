import 'package:flutter/material.dart';
import 'package:food_delivery/views/widgets/orange_button_widget.dart';

class PaymentSuccessfulPage extends StatelessWidget {
  const PaymentSuccessfulPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(30),
        child: OrangeButtonWidget(onPressed: () {}, buttontext: "TRACK ORDER"),
      ),
    );
  }
}
