import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:oms/utility/app_const.dart';
import 'package:oms/view/history/history_details.dart';
import 'package:oms/widget/app_drawer.dart';

import '../../utility/appcolor.dart';
import '../menus/widgets/widget/radio.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({super.key});

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  final _search = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          drawer: AppDrawer(currentPage: HistoryScreen(),),
          backgroundColor: Colors.white,
          appBar: AppBar(
            elevation: 0.3,
            backgroundColor: Colors.white,
            title: Text(
              "History",
              style: TextStyle(
                  fontWeight: FontWeight.w600, fontSize: 20, color: Colors.black),
            ),
          ),
          body: Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              children: [
                TextFormField(
                  controller: _search,
                  decoration: InputDecoration(
                      hintText: "Search Order number or Customer name",
                      hintStyle: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                          color: Colors.grey),
                      prefixIcon: Icon(
                        Icons.search,
                        size: 30,
                        color: Colors.black,
                      ),
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide.none,
                      ),
                      disabledBorder: OutlineInputBorder(
                        borderSide: BorderSide.none,
                      )),
                ),
                Divider(),
                Expanded(
                    child: ListView(
                  children: [
                    DataTable(
                      columnSpacing: 105,
                      dividerThickness: 1,
                      columns: [
                        DataColumn(
                          label: Expanded(
                            child: Text(
                              "Order",
                              style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: smallFontSize,
                                  color: AppColors.textblack),
                            ),
                          ),
                        ),
                        DataColumn(
                          label: Text(
                            "Restaurant",
                            style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: smallFontSize,
                                color: AppColors.textblack),
                          ),
                        ),
                        DataColumn(
                          label: Text(
                            "Location",
                            style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: smallFontSize,
                                color: AppColors.textblack),
                          ),
                        ),
                        DataColumn(
                          label: Text(
                            "Total",
                            style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: smallFontSize,
                                color: AppColors.textblack),
                          ),
                        ),
                        DataColumn(
                          label: Text(
                            "Placed",
                            style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: smallFontSize,
                                color: AppColors.textblack),
                          ),
                        ),
                      ],
                      rows: [
                        DataRow(cells: [
                          DataCell(InkWell(
                            onTap: () => showDialog(
                                context: (context),
                                builder: (context) => AlertDialog(
                                      backgroundColor: Colors.white,
                                      shape: OutlineInputBorder(
                                        borderRadius: BorderRadius.zero,
                                      ),
                                      alignment: Alignment.centerRight,
                                      title: SingleChildScrollView(
                                        child: Container(
                                          padding: EdgeInsets.all(15),
                                          height:
                                              MediaQuery.of(context).size.height *
                                                  0.80,
                                          width: MediaQuery.of(context).size.width *
                                              0.45,
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.spaceBetween,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  Container(
                                                    alignment: Alignment.center,
                                                    height: MediaQuery.of(context)
                                                            .size
                                                            .height *
                                                        0.07,
                                                    width: MediaQuery.of(context)
                                                            .size
                                                            .width *
                                                        0.20,
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(10),
                                                      color: Colors.white,
                                                      border: Border.all(
                                                          color: Colors.grey),
                                                    ),
                                                    child: DropdownButton<String>(
                                                      icon: Icon(
                                                        Icons
                                                            .keyboard_arrow_down_rounded,
                                                        size: 35,
                                                        color: Colors.black,
                                                      ),
                                                      elevation: 0,
                                                      underline: Container(
                                                        decoration: BoxDecoration(
                                                          border: Border(
                                                              bottom:
                                                                  BorderSide.none),
                                                        ),
                                                      ),
                                                      hint: Row(
                                                        children: [
                                                          Icon(
                                                            Icons.print,
                                                            color: Colors.black,
                                                            size: 35,
                                                          ),
                                                          SizedBox(
                                                            height: 5,
                                                          ),
                                                          Text("Reprint Ticket"),
                                                          SizedBox(
                                                            height: 10,
                                                          ),
                                                        ],
                                                      ),
                                                      items: <String>[
                                                        'A',
                                                        'B',
                                                        'C',
                                                        'D'
                                                      ].map((String value) {
                                                        return DropdownMenuItem<
                                                            String>(
                                                          value: value,
                                                          child: Text(value),
                                                        );
                                                      }).toList(),
                                                      onChanged: (_) {},
                                                    ),
                                                  ),
                                                  IconButton(
                                                      onPressed: () {
                                                        Navigator.pop(context);
                                                      },
                                                      icon: Icon(
                                                        Icons.cancel_outlined,
                                                        color: Colors.black,
                                                        size: 50,
                                                      )),
                                                ],
                                              ),
                                              Divider(),
                                              SizedBox(
                                                height: 30,
                                              ),
                                              Text(
                                                "3 items for Example\n User Name",
                                                style: TextStyle(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.w600,
                                                  color: Colors.black,
                                                ),
                                              ),
                                              Text(
                                                "Restaurant Name. Location Name .#12ordernumber64",
                                                style: TextStyle(
                                                    fontSize: 16,
                                                    color: Colors.black,
                                                    fontWeight: FontWeight.w500),
                                              ),
                                              ListTile(
                                                leading: Text(
                                                  "Order Placed",
                                                  style: TextStyle(
                                                      fontWeight: FontWeight.w600,
                                                      fontSize: 16,
                                                      color: Colors.black),
                                                ),
                                                title: Divider(),
                                                trailing: Text(
                                                  "24 Feb 12:54AM",
                                                  style: TextStyle(
                                                      fontSize: 16,
                                                      fontWeight: FontWeight.w500,
                                                      color: Colors.black),
                                                ),
                                              ),
                                              SizedBox(
                                                height: 10,
                                              ),
                                              ListTile(
                                                leading: Container(
                                                  alignment: Alignment.center,
                                                  height: MediaQuery.of(context)
                                                          .size
                                                          .height *
                                                      0.06,
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      0.04,
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(100),
                                                    color: AppColors.textindigo,
                                                  ),
                                                  child: Text(
                                                    "2",
                                                    style: TextStyle(
                                                        fontWeight: FontWeight.w500,
                                                        color: Colors.white,
                                                        fontSize: 16),
                                                  ),
                                                ),
                                                title: Text(
                                                  "Fresh lamb kebab (10\nskewers)- BOGO item ",
                                                  style: TextStyle(
                                                      fontSize: 18,
                                                      fontWeight: FontWeight.w600,
                                                      color: Colors.black),
                                                ),
                                                trailing: Text(
                                                  "CA\$13.99",
                                                  style: TextStyle(
                                                      fontSize: 14,
                                                      fontWeight: FontWeight.w500,
                                                      color: Colors.black),
                                                ),
                                              ),
                                              ListTile(
                                                leading: Container(
                                                  alignment: Alignment.center,
                                                  height: MediaQuery.of(context)
                                                          .size
                                                          .height *
                                                      0.06,
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      0.04,
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(100),
                                                    color: AppColors.textindigo,
                                                  ),
                                                  child: Text(
                                                    "1",
                                                    style: TextStyle(
                                                        fontWeight: FontWeight.w500,
                                                        color: Colors.white,
                                                        fontSize: 16),
                                                  ),
                                                ),
                                                title: Text(
                                                  "Lamb Fried Rice",
                                                  style: TextStyle(
                                                      fontSize: 18,
                                                      fontWeight: FontWeight.w600,
                                                      color: Colors.black),
                                                ),
                                                trailing: Text(
                                                  "CA\$21.23",
                                                  style: TextStyle(
                                                      fontSize: 14,
                                                      fontWeight: FontWeight.w500,
                                                      color: Colors.black),
                                                ),
                                              ),
                                              SizedBox(
                                                height: 10,
                                              ),
                                              ListTile(
                                                leading: Text(
                                                  "Item Subtotal",
                                                  style: TextStyle(
                                                      fontWeight: FontWeight.w600,
                                                      fontSize: 16,
                                                      color: Colors.black),
                                                ),
                                                title: Divider(),
                                                trailing: Text(
                                                  "CA\$35.22",
                                                  style: TextStyle(
                                                      fontSize: 16,
                                                      fontWeight: FontWeight.w500,
                                                      color: Colors.black),
                                                ),
                                              ),
                                              ListTile(
                                                leading: Text(
                                                  "Tax",
                                                  style: TextStyle(
                                                      fontWeight: FontWeight.w600,
                                                      fontSize: 16,
                                                      color: Colors.black),
                                                ),
                                                title: Divider(),
                                                trailing: Text(
                                                  "CA\$1.76",
                                                  style: TextStyle(
                                                      fontSize: 16,
                                                      fontWeight: FontWeight.w500,
                                                      color: Colors.black),
                                                ),
                                              ),
                                              Divider(
                                                thickness: 5,
                                                color: Colors.black,
                                              ),
                                              ListTile(
                                                leading: Text(
                                                  "Total",
                                                  style: TextStyle(
                                                      fontWeight: FontWeight.w600,
                                                      fontSize: 16,
                                                      color: Colors.black),
                                                ),
                                                title: Divider(),
                                                trailing: Text(
                                                  "CA\$36.98",
                                                  style: TextStyle(
                                                      fontSize: 16,
                                                      fontWeight: FontWeight.w500,
                                                      color: Colors.black),
                                                ),
                                              ),
                                              ListTile(
                                                leading: Text(
                                                  "Order Completed",
                                                  style: TextStyle(
                                                      fontWeight: FontWeight.w600,
                                                      fontSize: 16,
                                                      color: Colors.black),
                                                ),
                                                title: Divider(),
                                                trailing: Text(
                                                  "24 Feb 12:54AM",
                                                  style: TextStyle(
                                                      fontSize: 16,
                                                      fontWeight: FontWeight.w500,
                                                      color: Colors.black),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    )),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("#600175820",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        color: AppColors.textblack,
                                        fontSize: smallFontSize)),
                                Text(
                                  "Customer Name Ex.",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      color: AppColors.textblack,
                                      fontSize: 16),
                                ),
                              ],
                            ),
                          )),
                          DataCell(Text(
                            "Example Restaurant Name",
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                color: AppColors.textblack,
                                fontSize: smallFontSize),
                          )),
                          DataCell(Text("Example Location Name",
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.textblack,
                                  fontSize: smallFontSize))),
                          DataCell(Text("CA\$10.23",
                              style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  color: AppColors.textblack,
                                  fontSize: smallFontSize))),
                          DataCell(Text("2/15.02:34AM",
                              style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  color: AppColors.textblack,
                                  fontSize: smallFontSize))),
                        ]),
                        DataRow(cells: [
                          DataCell(InkWell(
                            onTap: () => showDialog(
                                context: (context),
                                builder: (context) => AlertDialog(
                                  backgroundColor: Colors.white,
                                  shape: OutlineInputBorder(
                                    borderRadius: BorderRadius.zero,
                                  ),
                                  alignment: Alignment.centerRight,
                                  title: SingleChildScrollView(
                                    child: Container(
                                      padding: EdgeInsets.all(15),
                                      height:
                                      MediaQuery.of(context).size.height *
                                          0.80,
                                      width: MediaQuery.of(context).size.width *
                                          0.45,
                                      child: Column(
                                        mainAxisAlignment:
                                        MainAxisAlignment.center,
                                        crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                            crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                            children: [
                                              Container(
                                                alignment: Alignment.center,
                                                height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                    0.07,
                                                width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                    0.20,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                  BorderRadius.circular(10),
                                                  color: Colors.white,
                                                  border: Border.all(
                                                      color: Colors.grey),
                                                ),
                                                child: DropdownButton<String>(
                                                  icon: Icon(
                                                    Icons
                                                        .keyboard_arrow_down_rounded,
                                                    size: 35,
                                                    color: Colors.black,
                                                  ),
                                                  elevation: 0,
                                                  underline: Container(
                                                    decoration: BoxDecoration(
                                                      border: Border(
                                                          bottom:
                                                          BorderSide.none),
                                                    ),
                                                  ),
                                                  hint: Row(
                                                    children: [
                                                      Icon(
                                                        Icons.print,
                                                        color: Colors.black,
                                                        size: 35,
                                                      ),
                                                      SizedBox(
                                                        height: 5,
                                                      ),
                                                      Text("Reprint Ticket"),
                                                      SizedBox(
                                                        height: 10,
                                                      ),
                                                    ],
                                                  ),
                                                  items: <String>[
                                                    'A',
                                                    'B',
                                                    'C',
                                                    'D'
                                                  ].map((String value) {
                                                    return DropdownMenuItem<
                                                        String>(
                                                      value: value,
                                                      child: Text(value),
                                                    );
                                                  }).toList(),
                                                  onChanged: (_) {},
                                                ),
                                              ),
                                              IconButton(
                                                  onPressed: () {
                                                    Navigator.pop(context);
                                                  },
                                                  icon: Icon(
                                                    Icons.cancel_outlined,
                                                    color: Colors.black,
                                                    size: 50,
                                                  )),
                                            ],
                                          ),
                                          Divider(),
                                          SizedBox(
                                            height: 30,
                                          ),
                                          Text(
                                            "3 items for Example\n User Name",
                                            style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.w600,
                                              color: Colors.black,
                                            ),
                                          ),
                                          Text(
                                            "Restaurant Name. Location Name .#12ordernumber64",
                                            style: TextStyle(
                                                fontSize: 16,
                                                color: Colors.black,
                                                fontWeight: FontWeight.w500),
                                          ),
                                          ListTile(
                                            leading: Text(
                                              "Order Placed",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 16,
                                                  color: Colors.black),
                                            ),
                                            title: Divider(),
                                            trailing: Text(
                                              "24 Feb 12:54AM",
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w500,
                                                  color: Colors.black),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          ListTile(
                                            leading: Container(
                                              alignment: Alignment.center,
                                              height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                                  0.06,
                                              width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                                  0.04,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                BorderRadius.circular(100),
                                                color: AppColors.textindigo,
                                              ),
                                              child: Text(
                                                "2",
                                                style: TextStyle(
                                                    fontWeight: FontWeight.w500,
                                                    color: Colors.white,
                                                    fontSize: 16),
                                              ),
                                            ),
                                            title: Text(
                                              "Fresh lamb kebab (10\nskewers)- BOGO item ",
                                              style: TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w600,
                                                  color: Colors.black),
                                            ),
                                            trailing: Text(
                                              "CA\$13.99",
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w500,
                                                  color: Colors.black),
                                            ),
                                          ),
                                          ListTile(
                                            leading: Container(
                                              alignment: Alignment.center,
                                              height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                                  0.06,
                                              width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                                  0.04,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                BorderRadius.circular(100),
                                                color: AppColors.textindigo,
                                              ),
                                              child: Text(
                                                "1",
                                                style: TextStyle(
                                                    fontWeight: FontWeight.w500,
                                                    color: Colors.white,
                                                    fontSize: 16),
                                              ),
                                            ),
                                            title: Text(
                                              "Lamb Fried Rice",
                                              style: TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w600,
                                                  color: Colors.black),
                                            ),
                                            trailing: Text(
                                              "CA\$21.23",
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w500,
                                                  color: Colors.black),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          ListTile(
                                            leading: Text(
                                              "Item Subtotal",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 16,
                                                  color: Colors.black),
                                            ),
                                            title: Divider(),
                                            trailing: Text(
                                              "CA\$35.22",
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w500,
                                                  color: Colors.black),
                                            ),
                                          ),
                                          ListTile(
                                            leading: Text(
                                              "Tax",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 16,
                                                  color: Colors.black),
                                            ),
                                            title: Divider(),
                                            trailing: Text(
                                              "CA\$1.76",
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w500,
                                                  color: Colors.black),
                                            ),
                                          ),
                                          Divider(
                                            thickness: 5,
                                            color: Colors.black,
                                          ),
                                          ListTile(
                                            leading: Text(
                                              "Total",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 16,
                                                  color: Colors.black),
                                            ),
                                            title: Divider(),
                                            trailing: Text(
                                              "CA\$36.98",
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w500,
                                                  color: Colors.black),
                                            ),
                                          ),
                                          ListTile(
                                            leading: Text(
                                              "Order Completed",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 16,
                                                  color: Colors.black),
                                            ),
                                            title: Divider(),
                                            trailing: Text(
                                              "24 Feb 12:54AM",
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w500,
                                                  color: Colors.black),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                )),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("#600175820",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        color: AppColors.textblack,
                                        fontSize: smallFontSize)),
                                Text(
                                  "Customer Name Ex.",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      color: AppColors.textblack,
                                      fontSize: 16),
                                ),
                              ],
                            ),
                          )),
                          DataCell(Text(
                            "Example Restaurant Name",
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                color: AppColors.textblack,
                                fontSize: smallFontSize),
                          )),
                          DataCell(Text("Example Location Name",
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.textblack,
                                  fontSize: smallFontSize))),
                          DataCell(Text("CA\$10.23",
                              style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  color: AppColors.textblack,
                                  fontSize: smallFontSize))),
                          DataCell(Text("2/15.02:34AM",
                              style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  color: AppColors.textblack,
                                  fontSize: smallFontSize))),
                        ]),
                        DataRow(cells: [
                          DataCell(InkWell(
                            onTap: () => showDialog(
                                context: (context),
                                builder: (context) => AlertDialog(
                                  backgroundColor: Colors.white,
                                  shape: OutlineInputBorder(
                                    borderRadius: BorderRadius.zero,
                                  ),
                                  alignment: Alignment.centerRight,
                                  title: SingleChildScrollView(
                                    child: Container(
                                      padding: EdgeInsets.all(15),
                                      height:
                                      MediaQuery.of(context).size.height *
                                          0.80,
                                      width: MediaQuery.of(context).size.width *
                                          0.45,
                                      child: Column(
                                        mainAxisAlignment:
                                        MainAxisAlignment.center,
                                        crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                            crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                            children: [
                                              Container(
                                                alignment: Alignment.center,
                                                height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                    0.07,
                                                width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                    0.20,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                  BorderRadius.circular(10),
                                                  color: Colors.white,
                                                  border: Border.all(
                                                      color: Colors.grey),
                                                ),
                                                child: DropdownButton<String>(
                                                  icon: Icon(
                                                    Icons
                                                        .keyboard_arrow_down_rounded,
                                                    size: 35,
                                                    color: Colors.black,
                                                  ),
                                                  elevation: 0,
                                                  underline: Container(
                                                    decoration: BoxDecoration(
                                                      border: Border(
                                                          bottom:
                                                          BorderSide.none),
                                                    ),
                                                  ),
                                                  hint: Row(
                                                    children: [
                                                      Icon(
                                                        Icons.print,
                                                        color: Colors.black,
                                                        size: 35,
                                                      ),
                                                      SizedBox(
                                                        height: 5,
                                                      ),
                                                      Text("Reprint Ticket"),
                                                      SizedBox(
                                                        height: 10,
                                                      ),
                                                    ],
                                                  ),
                                                  items: <String>[
                                                    'A',
                                                    'B',
                                                    'C',
                                                    'D'
                                                  ].map((String value) {
                                                    return DropdownMenuItem<
                                                        String>(
                                                      value: value,
                                                      child: Text(value),
                                                    );
                                                  }).toList(),
                                                  onChanged: (_) {},
                                                ),
                                              ),
                                              IconButton(
                                                  onPressed: () {
                                                    Navigator.pop(context);
                                                  },
                                                  icon: Icon(
                                                    Icons.cancel_outlined,
                                                    color: Colors.black,
                                                    size: 50,
                                                  )),
                                            ],
                                          ),
                                          Divider(),
                                          SizedBox(
                                            height: 30,
                                          ),
                                          Text(
                                            "3 items for Example\n User Name",
                                            style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.w600,
                                              color: Colors.black,
                                            ),
                                          ),
                                          Text(
                                            "Restaurant Name. Location Name .#12ordernumber64",
                                            style: TextStyle(
                                                fontSize: 16,
                                                color: Colors.black,
                                                fontWeight: FontWeight.w500),
                                          ),
                                          ListTile(
                                            leading: Text(
                                              "Order Placed",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 16,
                                                  color: Colors.black),
                                            ),
                                            title: Divider(),
                                            trailing: Text(
                                              "24 Feb 12:54AM",
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w500,
                                                  color: Colors.black),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          ListTile(
                                            leading: Container(
                                              alignment: Alignment.center,
                                              height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                                  0.06,
                                              width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                                  0.04,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                BorderRadius.circular(100),
                                                color: AppColors.textindigo,
                                              ),
                                              child: Text(
                                                "2",
                                                style: TextStyle(
                                                    fontWeight: FontWeight.w500,
                                                    color: Colors.white,
                                                    fontSize: 16),
                                              ),
                                            ),
                                            title: Text(
                                              "Fresh lamb kebab (10\nskewers)- BOGO item ",
                                              style: TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w600,
                                                  color: Colors.black),
                                            ),
                                            trailing: Text(
                                              "CA\$13.99",
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w500,
                                                  color: Colors.black),
                                            ),
                                          ),
                                          ListTile(
                                            leading: Container(
                                              alignment: Alignment.center,
                                              height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                                  0.06,
                                              width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                                  0.04,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                BorderRadius.circular(100),
                                                color: AppColors.textindigo,
                                              ),
                                              child: Text(
                                                "1",
                                                style: TextStyle(
                                                    fontWeight: FontWeight.w500,
                                                    color: Colors.white,
                                                    fontSize: 16),
                                              ),
                                            ),
                                            title: Text(
                                              "Lamb Fried Rice",
                                              style: TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w600,
                                                  color: Colors.black),
                                            ),
                                            trailing: Text(
                                              "CA\$21.23",
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w500,
                                                  color: Colors.black),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          ListTile(
                                            leading: Text(
                                              "Item Subtotal",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 16,
                                                  color: Colors.black),
                                            ),
                                            title: Divider(),
                                            trailing: Text(
                                              "CA\$35.22",
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w500,
                                                  color: Colors.black),
                                            ),
                                          ),
                                          ListTile(
                                            leading: Text(
                                              "Tax",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 16,
                                                  color: Colors.black),
                                            ),
                                            title: Divider(),
                                            trailing: Text(
                                              "CA\$1.76",
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w500,
                                                  color: Colors.black),
                                            ),
                                          ),
                                          Divider(
                                            thickness: 5,
                                            color: Colors.black,
                                          ),
                                          ListTile(
                                            leading: Text(
                                              "Total",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 16,
                                                  color: Colors.black),
                                            ),
                                            title: Divider(),
                                            trailing: Text(
                                              "CA\$36.98",
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w500,
                                                  color: Colors.black),
                                            ),
                                          ),
                                          ListTile(
                                            leading: Text(
                                              "Order Completed",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 16,
                                                  color: Colors.black),
                                            ),
                                            title: Divider(),
                                            trailing: Text(
                                              "24 Feb 12:54AM",
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w500,
                                                  color: Colors.black),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                )),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("#600175820",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        color: AppColors.textblack,
                                        fontSize: smallFontSize)),
                                Text(
                                  "Customer Name Ex.",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      color: AppColors.textblack,
                                      fontSize: 16),
                                ),
                              ],
                            ),
                          )),
                          DataCell(Text(
                            "Example Restaurant Name",
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                color: AppColors.textblack,
                                fontSize: smallFontSize),
                          )),
                          DataCell(Text("Example Location Name",
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.textblack,
                                  fontSize: smallFontSize))),
                          DataCell(Text("CA\$10.23",
                              style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  color: AppColors.textblack,
                                  fontSize: smallFontSize))),
                          DataCell(Text("2/15.02:34AM",
                              style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  color: AppColors.textblack,
                                  fontSize: smallFontSize))),
                        ]),
                        DataRow(cells: [
                          DataCell(InkWell(
                            onTap: () => showDialog(
                                context: (context),
                                builder: (context) => AlertDialog(
                                  backgroundColor: Colors.white,
                                  shape: OutlineInputBorder(
                                    borderRadius: BorderRadius.zero,
                                  ),
                                  alignment: Alignment.centerRight,
                                  title: SingleChildScrollView(
                                    child: Container(
                                      padding: EdgeInsets.all(15),
                                      height:
                                      MediaQuery.of(context).size.height *
                                          0.80,
                                      width: MediaQuery.of(context).size.width *
                                          0.45,
                                      child: Column(
                                        mainAxisAlignment:
                                        MainAxisAlignment.center,
                                        crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                            crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                            children: [
                                              Container(
                                                alignment: Alignment.center,
                                                height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                    0.07,
                                                width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                    0.20,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                  BorderRadius.circular(10),
                                                  color: Colors.white,
                                                  border: Border.all(
                                                      color: Colors.grey),
                                                ),
                                                child: DropdownButton<String>(
                                                  icon: Icon(
                                                    Icons
                                                        .keyboard_arrow_down_rounded,
                                                    size: 35,
                                                    color: Colors.black,
                                                  ),
                                                  elevation: 0,
                                                  underline: Container(
                                                    decoration: BoxDecoration(
                                                      border: Border(
                                                          bottom:
                                                          BorderSide.none),
                                                    ),
                                                  ),
                                                  hint: Row(
                                                    children: [
                                                      Icon(
                                                        Icons.print,
                                                        color: Colors.black,
                                                        size: 35,
                                                      ),
                                                      SizedBox(
                                                        height: 5,
                                                      ),
                                                      Text("Reprint Ticket"),
                                                      SizedBox(
                                                        height: 10,
                                                      ),
                                                    ],
                                                  ),
                                                  items: <String>[
                                                    'A',
                                                    'B',
                                                    'C',
                                                    'D'
                                                  ].map((String value) {
                                                    return DropdownMenuItem<
                                                        String>(
                                                      value: value,
                                                      child: Text(value),
                                                    );
                                                  }).toList(),
                                                  onChanged: (_) {},
                                                ),
                                              ),
                                              IconButton(
                                                  onPressed: () {
                                                    Navigator.pop(context);
                                                  },
                                                  icon: Icon(
                                                    Icons.cancel_outlined,
                                                    color: Colors.black,
                                                    size: 50,
                                                  )),
                                            ],
                                          ),
                                          Divider(),
                                          SizedBox(
                                            height: 30,
                                          ),
                                          Text(
                                            "3 items for Example\n User Name",
                                            style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.w600,
                                              color: Colors.black,
                                            ),
                                          ),
                                          Text(
                                            "Restaurant Name. Location Name .#12ordernumber64",
                                            style: TextStyle(
                                                fontSize: 16,
                                                color: Colors.black,
                                                fontWeight: FontWeight.w500),
                                          ),
                                          ListTile(
                                            leading: Text(
                                              "Order Placed",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 16,
                                                  color: Colors.black),
                                            ),
                                            title: Divider(),
                                            trailing: Text(
                                              "24 Feb 12:54AM",
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w500,
                                                  color: Colors.black),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          ListTile(
                                            leading: Container(
                                              alignment: Alignment.center,
                                              height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                                  0.06,
                                              width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                                  0.04,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                BorderRadius.circular(100),
                                                color: AppColors.textindigo,
                                              ),
                                              child: Text(
                                                "2",
                                                style: TextStyle(
                                                    fontWeight: FontWeight.w500,
                                                    color: Colors.white,
                                                    fontSize: 16),
                                              ),
                                            ),
                                            title: Text(
                                              "Fresh lamb kebab (10\nskewers)- BOGO item ",
                                              style: TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w600,
                                                  color: Colors.black),
                                            ),
                                            trailing: Text(
                                              "CA\$13.99",
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w500,
                                                  color: Colors.black),
                                            ),
                                          ),
                                          ListTile(
                                            leading: Container(
                                              alignment: Alignment.center,
                                              height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                                  0.06,
                                              width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                                  0.04,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                BorderRadius.circular(100),
                                                color: AppColors.textindigo,
                                              ),
                                              child: Text(
                                                "1",
                                                style: TextStyle(
                                                    fontWeight: FontWeight.w500,
                                                    color: Colors.white,
                                                    fontSize: 16),
                                              ),
                                            ),
                                            title: Text(
                                              "Lamb Fried Rice",
                                              style: TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w600,
                                                  color: Colors.black),
                                            ),
                                            trailing: Text(
                                              "CA\$21.23",
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w500,
                                                  color: Colors.black),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          ListTile(
                                            leading: Text(
                                              "Item Subtotal",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 16,
                                                  color: Colors.black),
                                            ),
                                            title: Divider(),
                                            trailing: Text(
                                              "CA\$35.22",
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w500,
                                                  color: Colors.black),
                                            ),
                                          ),
                                          ListTile(
                                            leading: Text(
                                              "Tax",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 16,
                                                  color: Colors.black),
                                            ),
                                            title: Divider(),
                                            trailing: Text(
                                              "CA\$1.76",
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w500,
                                                  color: Colors.black),
                                            ),
                                          ),
                                          Divider(
                                            thickness: 5,
                                            color: Colors.black,
                                          ),
                                          ListTile(
                                            leading: Text(
                                              "Total",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 16,
                                                  color: Colors.black),
                                            ),
                                            title: Divider(),
                                            trailing: Text(
                                              "CA\$36.98",
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w500,
                                                  color: Colors.black),
                                            ),
                                          ),
                                          ListTile(
                                            leading: Text(
                                              "Order Completed",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 16,
                                                  color: Colors.black),
                                            ),
                                            title: Divider(),
                                            trailing: Text(
                                              "24 Feb 12:54AM",
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w500,
                                                  color: Colors.black),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                )),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("#600175820",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        color: AppColors.textblack,
                                        fontSize: smallFontSize)),
                                Text(
                                  "Customer Name Ex.",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      color: AppColors.textblack,
                                      fontSize: 16),
                                ),
                              ],
                            ),
                          )),
                          DataCell(Text(
                            "Example Restaurant Name",
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                color: AppColors.textblack,
                                fontSize: smallFontSize),
                          )),
                          DataCell(Text("Example Location Name",
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.textblack,
                                  fontSize: smallFontSize))),
                          DataCell(Text("CA\$10.23",
                              style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  color: AppColors.textblack,
                                  fontSize: smallFontSize))),
                          DataCell(Text("2/15.02:34AM",
                              style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  color: AppColors.textblack,
                                  fontSize: smallFontSize))),
                        ]),
                        DataRow(cells: [
                          DataCell(InkWell(
                            onTap: () => showDialog(
                                context: (context),
                                builder: (context) => AlertDialog(
                                  backgroundColor: Colors.white,
                                  shape: OutlineInputBorder(
                                    borderRadius: BorderRadius.zero,
                                  ),
                                  alignment: Alignment.centerRight,
                                  title: SingleChildScrollView(
                                    child: Container(
                                      padding: EdgeInsets.all(15),
                                      height:
                                      MediaQuery.of(context).size.height *
                                          0.80,
                                      width: MediaQuery.of(context).size.width *
                                          0.45,
                                      child: Column(
                                        mainAxisAlignment:
                                        MainAxisAlignment.center,
                                        crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                            crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                            children: [
                                              Container(
                                                alignment: Alignment.center,
                                                height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                    0.07,
                                                width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                    0.20,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                  BorderRadius.circular(10),
                                                  color: Colors.white,
                                                  border: Border.all(
                                                      color: Colors.grey),
                                                ),
                                                child: DropdownButton<String>(
                                                  icon: Icon(
                                                    Icons
                                                        .keyboard_arrow_down_rounded,
                                                    size: 35,
                                                    color: Colors.black,
                                                  ),
                                                  elevation: 0,
                                                  underline: Container(
                                                    decoration: BoxDecoration(
                                                      border: Border(
                                                          bottom:
                                                          BorderSide.none),
                                                    ),
                                                  ),
                                                  hint: Row(
                                                    children: [
                                                      Icon(
                                                        Icons.print,
                                                        color: Colors.black,
                                                        size: 35,
                                                      ),
                                                      SizedBox(
                                                        height: 5,
                                                      ),
                                                      Text("Reprint Ticket"),
                                                      SizedBox(
                                                        height: 10,
                                                      ),
                                                    ],
                                                  ),
                                                  items: <String>[
                                                    'A',
                                                    'B',
                                                    'C',
                                                    'D'
                                                  ].map((String value) {
                                                    return DropdownMenuItem<
                                                        String>(
                                                      value: value,
                                                      child: Text(value),
                                                    );
                                                  }).toList(),
                                                  onChanged: (_) {},
                                                ),
                                              ),
                                              IconButton(
                                                  onPressed: () {
                                                    Navigator.pop(context);
                                                  },
                                                  icon: Icon(
                                                    Icons.cancel_outlined,
                                                    color: Colors.black,
                                                    size: 50,
                                                  )),
                                            ],
                                          ),
                                          Divider(),
                                          SizedBox(
                                            height: 30,
                                          ),
                                          Text(
                                            "3 items for Example\n User Name",
                                            style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.w600,
                                              color: Colors.black,
                                            ),
                                          ),
                                          Text(
                                            "Restaurant Name. Location Name .#12ordernumber64",
                                            style: TextStyle(
                                                fontSize: 16,
                                                color: Colors.black,
                                                fontWeight: FontWeight.w500),
                                          ),
                                          ListTile(
                                            leading: Text(
                                              "Order Placed",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 16,
                                                  color: Colors.black),
                                            ),
                                            title: Divider(),
                                            trailing: Text(
                                              "24 Feb 12:54AM",
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w500,
                                                  color: Colors.black),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          ListTile(
                                            leading: Container(
                                              alignment: Alignment.center,
                                              height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                                  0.06,
                                              width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                                  0.04,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                BorderRadius.circular(100),
                                                color: AppColors.textindigo,
                                              ),
                                              child: Text(
                                                "2",
                                                style: TextStyle(
                                                    fontWeight: FontWeight.w500,
                                                    color: Colors.white,
                                                    fontSize: 16),
                                              ),
                                            ),
                                            title: Text(
                                              "Fresh lamb kebab (10\nskewers)- BOGO item ",
                                              style: TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w600,
                                                  color: Colors.black),
                                            ),
                                            trailing: Text(
                                              "CA\$13.99",
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w500,
                                                  color: Colors.black),
                                            ),
                                          ),
                                          ListTile(
                                            leading: Container(
                                              alignment: Alignment.center,
                                              height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                                  0.06,
                                              width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                                  0.04,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                BorderRadius.circular(100),
                                                color: AppColors.textindigo,
                                              ),
                                              child: Text(
                                                "1",
                                                style: TextStyle(
                                                    fontWeight: FontWeight.w500,
                                                    color: Colors.white,
                                                    fontSize: 16),
                                              ),
                                            ),
                                            title: Text(
                                              "Lamb Fried Rice",
                                              style: TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w600,
                                                  color: Colors.black),
                                            ),
                                            trailing: Text(
                                              "CA\$21.23",
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w500,
                                                  color: Colors.black),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          ListTile(
                                            leading: Text(
                                              "Item Subtotal",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 16,
                                                  color: Colors.black),
                                            ),
                                            title: Divider(),
                                            trailing: Text(
                                              "CA\$35.22",
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w500,
                                                  color: Colors.black),
                                            ),
                                          ),
                                          ListTile(
                                            leading: Text(
                                              "Tax",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 16,
                                                  color: Colors.black),
                                            ),
                                            title: Divider(),
                                            trailing: Text(
                                              "CA\$1.76",
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w500,
                                                  color: Colors.black),
                                            ),
                                          ),
                                          Divider(
                                            thickness: 5,
                                            color: Colors.black,
                                          ),
                                          ListTile(
                                            leading: Text(
                                              "Total",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 16,
                                                  color: Colors.black),
                                            ),
                                            title: Divider(),
                                            trailing: Text(
                                              "CA\$36.98",
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w500,
                                                  color: Colors.black),
                                            ),
                                          ),
                                          ListTile(
                                            leading: Text(
                                              "Order Completed",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 16,
                                                  color: Colors.black),
                                            ),
                                            title: Divider(),
                                            trailing: Text(
                                              "24 Feb 12:54AM",
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w500,
                                                  color: Colors.black),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                )),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("#600175820",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        color: AppColors.textblack,
                                        fontSize: smallFontSize)),
                                Text(
                                  "Customer Name Ex.",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      color: AppColors.textblack,
                                      fontSize: 16),
                                ),
                              ],
                            ),
                          )),
                          DataCell(Text(
                            "Example Restaurant Name",
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                color: AppColors.textblack,
                                fontSize: smallFontSize),
                          )),
                          DataCell(Text("Example Location Name",
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.textblack,
                                  fontSize: smallFontSize))),
                          DataCell(Text("CA\$10.23",
                              style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  color: AppColors.textblack,
                                  fontSize: smallFontSize))),
                          DataCell(Text("2/15.02:34AM",
                              style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  color: AppColors.textblack,
                                  fontSize: smallFontSize))),
                        ]),


                      ],
                    ),
                  ],
                )),
              ],
            ),
          ),
    ));
  }
}
