import 'package:flutter/material.dart';
import 'package:food_delivery/constants/constants.dart';
import 'package:food_delivery/views/pages/forgot_password_page.dart';
import 'package:food_delivery/views/pages/signup_page.dart';
import 'package:food_delivery/views/widgets/orange_button_widget.dart';
import 'package:food_delivery/views/widgets/page_title_widget.dart';
import 'package:food_delivery/views/widgets/textfield_widget.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool? isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Color(0xFF121223),),
      backgroundColor: Color(0xFF121223),
      body: Column(
        children: [
          Flexible(
            flex: 2,
            child: Center(
              child: PageTitleWidget(
                title: "Log In",
                subtitle: "Please sign in to your existing account",
                ),
              ),
            ),        Expanded(
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
                    ),
                    SizedBox(height: 20),
                    TextfieldWidget(
                      title: "PASSWORD",
                      placeholder: "* * * * * * * * * *",
                    ),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Checkbox(
                              value: isChecked,
                              onChanged: (value) {
                                setState(() {
                                  isChecked = value;
                                });
                              },
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5),
                              ),
                              side: BorderSide(color: Color(0xFFE3EBF2)),
                            ),
                            Text(
                              "Remember me",
                              style: TextStyle(
                                color: Color(0xFf7E8A97),
                                fontSize: 13,
                              ),
                            ),
                          ],
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return ForgotPasswordPage();
                                },
                              ),
                            );
                          },
                          child: Text(
                            "Forgot Password",
                            style: TextStyle(
                              color: AppColors.primaryColor,
                              fontFamily: "Sen",
                              fontSize: 14,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20.0),
                      child: OrangeButtonWidget(
                        onPressed: () {},
                        buttontext: "LOG IN",
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Don't have an account?",
                          style: TextStyle(
                            color: Color(0xFF646982),
                            fontSize: 16,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.push(context, MaterialPageRoute(builder:(context) {
                              return SignupPage();
                            },));
                          },
                          child: Text(
                            "SIGN UP",
                            style: TextStyle(
                              color: AppColors.primaryColor,
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    Text(
                      "Or",
                      style: TextStyle(
                        color: Color(0xFF646982),
                        fontSize: 16,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    SizedBox(height: 15),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        CircleAvatar(
                          radius: 30,
                          child: ClipOval(
                            child: Image.asset(
                              "assets/images/facebook.png",
                              fit: BoxFit.contain,
                              height: 62,
                              width: 62,
                            ),
                          ),
                        ),
                        CircleAvatar(
                          radius: 30,
                          backgroundColor: Color(0xFF169CE8),
                          child: ClipOval(
                            child: Image.asset(
                              "assets/images/twitter.png",
                              fit: BoxFit.contain,
                              height: 62,
                              width: 62,
                            ),
                          ),
                        ),
                        CircleAvatar(
                          radius: 30,
                          backgroundColor: Colors.black,
                          child: ClipOval(
                            child: Image.asset(
                              "assets/images/apple.webp",
                              fit: BoxFit.contain,
                              height: 62,
                              width: 62,
                            ),
                          ),
                        ),
                      ],
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
