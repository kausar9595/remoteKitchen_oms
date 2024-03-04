import 'package:flutter/material.dart';

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
      appBar:AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.menu,
            color: Colors.black,
            size: 30,
          ),
        ),
        title: Row(children: [
          Text(
            "Menu",
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
                color: Colors.black),
          ),
          SizedBox(
            width: 15,
          ),
          Container(
            alignment: Alignment.center,
            height: 40,
            width: 140,
            decoration: BoxDecoration(
              border:Border.all(color: AppColors.textindigo,width: 2),
              borderRadius: BorderRadius.circular(10),
            ),
            child: DropdownButton<String>(
              icon: Icon(Icons.keyboard_arrow_down_rounded,size: 35,color: AppColors.textindigo,),

              elevation: 0,
              underline:Container(
                decoration: BoxDecoration(
                  border: Border(bottom: BorderSide.none),
                ),
              ),

              hint: Text("Menu Name",style: TextStyle(fontSize: 14,fontWeight: FontWeight.w500,color:AppColors.textindigo),),
              items: <String>['A', 'B', 'C', 'D'].map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),

              onChanged: (_) {},

            ),
          ),
        ],),
        actions: [
          SizedBox(
            width: 300,
            child: TabBar(
                labelStyle: TextStyle(fontSize: 20,fontWeight:FontWeight.w600,color:AppColors.textblack),
                tabs: [
                  Tab(text: "Availability",),
                  Tab(text:"Hours" ,),
                ]),
          ),
          SizedBox(width: 20,)
        ],

      ),
    ));
  }
}
