import 'package:flutter/material.dart';
import 'package:food_delivery/views/pages/home_page.dart';
import 'package:food_delivery/views/widgets/orange_button_widget.dart';

class LocationAccessPage extends StatelessWidget {
  const LocationAccessPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        
      ),
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Center(
          child: Column(
            children: [
              Image.asset("assets/images/location.png", height: 250),
              SizedBox(height: 100),
              OrangeButtonWidget(
                onPressed: () {
                  Navigator.push(
                    context,
                    PageRouteBuilder(
                      transitionDuration: Duration(milliseconds: 700),
                      pageBuilder: (context, animation, secondaryAnimation) => HomePage(),
                      transitionsBuilder: (context, animation, secondaryAnimation, child) {
                        final fadeAnimation = CurvedAnimation(
                          parent: animation,
                          curve: Curves.easeInOut,
                        );

                        final offsetAnimation = Tween<Offset>(
                          begin: Offset(0.0, 0.2), 
                          end: Offset.zero,  
                        ).animate(CurvedAnimation(
                          parent: animation,
                          curve: Curves.easeOutCubic,
                        ));

                        return FadeTransition(
                          opacity: fadeAnimation,
                          child: SlideTransition(
                            position: offsetAnimation,
                            child: child,
                          ),
                        );
                      },
                    ),
                  );
                },
                buttontext: "ACCESS LOCATION",
                icon: Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: Icon(Icons.location_on),
                ),
              ),
              SizedBox(height: 50),
              Text(
                "DFOOD WILL ACCESS YOUR LOCATION ONLY WHILE USING THE APP",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xFF646982),
                  fontSize: 16,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
