

import 'package:flutter/material.dart';

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

  });
  final String text;
  final Color bgColor;
  final double width;
  final double height;
  final VoidCallback onClick;
  final bool isLoading;


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
          color: bgColor,
        ),
        child: Text(
          text,
          style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 20,
              color: Colors.white),
        ),
      ),
    );
  }
}