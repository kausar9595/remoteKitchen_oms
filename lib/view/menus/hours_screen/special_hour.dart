import 'package:flutter/material.dart';
import 'package:oms/utility/app_const.dart';


import '../../../utility/appcolor.dart';

class SpecialHour extends StatefulWidget {
  const SpecialHour({super.key});

  @override
  State<SpecialHour> createState() => _SpecialHourState();
}

class _SpecialHourState extends State<SpecialHour> {
  bool _ischeck = false;
  @override
  Widget build(BuildContext context) {
    return Expanded(
        flex: 3,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.all(10),
              alignment: Alignment.center,
              height: MediaQuery.of(context).size.height * 0.25,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Date",
                            style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: smallFontSize,
                                color: Colors.black),
                          ),
                          SizedBox(height: 10,),
                          Container(
                            padding: EdgeInsets.only(top: 15),
                            height: MediaQuery.of(context).size.height * 0.06,
                            width: MediaQuery.of(context).size.width * 0.18,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(15),
                              border: Border.all(color:AppColors.grey200),
                            ),
                            child: Center(
                              child: TextFormField(
                                textAlign: TextAlign.start,
                                decoration: InputDecoration(
                                  hintText: "2/16/24",
                                  hintStyle: TextStyle(
                                      fontSize: smallFontSize,
                                      fontWeight: FontWeight.w400,
                                  ),
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                  )
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Opens at",
                            style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: smallFontSize,
                                color: Colors.black),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          InkWell(
                            onTap: () {},
                            child: Container(
                              alignment: Alignment.centerLeft,
                              padding: EdgeInsets.only(left: 10),
                              height: MediaQuery.of(context).size.height * 0.06,
                              width: MediaQuery.of(context).size.width * 0.18,
                              decoration: BoxDecoration(
                                color: AppColors.selectgrey,
                                borderRadius: BorderRadius.circular(15),
                                border: Border.all(color: Colors.grey),
                              ),
                              child: Text(
                                "Open",
                                style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: smallFontSize,
                                    color: Colors.black),
                              ),
                            ),
                          )
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Closes at",
                            style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: smallFontSize,
                                color: Colors.black),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          InkWell(
                            onTap: () {},
                            child: Container(
                              alignment: Alignment.centerLeft,
                              padding: EdgeInsets.only(left: 10),
                              height: MediaQuery.of(context).size.height * 0.06,
                              width: MediaQuery.of(context).size.width * 0.18,
                              decoration: BoxDecoration(
                                color: AppColors.selectgrey,
                                borderRadius: BorderRadius.circular(15),
                                border: Border.all(color: Colors.grey),
                              ),
                              child: Text(
                                "Closes",
                                style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: smallFontSize,
                                    color: Colors.black),
                              ),
                            ),
                          ),
                        ],
                      ),

                      IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.more_vert,
                            color: Colors.black,
                            size: 30,
                          )),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Transform.scale(
                        scale: 1.0,
                        child: Checkbox(
                            checkColor: Colors.white,
                            activeColor: AppColors.textindigo,
                            value: _ischeck,
                            onChanged: (value) {
                              setState(() {
                                _ischeck = value!;
                              });
                            }),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        "Closed",
                        style: TextStyle(
                            fontSize: smallFontSize,
                            fontWeight: FontWeight.w400,
                            color: Colors.black
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 10,),
            Row(
              children: [
                IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.add,
                      size: 30,
                      color: Colors.black,
                    )),
                SizedBox(
                  width: 10,
                ),
                Text(
                  "Add Day",
                  style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: smallFontSize,
                      color: Colors.black),
                ),
              ],
            )
          ],
        ));
  }
}
