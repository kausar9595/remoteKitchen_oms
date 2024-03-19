import 'package:flutter/material.dart';
import 'package:oms/utility/appcolor.dart';
import 'package:oms/view/history/history_screen.dart';
import 'package:oms/view/menus/widgets/availability.dart';
import 'package:oms/view/menus/hours_screen/hours.dart';
import 'package:oms/view/order/screen/orders.dart';
import 'package:oms/view/setting_screen/setting_screen.dart';

class Menus extends StatefulWidget {
  const Menus({super.key});

  @override
  State<Menus> createState() => _MenusState();
}

class _MenusState extends State<Menus> {
  bool _isOrder = false;
  bool _isMenu = false;
  bool _isHistory = false;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          drawer: Drawer(
            backgroundColor: Colors.white,
            width: MediaQuery.of(context).size.width * 0.45,
            child: SingleChildScrollView(
              padding: EdgeInsets.only(left: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  IconButton(
                      onPressed: () {Navigator.pop(context);},
                      icon: Icon(
                        Icons.cancel_outlined,
                        color: Colors.black,
                        size: 40,
                      )),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Current location Selected",
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                        color: Colors.black),
                  ),
                  Container(
                    //margin: EdgeInsets.only(left: 10),
                    padding: EdgeInsets.only(
                      left: 10,
                    ),
                    alignment: Alignment.centerLeft,
                    height: MediaQuery.of(context).size.height * 0.06,
                    width: MediaQuery.of(context).size.width * 0.20,
                    decoration: BoxDecoration(
                      border: Border.all(color: AppColors.textindigo, width: 2),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: DropdownButton<String>(
                      isExpanded: true,
                      //alignment: Alignment.bottomCenter,
                      icon: Icon(
                        Icons.keyboard_arrow_down_rounded,
                        size: 40,
                        color: AppColors.textindigo,
                      ),
                      elevation: 0,
                      underline: Container(
                        decoration: BoxDecoration(
                          border: Border(bottom: BorderSide.none),
                        ),
                      ),
                      hint: Text(
                        "Restaurant Name",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: AppColors.textindigo,
                        ),
                      ),
                      items: <String>[
                        'Restaurant Name',
                        'Restaurant Name',
                        'Restaurant Name',
                      ].map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      onChanged: (_) {},
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 10,),
                    alignment: Alignment.centerLeft,
                    height: MediaQuery.of(context).size.height * 0.06,
                    width: MediaQuery.of(context).size.width * 0.20,
                    decoration: BoxDecoration(
                      border: Border.all(color: AppColors.textindigo, width: 2),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: DropdownButton<String>(
                      isExpanded: true,
                      //alignment: Alignment.bottomCenter,
                      icon: Icon(
                        Icons.keyboard_arrow_down_rounded,
                        size: 40,
                        color: AppColors.textindigo,
                      ),
                      elevation: 0,
                      underline: Container(
                        decoration: BoxDecoration(
                          border: Border(bottom: BorderSide.none),
                        ),
                      ),
                      hint: Text(
                        "Location Name",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: AppColors.textindigo,
                        ),
                      ),
                      items: <String>[
                        'Location Name',
                        'Location Name',
                        'Location Name',
                      ].map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      onChanged: (_) {},
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        _isOrder = true;
                        _isMenu = false;
                        _isHistory = false;
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Orders())
                        );
                      });
                    },
                    child: Container(
                      padding: EdgeInsets.only(left: 20),
                      alignment: Alignment.centerLeft,
                      height: 50,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        border: _isOrder
                            ? Border(
                                left: BorderSide(
                                    color: AppColors.textindigo, width: 6))
                            : Border(left: BorderSide.none),
                        color: _isOrder ? Colors.grey : Colors.transparent,
                      ),
                      child: Text(
                        "Orders",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,color: Colors.black),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        _isMenu = true;
                        _isOrder = false;
                        _isHistory = false;
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>Menus()));
                      });
                    },
                    child: Container(
                      padding: EdgeInsets.only(left: 20),
                      alignment: Alignment.centerLeft,
                      height: 50,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        border: _isMenu
                            ? Border(
                                left: BorderSide(
                                    color: AppColors.textindigo, width: 6),
                              )
                            : Border(left: BorderSide.none),
                        color: _isMenu ? Colors.grey : Colors.transparent,
                      ),
                      child: Text(
                        "Menu",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            color: Colors.black),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        _isHistory = true;
                        _isOrder = false;
                        _isMenu = false;
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => HistoryScreen()));
                      });
                    },
                    child: Container(
                      padding: EdgeInsets.only(left: 20),
                      alignment: Alignment.centerLeft,
                      height: 50,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        border: _isHistory
                            ? Border(
                                left: BorderSide(
                                    color: AppColors.textindigo, width: 6),
                        ) : Border(left: BorderSide.none),
                        color: _isHistory ? Colors.grey : Colors.transparent,
                      ),
                      child: Text(
                        "History",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            color: Colors.black),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 100,
                  ),
                  InkWell(
                    onTap: (){},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "Dashboard",
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                              color: Colors.black),
                        ),
                        Icon(Icons.ios_share_sharp,size: 20,color: Colors.black,),
                        SizedBox(width: 60,),


                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>SettingScreen()));
                    },
                    child: Text(
                      "Settings",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: Colors.black),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  InkWell(
                    onTap: (){},
                    child: Text(
                      "Helps",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: Colors.black),
                    ),
                  ),
                ],
              ),
            ),
          ),
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
          body: TabBarView(children: [
            AvailabilityMenus(),
            HoursMenus(),
          ]),
        ),
      ),
    );
  }
}
