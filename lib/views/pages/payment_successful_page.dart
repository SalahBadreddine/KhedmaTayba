import 'package:flutter/material.dart';
import 'package:food_delivery/views/pages/track_order_page.dart';
import 'package:food_delivery/views/widgets/orange_button_widget.dart';

class PaymentSuccessfulPage extends StatelessWidget {
  const PaymentSuccessfulPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(automaticallyImplyLeading: false),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(30),
        child: SizedBox(
          child: OrangeButtonWidget(
            // for now
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return TrackOrderPage();
                },
              ),
            ),
            buttontext: "TRACK ORDER",
          ),
        ),
      ),
      body: SizedBox(
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ClipRRect(
                borderRadius: BorderRadiusGeometry.circular(24),
                child: Image.asset(
                  "assets/images/congrats.webp",
                  height: 207,
                  width: 228,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(height: 30),
              Text(
                "Congratulations!",
                style: TextStyle(
                  color: Color(0xFF111A2C),
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 15),
              SizedBox(
                width: 250,
                child: Text(
                  "You successfully maked a payment, enjoy our service!",
                  style: TextStyle(color: Color(0xFF525C67), fontSize: 14),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
