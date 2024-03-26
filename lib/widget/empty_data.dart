import 'package:flutter/material.dart';
import 'package:oms/assets/app_assets.dart';
import 'package:oms/widget/app_button.dart';


class EmptyData extends StatelessWidget {
  final VoidCallback onClick;
  final String mes;
  const EmptyData({super.key, required this.onClick, required this.mes});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: EdgeInsets.all(15),
        width: 350,
        height: 350,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),

        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(AppAssets.noDataFound, height: 100, width: 100,),
            SizedBox(height: 20,),
            Text("Data not found",
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: Colors.black
              ),
            ),
            SizedBox(height: 10,),
            Text(mes,
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: Colors.black
              ),
            ),
            SizedBox(height: 20,),
            AppButton(text: "Reload", fontSize: 12, width: 200, height: 50, onClick: onClick)

          ],
        ),
      ),
    );
  }
}
