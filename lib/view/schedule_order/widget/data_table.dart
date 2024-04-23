import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../utility/app_const.dart';
import '../../../utility/appcolor.dart';

class scheduleTable extends StatelessWidget {
  const scheduleTable({
    super.key,
    required this.rowOneTitle,
    required this.rowOneSubtitle,
    required this.orderCount,
    required this.rowTwoTitle,
    required this.rowTwoSubtitle,
    required this.orderPrice,
    this.onTap,
    this.buttonColor,
    this.buttonText,

  });
  final String rowOneTitle;
  final String rowOneSubtitle;
  final String orderCount;
  final String rowTwoTitle;
  final String rowTwoSubtitle;
  final String orderPrice;
  final VoidCallback? onTap;
  final Color? buttonColor;
  final String? buttonText;


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(rowOneTitle,
                style: TextStyle(fontSize: smallFontSize,fontWeight: FontWeight.w500,color: AppColors.textblack),
              ),
              Text(rowOneSubtitle,
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
            child: Center(child: Text(orderCount,
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
              Text(rowTwoTitle,
                style: TextStyle(fontSize: smallFontSize,fontWeight: FontWeight.w500,color: AppColors.textblack),
              ),
              Text(rowTwoSubtitle,
                style: TextStyle(fontSize: normalFontSize,fontWeight: FontWeight.w600,color: AppColors.textblack),
              ),
            ],
          ),
          Text(orderPrice,
            style: TextStyle(fontSize: normalFontSize,fontWeight: FontWeight.w500,color: AppColors.textblack),
          ),
          Text("12 Jun 2023 | 10:23 PM",
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
    );
  }
}