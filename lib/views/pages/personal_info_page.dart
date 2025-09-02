import 'package:flutter/material.dart';
import 'package:food_delivery/constants/constants.dart';
import 'package:food_delivery/views/pages/edit_profile_page.dart';
import 'package:food_delivery/views/widgets/navigation_widget.dart';

class PersonalInfoPage extends StatelessWidget {
  const PersonalInfoPage({super.key});

  @override
  Widget build(BuildContext context) {
    List<List<dynamic>> infos = [
      [
        "FULL NAME",
        "Salah Badreddine",
        Icon(Icons.person_outlined, color: Color(0xFFFB6F3D)),
      ],
      [
        "EMAIL",
        "salah.badreddine@ensia.edu.dz",
        Icon(Icons.email_outlined, color: Color(0xFF413DFB)),
      ],
      [
        "PHONE NUMBER",
        "+213 672186755",
        Icon(Icons.phone_outlined, color: Color(0xFF369BFF)),
      ],
    ];
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Padding(
          padding: const EdgeInsets.all(10.0),
          child: NavigationWidget(
            icon1: Icons.arrow_back_ios,
            title: Text(
              "Personal Info",
              style: TextStyle(color: AppColors.homeDark, fontSize: 17),
            ),
            suffixicon: TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return EditProfilePage();
                    },
                  ),
                );
              },
              child: Text(
                "EDIT",
                style: TextStyle(
                  color: AppColors.primaryColor,
                  fontSize: 14,
                  decoration: TextDecoration.underline,
                  decorationColor: AppColors.primaryColor,
                ),
              ),
            ),
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
              Row(
                children: [
                  Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: AssetImage("assets/images/ME.jpg"),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(width: 25),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Salah Badreddine",
                        style: TextStyle(
                          color: AppColors.darkColor,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        "Vive Rechta !!!",
                        style: TextStyle(
                          color: Color(0xFFA0A5BA),
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 30),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Color(0xFFECF0F4),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    children: List.generate(infos.length, (index) {
                      return ListTile(
                        contentPadding: EdgeInsets.only(left: 10),
                        title: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              infos.elementAt(index).elementAt(0),
                              style: TextStyle(
                                color: AppColors.darkColor,
                                fontSize: 14,
                              ),
                            ),
                            Text(
                              infos.elementAt(index).elementAt(1),
                              style: TextStyle(
                                color: Color(0xFF6B6E82),
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                        leading: Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                          ),
                          child: infos.elementAt(index).elementAt(2),
                        ),
                      );
                    }),
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
