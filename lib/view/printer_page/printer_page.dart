

import 'package:flutter/material.dart';
import 'package:oms/assets/app_assets.dart';
import 'package:oms/utility/app_const.dart';

import '../../utility/appcolor.dart';

class PrinterPage extends StatefulWidget {
  const PrinterPage({super.key});

  @override
  State<PrinterPage> createState() => _PrinterPageState();
}

class _PrinterPageState extends State<PrinterPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.only(left: 25,right: 25,top: 10,bottom: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Byungwhi K \n Delivery",
              style: TextStyle(
                  fontSize: bigFontSize,
                  fontWeight: FontWeight.w500,
                  color: Colors.black),
            ),
            SizedBox(height: 10,),
            Text("DoorDash #04932050",
              style: TextStyle(
                  fontSize: titleFontSize,
                  fontWeight: FontWeight.w600,
                  color: Colors.black),
            ),
            Divider(color: Colors.black,thickness: 2,),
            Text("+17828225054",
              style: TextStyle(fontSize: normalFontSize,
                  fontWeight: FontWeight.w400,
                  color: AppColors.textblack,
              ),
            ),
            Text("Delivery note :",
              style: TextStyle(fontSize: normalFontSize,
                  fontWeight: FontWeight.w400,
                  color: AppColors.textblack,
              ),
            ),
            Divider(color: Colors.black,thickness: 2,),
            Text("Meat that Skewers&Kabab",
              style: TextStyle(fontSize: normalFontSize,
              fontWeight: FontWeight.w400,
              color: AppColors.textblack,
            ),
            ),
            Text("1 Item",
              style: TextStyle(fontSize: normalFontSize,
              fontWeight: FontWeight.w400,
              color: AppColors.textblack,
            ),
            ),
            Container(
              padding: EdgeInsets.only(left: 10,top: 5,bottom: 5),
              alignment: Alignment.centerLeft,
              height: 80,
              width: double.infinity,
              color: Colors.black,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("ORDER NOTE",
                    style: TextStyle(
                        fontSize: normalFontSize,
                        fontWeight: FontWeight.w400,
                        color: Colors.white),
                  ),
                  SizedBox(height: 5,),
                  Text("Doordas Marketplace",
                    style: TextStyle(
                        fontSize: titleFontSize,
                        fontWeight: FontWeight.w400,
                        color:Colors.white),
                  ),
                ],
              ),
            ),SizedBox(height: 10,),
            Text("1x Meat Lovers Lamb\nKabab Fried Rice",
              style: TextStyle(fontSize: bigFontSize,
                  fontWeight: FontWeight.w600,
                  color: AppColors.textblack),
            ),
            Text("\$21.23",style: TextStyle(
                fontSize: bigFontSize,
                fontWeight: FontWeight.w600,
                color: AppColors.textblack),
            ),
            Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Subtotal :",
                  style: TextStyle(fontSize: normalFontSize,
                      fontWeight: FontWeight.w400,
                      color: AppColors.textblack),
                ),
                Text("\$21.23",
                  style: TextStyle(fontSize: normalFontSize,
                      fontWeight: FontWeight.w400,
                      color: AppColors.textblack),
                )
              ],
            ),
            SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Tax :",
                  style: TextStyle(fontSize: normalFontSize,
                      fontWeight: FontWeight.w400,
                      color: AppColors.textblack),
                ),
                Text("\$0.85",
                  style: TextStyle(fontSize: normalFontSize,
                      fontWeight: FontWeight.w400,
                      color: AppColors.textblack),
                )
              ],
            ),
            SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Total :",
                  style: TextStyle(fontSize: normalFontSize,
                      fontWeight: FontWeight.w400,
                      color: AppColors.textblack),
                ),
                Text("\$22.08",
                  style: TextStyle(fontSize: normalFontSize,
                      fontWeight: FontWeight.w400,
                      color: AppColors.textblack),
                )
              ],
            ),
            Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Meat that\nSkewers & Kabab Direct\nOrders",
                  style: TextStyle(fontSize: normalFontSize,
                      fontWeight: FontWeight.w500,color: AppColors.textblack),
                ),
                SizedBox(
                  height: 100,
                  width: 100,
                  child: Image.asset(AppAssets.qrCode,fit: BoxFit.cover,),
                ),


              ],
            ),
            Divider(),
            SizedBox(height: 10,),
            Text("Thank you, we hope you enjoy your meal.",
              style: TextStyle(fontSize: titleFontSize,
                  fontWeight: FontWeight.w500,
                  color: AppColors.textblack,),
            ),
            SizedBox(height: 10,),
            Container(
              alignment: Alignment.center,
              height: 50,
              width: double.infinity,
              color: Colors.black,
              child: Center(
                child: Text("Received : Wed Aug 9 at 8:23 PM",
                  style: TextStyle(fontSize: titleFontSize,color: Colors.white,fontWeight: FontWeight.w500),
                ),
              ),
            )

          ],
        ),
      ),
    ));
  }
}
