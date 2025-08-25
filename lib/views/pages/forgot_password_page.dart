import 'package:flutter/material.dart';
import 'package:food_delivery/views/pages/verification_page.dart';
import 'package:food_delivery/views/widgets/orange_button_widget.dart';
import 'package:food_delivery/views/widgets/page_title_widget.dart';
import 'package:food_delivery/views/widgets/textfield_widget.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
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
              child: PageTitleWidget(
                title: "Forgot Password",
                subtitle: "Please sign in to your existing account",
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
                  children: [
                    TextfieldWidget(
                      title: "EMAIL",
                      placeholder: "example@gmail.com",
                      isPassword: false,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20.0),
                      child: OrangeButtonWidget(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return VerificationPage();
                              },
                            ),
                          );
                        },
                        buttontext: "SEND CODE",
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
