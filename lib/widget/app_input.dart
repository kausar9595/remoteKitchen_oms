import 'package:flutter/material.dart';
import 'package:oms/utility/app_const.dart';

class AppInput extends StatelessWidget {
  const AppInput({
    super.key,
    required this.hintText,
    this.title,
    required this.controller,
    this.suffixIcon,
    this.readOnly = false,
    this.obscureText = false,
    this.validator,
  });
  final TextEditingController controller;
  final String? title;
  final String hintText;
  final Widget? suffixIcon;
  final bool obscureText;
  final bool readOnly;
  final String? Function(String?)? validator;




  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width*0.35,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("$title",style: TextStyle(fontWeight: FontWeight.w500,fontSize: normalFontSize,color: Colors.black),),
          TextFormField(
            readOnly: readOnly,
            obscureText: obscureText,
            validator: validator,
            controller: controller,
            decoration: InputDecoration(
              hintText: hintText,
              hintStyle: TextStyle(
                  fontSize: normalFontSize,
                  fontWeight: FontWeight.w500,
                  color: Colors.black),
              suffixIcon: suffixIcon,
              filled: true,
              fillColor: Colors.white,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: BorderSide(color: Colors.grey, width: 1.5),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: BorderSide(color: Colors.grey, width: 1.5),
              ),
              disabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: BorderSide(color: Colors.grey, width: 1.5),
              ),
            ),
          ),
        ],
      ),
    );
  }
}