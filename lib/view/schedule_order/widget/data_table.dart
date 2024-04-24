import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../utility/app_const.dart';
import '../../../utility/appcolor.dart';

class ScheduleTable extends StatelessWidget {
  const ScheduleTable({
    super.key,
    required this.customerName,
    required this.orderId,
    required this.qty,
    required this.itemName,
    required this.modifire,
    required this.orderPrice,
    required this.date,
    this.onTap,
    this.buttonColor,
    this.buttonText,

  });
  final String orderId;
  final String customerName;
  final String qty;
  final String itemName;
  final String modifire;
  final String orderPrice;
  final String date;
  final VoidCallback? onTap;
  final Color? buttonColor;
  final String? buttonText;


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(bottom: 20),
        padding: EdgeInsets.only(bottom: 10),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(width: 1, color: AppColors.grey200)
          )
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(orderId,
                  style: TextStyle(fontSize: smallFontSize,fontWeight: FontWeight.w500,color: AppColors.textblack),
                ),
                Text(customerName,
                  style: TextStyle(fontSize: normalFontSize,fontWeight: FontWeight.w600,color: AppColors.textblack),
                ),
              ],
            ),
            Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Colors.grey,),
              ),
              child: Center(child: Text(qty,
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: normalFontSize,
                  color: AppColors.textblack,
                ),
              ),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                Text(modifire,
                  style: TextStyle(fontSize: smallFontSize,fontWeight: FontWeight.w500,color: AppColors.textblack),
                ),
                Text(itemName,
                  style: TextStyle(fontSize: normalFontSize,fontWeight: FontWeight.w600,color: AppColors.textblack),
                ),
              ],
            ),
            Text(orderPrice,
              style: TextStyle(fontSize: normalFontSize,fontWeight: FontWeight.w500,color: AppColors.textblack),
            ),
            Text("${date}",
              style: TextStyle(fontWeight: FontWeight.w400,fontSize: normalFontSize,color: AppColors.textblack),
            ),
            InkWell(
              onTap: (){},
              child: Container(
                height: 50,
                width: 200,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: buttonColor,
                ),
                child: Center(child: Text(buttonText!,
                  style: TextStyle(fontSize: normalFontSize,fontWeight: FontWeight.w500,color: AppColors.textblack),
                )),
              ),
            )



          ],
        ),
      ),
    );
  }
}