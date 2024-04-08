import 'package:flutter/material.dart';
import 'package:oms/utility/app_const.dart';

import '../../../utility/appcolor.dart';
class Modifiers extends StatefulWidget {
  const Modifiers({super.key});

  @override
  State<Modifiers> createState() => _ModifiersState();
}

class _ModifiersState extends State<Modifiers> {
  bool _ischeck=false;
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      backgroundColor: Colors.white,
      appBar:AppBar(
        backgroundColor: Colors.white,
        title: Text("Modifiers",
          style: TextStyle(
            fontWeight: FontWeight.w600,
            color: Colors.black,
            fontSize: titleFontSize,
          ),
        ),
      ),
      body: Column(
        children: [

        ],
      ),
    ));
  }
}
