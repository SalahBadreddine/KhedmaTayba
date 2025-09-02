import 'package:flutter/material.dart';
import 'package:food_delivery/constants/classes.dart';
import 'package:food_delivery/constants/constants.dart';
import 'package:food_delivery/views/widgets/navigation_widget.dart';
import 'package:food_delivery/views/widgets/orange_button_widget.dart';
import 'package:food_delivery/views/widgets/textfield_widget.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({super.key});

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Padding(
          padding: const EdgeInsets.all(10.0),
          child: NavigationWidget(
            icon1: Icons.arrow_back_ios,
            title: Text(
              "Edit Profile",
              style: TextStyle(color: AppColors.homeDark, fontSize: 17),
            ),
            suffixicon: SizedBox(),
            onTapLeadingButton: () => Navigator.pop(context),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Stack(
                  children: [
                    Container(
                      width: 130,
                      height: 130,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: AssetImage("assets/images/ME.jpg"),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: Container(
                        width: 41,
                        height: 41,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColors.primaryColor,
                        ),
                        child: IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.edit_outlined,
                            color: Colors.white,
                            size: 22,
                          ),
                          padding: EdgeInsets.all(0),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 30),
              TextfieldWidget(
                title: "FULL NAME",
                placeholder: "Salah Badreddine",
                isPassword: false,
              ),
              SizedBox(height: 20),
              TextfieldWidget(
                title: "EMAIL",
                placeholder: "salah.badreddine@ensia.edu.dz",
                isPassword: false,
              ),
              SizedBox(height: 20),
              TextfieldWidget(
                title: "PHONE NUMBER",
                placeholder: "+213 672186755",
                isPassword: false,
              ),
              SizedBox(height: 20),
              Text("BIO", style: KTextStyle.TextfieldInfo),
              SizedBox(height: 8),
              SizedBox(
                height: 103,
                child: TextFormField(
                  minLines: 5,
                  maxLines: null,
                  style: TextStyle(color: Color(0xFFA0A5BA), fontSize: 14),
                  decoration: InputDecoration(
                    hintText: "Vive Rechta !!!",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none,
                    ),
                    filled: true,
                    fillColor: Color(0xFFF0F5FA),
                    contentPadding: EdgeInsets.all(20),
                  ),
                ),
              ),
              SizedBox(height: 30),
              OrangeButtonWidget(onPressed: () {}, buttontext: "SAVE"),
            ],
          ),
        ),
      ),
    );
  }
}
