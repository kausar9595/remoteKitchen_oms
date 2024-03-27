import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:oms/model/order_model/order_list_model.dart';
import 'package:oms/utility/app_const.dart';
import 'package:oms/utility/order_status.dart';
import 'package:oms/view/order/screen/widget/order_list_view.dart';
import 'package:oms/widget/app_shemmer.dart';
import 'package:oms/widget/empty_data.dart';

import '../../../../utility/appcolor.dart';
import '../../order_details/order_details.dart';

class OrderList extends StatefulWidget {
  final List<OrderResult> orders;
  final VoidCallback onClick;
  final bool isLoading;
  final bool isCompleteToday;
  final  Future<void> Function() onRefresh;

  const OrderList({super.key, required this.orders, required this.onClick, required this.isLoading, this.isCompleteToday = false, required this.onRefresh});

  @override
  State<OrderList> createState() => _OrderListState();
}

class _OrderListState extends State<OrderList> {
  List<String> items = [
    'Accepted Orders',
    'Ready for pickup orders',
    'Complete Orders',
  ];

  String _selectedFilter  = "";

  final _search = TextEditingController();
  bool _ischeck = false;

  List<OrderResult> _searchResult = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if(widget.isCompleteToday){
      _selectedFilter = items[0];
    }
  }


  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: widget.onRefresh,
      child: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
               Expanded(
                 child: Container(
                    height:45,
                    //width: MediaQuery.of(context).size.width-100,
                    child: TextFormField(
                      controller: _search,
                      onChanged: (v){
                        _searchOrder(v);
                      },
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
               ),
               widget.isCompleteToday ? Container(
                  padding: EdgeInsets.only(left: 10,),
                  alignment: Alignment.centerLeft,
                  height: MediaQuery.of(context).size.height * 0.06,
                  width: MediaQuery.of(context).size.width * 0.19,
                  decoration: BoxDecoration(
                    border: Border.all(color: AppColors.selectgrey),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton2<String>(
                      isExpanded: true,
                      hint: Text(
                        'Location Select',
                        style: TextStyle(
                          fontSize: 14,
                          color: AppColors.textindigo,
                        ),
                      ),
                      items: items.map((value) {
                        return DropdownMenuItem<String>(
                          value: value.toString(),
                          child: Text(value.toString(),
                            style: TextStyle(
                                fontSize: 13
                            ),
                          ),
                        );
                      }).toList(),
                      value: _selectedFilter.isNotEmpty ? _selectedFilter : null, // Ensure value is null or non-empty
                      onChanged: (v) {
                        setState(() {
                          _selectedFilter = v!;
                        });
                      },
                    ),
                  ),
                ) : Center(),
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

           ) :  _searchResult.isEmpty ? widget.orders!.isNotEmpty ? Expanded(
               child: ListView.builder(
                 itemCount: widget.orders!.length,
                 itemBuilder: (_, index){
                   var data = widget.orders[index];
                       return widget.isCompleteToday ? _selectedFilter == "Accepted Orders" && data.status == OrderStatus.accepted
                            ? OrderListView(
                               orderId: data.id!.toString(),
                               customerName: data.customer!,
                               qty: data.quantity.toString(),
                               itemName: data.orderitemSet![0].itemName!,
                               dropOfAddress: data.dropoffAddress!,
                               orderInfo: data,
                               status: data.status.toString()
                           )
                               : _selectedFilter == "Complete Orders" && data.status == OrderStatus.completed
                                ? OrderListView(
                                    orderId: data.id!.toString(),
                                    customerName: data.customer!,
                                    qty: data.quantity.toString(),
                                    itemName: data.orderitemSet![0].itemName!,
                                    dropOfAddress: data.dropoffAddress!,
                                    orderInfo: data,
                                    status: data.status.toString()
                                  ) : _selectedFilter.contains("Ready for pickup") && data.status == OrderStatus.readyForPickup
                                    ? OrderListView(
                                        orderId: data.id!.toString(),
                                        customerName: data.customer!,
                                        qty: data.quantity.toString(),
                                        itemName: data.orderitemSet![0].itemName!,
                                        dropOfAddress: data.dropoffAddress!,
                                        orderInfo: data,
                                        status: data.status.toString()
                                        ) : Center()
                           : OrderListView(
                           orderId: data.id!.toString(),
                           customerName: data.customer!,
                           qty: data.quantity.toString(),
                           itemName: data.orderitemSet![0].itemName!,
                           dropOfAddress: data.dropoffAddress!,
                           orderInfo: data,
                           status: data.status.toString()
                       );

                 },
               )
           ) : EmptyData(
             onClick: widget.onClick,
             mes: "No orders found in Incoming Orders. Try again with reload.",
           ) : Expanded(
               child: ListView.builder(
                 itemCount: _searchResult.length,
                 itemBuilder: (_, index){
                   var data = _searchResult[index];
                   return widget.isCompleteToday ? _selectedFilter == "Accepted Orders" && data.status == OrderStatus.accepted
                       ? OrderListView(
                       orderId: data.id!.toString(),
                       customerName: data.customer!,
                       qty: data.quantity.toString(),
                       itemName: data.orderitemSet![0].itemName!,
                       dropOfAddress: data.dropoffAddress!,
                       orderInfo: data,
                       status: data.status.toString()
                   )
                       : _selectedFilter == "Complete Orders" && data.status == OrderStatus.completed
                       ? OrderListView(
                       orderId: data.id!.toString(),
                       customerName: data.customer!,
                       qty: data.quantity.toString(),
                       itemName: data.orderitemSet![0].itemName!,
                       dropOfAddress: data.dropoffAddress!,
                       orderInfo: data,
                       status: data.status.toString()
                   ) : _selectedFilter.contains("Ready for pickup") && data.status == OrderStatus.readyForPickup
                       ? OrderListView(
                       orderId: data.id!.toString(),
                       customerName: data.customer!,
                       qty: data.quantity.toString(),
                       itemName: data.orderitemSet![0].itemName!,
                       dropOfAddress: data.dropoffAddress!,
                       orderInfo: data,
                       status: data.status.toString()
                   ) : Center()
                       : OrderListView(
                       orderId: data.id!.toString(),
                       customerName: data.customer!,
                       qty: data.quantity.toString(),
                       itemName: data.orderitemSet![0].itemName!,
                       dropOfAddress: data.dropoffAddress!,
                       orderInfo: data,
                       status: data.status.toString()
                   ) ;
                 },
               )
           )
          ],
        ),
      ),
    );
  }

  void _searchOrder(String v) {
    _searchResult.clear();
    setState(() {
      for(var i in widget.orders){
        if(i.customer!.toLowerCase().contains(v.toLowerCase()) ||  i.orderitemSet![0].itemName!.toLowerCase().contains(v)){
          _searchResult.add(i);
        }
      }
    });
  }
}
