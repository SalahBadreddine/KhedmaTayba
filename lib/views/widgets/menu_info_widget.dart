import 'package:flutter/material.dart';
import 'package:food_delivery/constants/constants.dart';

class MenuInfoWidget extends StatelessWidget {
  const MenuInfoWidget({super.key, required this.infos});

  final List<List<dynamic>> infos;

  @override
  Widget build(BuildContext context) {
    return Container(
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
              onTap: infos.elementAt(index).elementAt(2),
              contentPadding: EdgeInsets.only(left: 10),
              title: Text(
                infos.elementAt(index).elementAt(0),
                style: TextStyle(color: AppColors.darkColor, fontSize: 16),
              ),
              trailing: IconButton(
                onPressed: () {
                },
                icon: Icon(
                  Icons.arrow_forward_ios,
                  size: 12,
                  color: Color(0xFF747783),
                ),
              ),
              leading: Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
                child: infos.elementAt(index).elementAt(1),
              ),
            );
          }),
        ),
      ),
    );
  }
}
