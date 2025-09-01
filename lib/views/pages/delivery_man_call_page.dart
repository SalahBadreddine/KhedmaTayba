import 'package:flutter/material.dart';
import 'package:food_delivery/constants/constants.dart';

class DeliveryManCallPage extends StatelessWidget {
  const DeliveryManCallPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/map.jpeg"),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              height: 377,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
              ),
              child: Padding(
                padding: const EdgeInsets.all(30.0),
                child: Column(
                  children: [
                    Container(
                      width: 105,
                      height: 105,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: AssetImage("assets/images/deliveryman.jpg"),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      "Robert Fox",
                      style: TextStyle(
                        color: AppColors.homeDark,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      "Connecting.......",
                      style: TextStyle(
                        color: Color(0xFF979797),
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Container(
                          width: 48,
                          height: 48,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Color(0xFFECF0F4),
                          ),
                          child: IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.volume_off_outlined,
                              color: AppColors.homeDark,
                            ),
                            padding: EdgeInsets.all(0),
                          ),
                        ),
                        Stack(
                          alignment: Alignment.center,
                          children: [
                            Container(
                              width: 115,
                              height: 114,
                              decoration: BoxDecoration(
                                // ignore: deprecated_member_use
                                color: AppColors.primaryColor.withOpacity(0.05),
                                shape: BoxShape.circle
                              ),
                            ),
                            Container(
                              width: 85,
                              height: 84,
                              decoration: BoxDecoration(
                                // ignore: deprecated_member_use
                                color: AppColors.primaryColor.withOpacity(0.1),
                                shape: BoxShape.circle
                              ),
                            ),
                            Container(
                              width: 60,
                              height: 60,
                              decoration: BoxDecoration(
                                color: Color(0xFFFF3434),
                                shape: BoxShape.circle
                              ),
                              child: IconButton(
                                padding: EdgeInsets.all(0),
                                onPressed: () => Navigator.pop(context), 
                                icon: Icon(Icons.call_outlined, color: Colors.white, size: 30, fontWeight: FontWeight.bold,)
                              ),
                            ),
                          ],
                        ),
                        Container(
                          width: 48,
                          height: 48,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Color(0xFFECF0F4),
                          ),
                          child: IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.volume_up_outlined,
                              color: AppColors.homeDark,
                            ),
                            padding: EdgeInsets.all(0),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
