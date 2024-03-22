import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:oms/utility/app_const.dart';

import '../../../../utility/appcolor.dart';
import '../../order_details/order_details.dart';

class IncomingOrder extends StatefulWidget {
  const IncomingOrder({super.key});

  @override
  State<IncomingOrder> createState() => _IncomingOrderState();
}

class _IncomingOrderState extends State<IncomingOrder> {
  final _search = TextEditingController();
  bool _ischeck = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
             Container(
                height: MediaQuery.of(context).size.height * 0.07,
                width: MediaQuery.of(context).size.width * 0.45,
                child: TextFormField(
                  controller: _search,
                  decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.search,
                        size: 24,
                        color: Colors.black,
                      ),
                      fillColor: Colors.white,
                      filled: true,
                      hintText: "Search Order number, Customer name, or Items",
                      hintStyle: TextStyle(
                          fontSize:smallFontSize,
                          fontWeight: FontWeight.w400,
                          color: AppColors.grey200
                      ),
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide.none,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide.none,
                      )),
                ),
              ),
             Container(
                padding: EdgeInsets.only(left: 10,),
                alignment: Alignment.centerLeft,
                height: MediaQuery.of(context).size.height * 0.06,
                width: MediaQuery.of(context).size.width * 0.16,
                decoration: BoxDecoration(
                  border: Border.all(color: AppColors.selectgrey),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: DropdownButton<String>(
                  //isExpanded: true,
                  icon: Icon(
                    Icons.keyboard_arrow_down_rounded,
                    size: 25,
                    color: AppColors.textblack,
                  ),
                  elevation: 0,
                  underline: Container(
                    decoration: BoxDecoration(
                      border: Border(bottom: BorderSide.none),
                    ),
                  ),
                  hint: Text(
                    "No Filter Currently Applied",
                    style: TextStyle(
                      fontSize: smallFontSize,
                      fontWeight: FontWeight.w400,
                      color: AppColors.textblack,
                    ),
                  ),
                  items: <String>[
                    'A',
                    'B',
                    'C',
                  ].map((String value) {
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
          Divider(color: AppColors.grey200,),
          Expanded(
            child:ListView(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Not in POS ( 4 )",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: AppColors.textblack),
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 10),
                      alignment: Alignment.centerLeft,
                      height: MediaQuery.of(context).size.height * 0.06,
                      width: MediaQuery.of(context).size.width * 0.05,
                      decoration: BoxDecoration(
                        border: Border.all(color: AppColors.textindigo),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: DropdownButton<String>(
                        //isExpanded: true,
                        icon: Icon(
                          Icons.keyboard_arrow_down_rounded,
                          size: 25,
                          color: AppColors.textindigo,
                        ),
                        elevation: 0,
                        underline: Container(
                          decoration: BoxDecoration(
                            border: Border(bottom: BorderSide.none),
                          ),
                        ),
                        hint: Text(
                          "ETA",
                          style: TextStyle(
                            fontSize: smallFontSize,
                            fontWeight: FontWeight.w400,
                            color: AppColors.textindigo,
                          ),
                        ),
                        items: <String>[
                          'A',
                          'B',
                          'C',
                        ].map((String value) {
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
                Divider(color: AppColors.grey200,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.25,
                      child: ListTile(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>OrderDetail()));
                        },
                        title: Text(
                          "#600175820",
                          style: TextStyle(
                              fontSize: smallFontSize, fontWeight: FontWeight.w400),
                        ),
                        subtitle: Text(
                          "Customer Name Ex.",
                          style: TextStyle(
                              fontSize: normalFontSize, fontWeight: FontWeight.w700),
                        ),
                      ),
                    ),
                    Container(
                      alignment: Alignment.center,
                      height: MediaQuery.of(context).size.height * 0.06,
                      width: MediaQuery.of(context).size.width * 0.04,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        border: Border.all(color: AppColors.grey200),
                      ),
                      child: Text(
                        "3",
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 10,
                            color: AppColors.textblack),
                      ),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.35,
                      child: ListTile(
                        title: Text(
                          "Meat that Skewers&Kebab",
                          style: TextStyle(
                              fontSize: smallFontSize, fontWeight: FontWeight.w400),
                        ),
                        subtitle: Text(
                          "Fresh lamb kebab (10 skewers)- BOG....",
                          style: TextStyle(
                              fontSize: normalFontSize, fontWeight: FontWeight.w700),
                        ),
                      ),
                    ),
                    Container(
                      alignment: Alignment.center,
                      width: MediaQuery.of(context).size.width * 0.30,
                      height: 70,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.access_time_sharp,
                            size: bigFontSize,
                            color: AppColors.textblack,
                          ),
                          RichText(
                              text: TextSpan(
                                  text: "Courier",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: normalFontSize,
                                      color: AppColors.grey100),
                                  children: [
                                    TextSpan(
                                      text: ".22m",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w700,
                                          fontSize: normalFontSize,
                                          color: AppColors.textblack),
                                    )
                                  ])),
                        ],
                      ),
                    ),
                  ],
                ),
                Divider(color: AppColors.grey200,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.25,
                      child: ListTile(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>OrderDetail()));
                        },
                        title: Text(
                          "#600175820",
                          style: TextStyle(
                              fontSize: smallFontSize, fontWeight: FontWeight.w400),
                        ),
                        subtitle: Text(
                          "Customer Name Ex.",
                          style: TextStyle(
                              fontSize: normalFontSize, fontWeight: FontWeight.w700),
                        ),
                      ),
                    ),
                    Container(
                      alignment: Alignment.center,
                      height: MediaQuery.of(context).size.height * 0.06,
                      width: MediaQuery.of(context).size.width * 0.04,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        border: Border.all(color: AppColors.grey200),
                      ),
                      child: Text(
                        "2",
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 10,
                            color: AppColors.textblack,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.35,
                      child: ListTile(
                        title: Text(
                          "Meat that Skewers&Kebab",
                          style: TextStyle(
                              fontSize: smallFontSize, fontWeight: FontWeight.w400),
                        ),
                        subtitle: Text(
                          "Fresh lamb kebab (10 skewers)- BOG....",
                          style: TextStyle(
                              fontSize: normalFontSize, fontWeight: FontWeight.w700),
                        ),
                      ),
                    ),
                    Container(
                      alignment: Alignment.center,
                      width: MediaQuery.of(context).size.width * 0.30,
                      height: 70,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Icon(
                            Icons.access_time_sharp,
                            size: bigFontSize,
                            color: Colors.black,
                          ),
                          RichText(
                              text: TextSpan(
                                  text: "Courier",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: normalFontSize,
                                      color: AppColors.grey100),
                                  children: [
                                    TextSpan(
                                      text: ".22m",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w700,
                                          fontSize: normalFontSize,
                                          color: AppColors.grey200),
                                    )
                                  ])),
                          SizedBox(width: 10,),
                          Icon(Icons.shopping_bag_outlined,color: AppColors.textblack,size: 27,)
                        ],
                      ),
                    ),
                  ],
                ),
                Divider(color: AppColors.grey200,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.25,
                      child: ListTile(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>OrderDetail()));
                        },
                        title: Text(
                          "#600175820",
                          style: TextStyle(
                              fontSize: smallFontSize, fontWeight: FontWeight.w400),
                        ),
                        subtitle: Text(
                          "Customer Name Ex.",
                          style: TextStyle(
                              fontSize: normalFontSize, fontWeight: FontWeight.w700),
                        ),
                      ),
                    ),
                    Container(
                      alignment: Alignment.center,
                      height: MediaQuery.of(context).size.height * 0.06,
                      width: MediaQuery.of(context).size.width * 0.04,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        border: Border.all(color:AppColors.grey200),
                      ),
                      child: Text(
                        "5",
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 10,
                            color: AppColors.textblack),
                      ),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.35,
                      child: ListTile(
                        title: Text(
                          "Meat that Skewers&Kebab",
                          style: TextStyle(
                              fontSize: smallFontSize, fontWeight: FontWeight.w400),
                        ),
                        subtitle: Text(
                          "Fresh lamb kebab (10 skewers)- BOG....",
                          style: TextStyle(
                              fontSize: normalFontSize, fontWeight: FontWeight.w700),
                        ),
                      ),
                    ),
                    Container(
                      alignment: Alignment.center,
                      width: MediaQuery.of(context).size.width * 0.30,
                      height: 70,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Checkbox(
                            shape: CircleBorder(),
                              value: _ischeck,
                              activeColor: AppColors.textindigo,
                              onChanged: (value) {
                                setState(() {
                                  _ischeck = value!;
                                });
                              }),

                          RichText(
                              text: TextSpan(
                                  text: "Courier",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: normalFontSize,
                                      color: AppColors.grey100),
                                  children: [
                                    TextSpan(
                                      text: ". Delivered",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w700,
                                          fontSize: normalFontSize,
                                          color: AppColors.textblack),
                                    )
                                  ]))
                        ],
                      ),
                    ),
                  ],
                ),
                Divider(color: AppColors.grey200,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.25,
                      child: ListTile(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>OrderDetail()));
                        },
                        title: Text(
                          "#600175820",
                          style: TextStyle(
                              fontSize: smallFontSize, fontWeight: FontWeight.w400),
                        ),
                        subtitle: Text(
                          "Customer Name Ex.",
                          style: TextStyle(
                              fontSize: normalFontSize, fontWeight: FontWeight.w700),
                        ),
                      ),
                    ),
                    Container(
                      alignment: Alignment.center,
                      height: MediaQuery.of(context).size.height * 0.06,
                      width: MediaQuery.of(context).size.width * 0.04,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        border: Border.all(color:AppColors.grey200),
                      ),
                      child: Text(
                        "1",
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 10,
                            color: AppColors.textblack),
                      ),
                    ),
                    SizedBox(width: 10),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.35,
                      child: ListTile(
                        title: Text(
                          "Meat that Skewers&Kebab",
                          style: TextStyle(
                              fontSize: smallFontSize, fontWeight: FontWeight.w400),
                        ),
                        subtitle: Text(
                          "Fresh lamb kebab (10 skewers)- BOG....",
                          style: TextStyle(
                              fontSize: normalFontSize, fontWeight: FontWeight.w700),
                        ),
                      ),
                    ),
                    Container(
                      alignment: Alignment.center,
                      width: MediaQuery.of(context).size.width * 0.30,
                      height: 70,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Checkbox(
                              shape: CircleBorder(),
                              value: _ischeck,
                              activeColor: AppColors.textindigo,
                              onChanged: (value) {
                                setState(() {
                                  _ischeck = value!;
                                });
                              }),
                          RichText(
                              text: TextSpan(
                                  text: "Courier",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: normalFontSize,
                                      color: AppColors.grey100),
                                  children: [
                                    TextSpan(
                                      text: ". Out of Delivered",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w700,
                                          fontSize: normalFontSize,
                                          color: AppColors.textblack),
                                    )
                                  ]))
                        ],
                      ),
                    ),
                  ],
                ),
                Divider(color: AppColors.grey200,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.25,
                      child: ListTile(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>OrderDetail()));
                        },
                        title: Text(
                          "#600175820",
                          style: TextStyle(
                              fontSize: smallFontSize, fontWeight: FontWeight.w400),
                        ),
                        subtitle: Text(
                          "Customer Name Ex.",
                          style: TextStyle(
                              fontSize: normalFontSize, fontWeight: FontWeight.w700),
                        ),
                      ),
                    ),
                    Container(
                      alignment: Alignment.center,
                      height: MediaQuery.of(context).size.height * 0.06,
                      width: MediaQuery.of(context).size.width * 0.04,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        border: Border.all(color: AppColors.grey200),
                      ),
                      child: Text(
                        "1",
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 10,
                            color: AppColors.textblack),
                      ),
                    ),
                    SizedBox(width: 10),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.35,
                      child: ListTile(
                        title: Text(
                          "Meat that Skewers&Kebab",
                          style: TextStyle(
                              fontSize: smallFontSize, fontWeight: FontWeight.w400),
                        ),
                        subtitle: Text(
                          "Fresh lamb kebab (10 skewers)- BOG....",
                          style: TextStyle(
                              fontSize: normalFontSize, fontWeight: FontWeight.w700),
                        ),
                      ),
                    ),
                    Container(
                      alignment: Alignment.center,
                      width: MediaQuery.of(context).size.width * 0.30,
                      height: 70,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.access_time_sharp,
                            size: bigFontSize,
                            color: Colors.black,
                          ),
                          Text(".Scheduled Order",
                            style: TextStyle(
                                fontSize: normalFontSize,
                                fontWeight: FontWeight.w700,
                                color: AppColors.textblack,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Divider(color: AppColors.grey200,),

              ],
            ),
          ),
        ],
      ),
    );
  }
}
