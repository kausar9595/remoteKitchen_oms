import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:oms/model/order_model/order_list_model.dart';
import 'package:oms/utility/app_const.dart';
import 'package:oms/view/order/screen/widget/order_list_view.dart';
import 'package:oms/widget/app_shemmer.dart';
import 'package:oms/widget/empty_data.dart';

import '../../../../utility/appcolor.dart';
import '../../order_details/order_details.dart';

class CompetedToday extends StatefulWidget {
  final List<OrderResult> orders;
  final VoidCallback onClick;
  final bool isLoading;

  const CompetedToday({super.key, required this.orders, required this.onClick, required this.isLoading});

  @override
  State<CompetedToday> createState() => _CompetedTodayState();
}

class _CompetedTodayState extends State<CompetedToday> {
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

          widget.isLoading ? Expanded(
              child: ListView.builder(
                itemCount: 10,
                itemBuilder: (_, index){
                  return Container(
                    margin: EdgeInsets.only(bottom: 10),
                    child: AppShimmer(
                      width: MediaQuery.of(context).size.width,
                      height: 50,
                    ),
                  );
                },
              )

          ) :  widget.orders!.isNotEmpty ? Expanded(
              child: ListView.builder(
                itemCount: widget.orders!.length,
                itemBuilder: (_, index){
                  var data = widget.orders[index];
                  List<String> comboItems = data.orderitemSet![0].itemName!.split('\n')
                      .map((item) => item.trim())
                      .toList();
                  return OrderListView(
                      orderId: data.id!.toString(),
                      customerName: data.customer!,
                      qty: data.quantity.toString(),
                      itemName: comboItems.join(', '),
                      dropOfAddress: data.orderitemSet![0].modifiers!.isNotEmpty ? data.orderitemSet![0].modifiers![0].toString() : "",
                      status: data.status.toString(),
                      orderInfo: data,
                  );
                },
              )
          ) : EmptyData(
            onClick: widget.onClick,
            mes: "No orders found in Incoming Orders. Try again with reload.",
          )
        ],
      ),
    );
  }
}
