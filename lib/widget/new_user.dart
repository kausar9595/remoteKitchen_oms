import 'package:flutter/material.dart';
import 'package:oms/assets/app_assets.dart';
import 'package:oms/widget/app_button.dart';


class NewUser extends StatelessWidget {
  final VoidCallback onClick;
  final String mes;
  const NewUser({super.key, required this.onClick, required this.mes});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: EdgeInsets.all(15),
        width: 350,
        height: 300,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
                color: Colors.grey.shade200,
                spreadRadius: 3,
                blurRadius: 5,
                offset: Offset(0,2)
            )
          ]
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(AppAssets.location, height: 40, width: 40,),
            SizedBox(height: 20,),
            Text("Welcome to OMS",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: Colors.black
              ),
            ),
            SizedBox(height: 10,),
            Text(mes,
              style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: Colors.black
              ),
            ),
            SizedBox(height: 20,),
            AppButton(text: "Select Restaurant", fontSize: 12, width: 200, height: 50, onClick: onClick)

          ],
        ),
      ),
    );
  }
}
