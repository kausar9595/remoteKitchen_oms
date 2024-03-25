import 'package:flutter/material.dart';

AppSnackBar(context, text, color){
  return ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      backgroundColor: color,
      duration: const Duration(milliseconds: 3000),
      content:  Text(text),
    ),
  );
}