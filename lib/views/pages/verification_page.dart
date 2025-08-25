import 'package:flutter/material.dart';
import 'package:food_delivery/views/widgets/orange_button_widget.dart';
import 'package:food_delivery/views/widgets/page_title_widget.dart';
import 'package:food_delivery/views/widgets/textfield_widget.dart';

class VerificationPage extends StatefulWidget {
  const VerificationPage({super.key});

  @override
  State<VerificationPage> createState() => _VerificationPageState();
}

class _VerificationPageState extends State<VerificationPage> {
  final bool? isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF121223),
        leading: Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
            ),
            child: BackButton(color: Color(0xFF5E616F)),
          ),
        ),
      ),
      backgroundColor: Color(0xFF121223),
      body: Column(
        children: [
          Flexible(
            flex: 2,
              child: Center(
                child: Column(
                  children: [
                    PageTitleWidget(
                      title: "Verification",
                      subtitle: "We have sent a code to your email",
                    ),
                    Text(
                      "example@gmail.com",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          Expanded(
            flex: 7,
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(24),
                  topRight: Radius.circular(24),
                ),
              ),
              child: Padding(
                padding: EdgeInsetsGeometry.all(20),
                child: Column(
                  children: [
                    TextfieldWidget(
                      title: "CODE",
                      placeholder: "example@gmail.com",
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20.0),
                      child: OrangeButtonWidget(
                        onPressed: () {},
                        buttontext: "VERIFY",
                      ),
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
