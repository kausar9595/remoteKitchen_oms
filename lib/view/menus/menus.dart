import 'package:flutter/material.dart';
import 'package:oms/utility/appcolor.dart';
import 'package:oms/view/history/history_screen.dart';
import 'package:oms/view/menus/widgets/availability.dart';
import 'package:oms/view/menus/hours_screen/hours.dart';
import 'package:oms/view/order/screen/orders.dart';
import 'package:oms/view/setting_screen/setting_screen.dart';

import '../../widget/app_drawer.dart';

class Menus extends StatefulWidget {
  const Menus({super.key});

  @override
  State<Menus> createState() => _MenusState();
}

class _MenusState extends State<Menus> {


  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          drawer: AppDrawer(),
          appBar: AppBar(
            backgroundColor: Colors.white,
            title: Row(
              children: [
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
                    border: Border.all(color: AppColors.textindigo, width: 2),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: DropdownButton<String>(
                    icon: Icon(
                      Icons.keyboard_arrow_down_rounded,
                      size: 35,
                      color: AppColors.textindigo,
                    ),
                    elevation: 0,
                    underline: Container(
                      decoration: BoxDecoration(
                        border: Border(bottom: BorderSide.none),
                      ),
                    ),
                    hint: Text(
                      "Menu Name",
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: AppColors.textindigo),
                    ),
                    items: <String>['A', 'B', 'C', 'D'].map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (_) {},
                  ),
                ),
              ],
            ),
            actions: [
              SizedBox(
                width: 300,
                child: TabBar(
                    labelStyle: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: AppColors.textblack),
                    tabs: [
                      Tab(
                        text: "Availability",
                      ),
                      Tab(
                        text: "Hours",
                      ),
                    ]),
              ),
              SizedBox(
                width: 20,
              )
            ],
          ),
          body: TabBarView(
              children: [
            AvailabilityMenus(),
            HoursMenus(),
          ]),
        ),
      ),
    );
  }
}
