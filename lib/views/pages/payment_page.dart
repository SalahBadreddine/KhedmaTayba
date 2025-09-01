import 'package:flutter/material.dart';
import 'package:food_delivery/constants/constants.dart';
import 'package:food_delivery/views/pages/add_card_page.dart';
import 'package:food_delivery/views/pages/payment_successful_page.dart';
import 'package:food_delivery/views/widgets/navigation_widget.dart';
import 'package:food_delivery/views/widgets/orange_button_widget.dart';

class PaymentPage extends StatefulWidget {
  const PaymentPage({super.key, required this.total});

  final String total;

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  int selectedPayment = 2;
  @override
  Widget build(BuildContext context) {
    List<List<String>> paymentMethods = [
      ["assets/images/cash.jpg", "Cash"],
      ["assets/images/edhahabialogo.jpg", "Edhahabia"],
      ["assets/images/mastercardlogo.png", "Mastercard"],
      ["assets/images/visalogo.png", "Visa"],
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
      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(30),
        child: SizedBox(
          width: double.infinity,
          height: 130,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
                  Text(
                    "TOTAL: ",
                    style: TextStyle(color: AppColors.iconColor, fontSize: 14),
                  ),
                  SizedBox(width: 10),
                  Text(
                    "\$${widget.total}",
                    style: TextStyle(color: AppColors.homeDark, fontSize: 30),
                  ),
                ],
              ),
              SizedBox(height: 20),
              OrangeButtonWidget(
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
                buttontext: "PAY & CONFIRM",
              ),
            ],
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
                  spacing: 15,
                  children: List.generate(paymentMethods.length, (index) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 5, right: 5),
                          child: Stack(
                            clipBehavior: Clip.none,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    selectedPayment = index;
                                  });
                                },
                                child: Container(
                                  width: 85,
                                  height: 72,
                                  padding: EdgeInsets.all(20),
                                  decoration: BoxDecoration(
                                    color: selectedPayment == index
                                        ? Colors.white
                                        : AppColors.greyBackgroundColor,
                                    borderRadius: BorderRadius.circular(10),
                                    border: selectedPayment == index
                                        ? Border.all(
                                            color: AppColors.primaryColor,
                                            width: 2,
                                          )
                                        : null,
                                  ),
                                  child: Center(
                                    child: Image.asset(
                                      paymentMethods
                                          .elementAt(index)
                                          .elementAt(0),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                              selectedPayment == index
                                  ? Positioned(
                                      top: -5,
                                      right: -5,
                                      child: Container(
                                        width: 24,
                                        height: 24,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: AppColors.primaryColor,
                                        ),
                                        child: Icon(
                                          Icons.check,
                                          size: 20,
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    )
                                  : SizedBox(),
                            ],
                          ),
                        ),
                        SizedBox(height: 3),
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
                          "No mastercard added",
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
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return AddCardPage();
                        },
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadiusGeometry.circular(12),
                    ),
                    side: BorderSide(
                      color: AppColors.greyBackgroundColor,
                      width: 1,
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.add,
                        size: 20,
                        color: AppColors.primaryColor,
                        fontWeight: FontWeight.bold,
                      ),
                      SizedBox(width: 5),
                      Text(
                        "ADD NEW",
                        style: TextStyle(
                          color: AppColors.primaryColor,
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
