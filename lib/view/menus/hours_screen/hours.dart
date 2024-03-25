import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:oms/view/menus/hours_screen/special_hour.dart';

import '../../../utility/appcolor.dart';
import 'regular_hours_setting.dart';

class HoursMenus extends StatefulWidget {
  const HoursMenus({super.key});

  @override
  State<HoursMenus> createState() => _HoursMenusState();
}

class _HoursMenusState extends State<HoursMenus> {
  bool _isRegular = true;
  bool _isSpacial = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
                flex: 1,
                child: ListView(
                  children: [
                    InkWell(
                        onTap: () {
                          setState(() {
                            _isRegular = true;
                            _isSpacial = false;
                          });
                        },
                        child: Container(
                            padding: EdgeInsets.only(
                                left: 25, right: 25, top: 10, bottom: 10),
                            decoration: BoxDecoration(
                                color: _isRegular
                                    ? AppColors.selectgrey
                                    : Colors.white,
                                border: _isRegular
                                    ? Border(
                                        left: BorderSide(
                                            width: 5, color: Colors.green))
                                    : Border.all(
                                        width: 0, color: Colors.white)),
                            child: Text(
                              "Regular Hours",
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.textblack),
                            ))),
                    SizedBox(
                      height: 10,
                    ),
                    InkWell(
                        onTap: () {
                          setState(() {
                            _isRegular = false;
                            _isSpacial = true;
                          });
                        },
                        child: Container(
                          padding: EdgeInsets.only(
                              left: 25, right: 25, top: 10, bottom: 10),
                          decoration: BoxDecoration(
                              color: _isSpacial
                                  ? AppColors.selectgrey
                                  : Colors.white,
                              border: _isSpacial
                                  ? Border(
                                      left: BorderSide(
                                          width: 5, color: Colors.green))
                                  : Border.all(width: 0, color: Colors.white)),
                          child: Text(
                            "Special Hours",
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: AppColors.textblack),
                          ),
                        )),
                  ],
                )),
            _isRegular ? RegularHoursSetting() : Center(),
            _isSpacial ? SpecialHour() : Center()

          ],
        ),
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.only(left: 15, right: 15),
        margin: EdgeInsets.only(bottom: 15),
        height: MediaQuery.of(context).size.height * 0.07,
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              InkWell(
                onTap: () {},
                child: Text(
                  "Restore settings",
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: AppColors.textindigo),
                ),
              ),
              InkWell(
                onTap: () {},
                child: Container(
                  alignment: Alignment.center,
                  height: MediaQuery.of(context).size.height * 0.08,
                  width: MediaQuery.of(context).size.width * 0.15,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: AppColors.textindigo,
                  ),
                  child: Text(
                    "Save Changes",
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.white),
                  ),
                ),
              )
            ]),
      ),
    ));
  }
}
