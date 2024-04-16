

import 'package:flutter/material.dart';
import 'package:oms/utility/app_const.dart';

import '../utility/appcolor.dart';

class AppButton extends StatelessWidget {
  const AppButton({
    super.key,
    required this.text,
    required this.width,
    required this.height,
    this.bgColor = AppColors.textindigo,
    required this.onClick,
    this.isLoading = false,
    this.fontSize = 18,

  });
  final String text;
  final Color bgColor;
  final double width;
  final double height;
  final VoidCallback onClick;
  final bool isLoading;
  final double fontSize;


  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onClick,
      child: Container(
        alignment: Alignment.center,
        height: height,
        width: width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: isLoading ? bgColor.withOpacity(0.4) : bgColor,
        ),
        child: isLoading ? Center(child: CircularProgressIndicator(color: Colors.white,),) : Text(
          text,
          style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: fontSize,
              color: Colors.white),
        ),
      ),
    );
  }
}