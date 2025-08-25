import 'package:flutter/material.dart';
import 'package:food_delivery/views/pages/verification_page.dart';
import 'package:food_delivery/views/widgets/orange_button_widget.dart';
import 'package:food_delivery/views/widgets/page_title_widget.dart';
import 'package:food_delivery/views/widgets/textfield_widget.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
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
                title: "Sign Up",
                subtitle: "Please sign up to get started",
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
                padding: EdgeInsetsGeometry.all(20),
                child: Column(
                  children: [
                    TextfieldWidget(
                      title: "NAME",
                      placeholder: "John Doe",
                      isPassword: false,
                    ),
                    SizedBox(height: 20),
                    TextfieldWidget(
                      title: "EMAIL",
                      placeholder: "example@gmail.com",
                      isPassword: false,
                    ),
                    SizedBox(height: 20),
                    TextfieldWidget(
                      title: "PASSWORD",
                      placeholder: "* * * * * * * * * *",
                      isPassword: true,
                    ),
                    SizedBox(height: 20),
                    TextfieldWidget(
                      title: "RE-TYPE PASSWORD",
                      placeholder: "* * * * * * * * * *",
                      isPassword: true,
                    ),
                    SizedBox(height: 40),
                    OrangeButtonWidget(
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
                      buttontext: "SIGN UP",
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
