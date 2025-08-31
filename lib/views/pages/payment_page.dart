import 'package:flutter/material.dart';
import 'package:food_delivery/constants/constants.dart';
import 'package:food_delivery/views/widgets/navigation_widget.dart';
import 'package:food_delivery/views/widgets/orange_button_widget.dart';

class PaymentPage extends StatefulWidget {
  const PaymentPage({super.key});

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  @override
  Widget build(BuildContext context) {
    List<List<String>> paymentMethods = [
      ["assets/images/cash.jpg", "Cash"],
      ["assets/images/edhahabialogo.jpg", "Edhahabia"],
      ["assets/images/visalogo.png", "Visa"],
      ["assets/images/mastercardlogo.png", "Mastercard"],
      ["assets/images/paypallogo.png", "Paypal"],
    ];
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Padding(
          padding: const EdgeInsets.all(10.0),
          child: NavigationWidget(
            icon1: Icons.arrow_back_ios,
            title: Text(
              "Payment",
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
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  spacing: 20,
                  children: List.generate(paymentMethods.length, (index) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          width: 85,
                          height: 72,
                          padding: EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            color: AppColors.greyBackgroundColor,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Center(
                            child: Image.asset(
                              paymentMethods.elementAt(index).elementAt(0),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Text(
                          paymentMethods.elementAt(index).elementAt(1),
                          style: TextStyle(
                            color: Color(0xFF464E57),
                            fontSize: 14,
                          ),
                        ),
                      ],
                    );
                  }),
                ),
              ),
              SizedBox(height: 25),
              Center(
                child: Container(
                  width: 327,
                  height: 257,
                  decoration: BoxDecoration(
                    color: AppColors.greyBackgroundColor,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 30.0,
                      vertical: 10,
                    ),
                    child: Column(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(24),
                          child: Image.asset(
                            "assets/images/mastercard_card.png",
                            fit: BoxFit.cover,
                          ),
                        ),
                        Text(
                          "No master card added",
                          style: TextStyle(
                            color: Color(0xFF32343E),
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 5),
                        Text(
                          "You can add a mastercard and save it for later",
                          style: TextStyle(
                            color: Color.fromARGB(255, 77, 77, 97),
                            fontSize: 15,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 15),
              SizedBox(
                width: double.infinity,
                height: 62,
                child: ElevatedButton(
                  onPressed: () {}, 
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadiusGeometry.circular(12),
                    ),
                    side: BorderSide(
                      color: AppColors.greyBackgroundColor,
                      width: 1,
                    )
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.add, size: 20, color: AppColors.primaryColor, fontWeight: FontWeight.bold,),
                      SizedBox(width: 5,),
                      Text("ADD NEW", style: TextStyle(
                        color: AppColors.primaryColor,
                        fontSize: 14,
                        fontWeight: FontWeight.bold
                      ))
                    ],
                  )
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
