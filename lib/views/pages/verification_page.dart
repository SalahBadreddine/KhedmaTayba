import 'package:flutter/material.dart';
import 'package:food_delivery/constants/classes.dart';
import 'package:food_delivery/views/widgets/orange_button_widget.dart';
import 'package:food_delivery/views/widgets/page_title_widget.dart';

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
            flex: 8,
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
                padding: EdgeInsetsGeometry.all(25),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("CODE", style: KTextStyle.TextfieldInfo),
                        RichText(
                          text: TextSpan(
                            text: "Resend",
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              decoration: TextDecoration.underline,
                            ),
                            children: [
                              TextSpan(
                                text: " in.50sec",
                                style: TextStyle(
                                  color: Color(0xFF32343E),
                                  fontWeight: FontWeight.normal,
                                  decoration: TextDecoration.none,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: List.generate(4, (index) {
                        return SizedBox(
                          width: 62,
                          height: 62,
                          child: TextFormField(
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              color: Color(0xFF32343E),
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                            keyboardType: TextInputType.number,
                            maxLength: 1, 
                            decoration: InputDecoration(
                              counterText: "", 
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide.none,
                              ),
                              filled: true,
                              fillColor: const Color(0xFFF0F5FA),
                              contentPadding: const EdgeInsets.all(20),
                            ),
                          ),
                        );
                      }),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 30.0),
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
