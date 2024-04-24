import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:oms/utility/app_const.dart';
import 'package:oms/view/history/history_details.dart';
import 'package:oms/widget/app_button.dart';
import 'package:oms/widget/app_drawer.dart';
import 'package:oms/widget/app_shemmer.dart';
import 'package:oms/widget/empty_data.dart';

import '../../controller/order_controller.dart';
import '../../controller/restaurant_controller.dart';
import '../../model/order_model/order_list_model.dart';
import '../../utility/appcolor.dart';
import '../../utility/order_status.dart';
import '../menus/widgets/widget/radio.dart';
import '../order/order_details/widgets/printer_view.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({super.key});

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  final _search = TextEditingController();
  var _searchText;

  List<OrderResult> _history = [];
  List<OrderResult> _searchHistory = [];
  bool _isLoading = false;

  Future _getIncomingOrders() async {
    _history.clear();
    setState(() => _isLoading = true);
    var response = await OrderController.getPendingOrder();
    if (response!.results!.isNotEmpty) {
      for (var i in response!.results!) {
        print("i.status === ${i.status}");
        if (i.status != OrderStatus.pending && i.status != OrderStatus.accepted) {
          setState(() {
            _history.add(i);
          });
        }
      }
    }
    setState(() => _isLoading = false);
  }

  var selectLocationName, selectRsname;
  _getLocationAdnRestaurant() async {
    await RestaurantController.getLocationAndRestaurantIds().then((value) {
      print("value.locationName! === ${value.locationName!}");
      setState(() {
        selectLocationName = (value.locationName!);
        selectRsname = value.restaurantName!;
      });
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getIncomingOrders();
    _getLocationAdnRestaurant();
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () => _getIncomingOrders(),
      child: SafeArea(
          child: Scaffold(
        drawer: AppDrawer(
          currentPage: HistoryScreen(),
        ),
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0.3,
          backgroundColor: Colors.white,
          title: Text(
            "History",
            style: TextStyle(fontWeight: FontWeight.w600, fontSize: bigFontSize, color: Colors.black),
          ),
        ),
        body: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              TextFormField(
                controller: _search,
                onChanged: (v) {
                  setState(() {
                    _searchOrder(v);
                  });
                },
                decoration: InputDecoration(
                    hintText: "Search Order number or Customer name",
                    hintStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: Colors.grey),
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
              _isLoading
                  ? Expanded(
                      child: Container(
                        child: ListView.builder(
                          itemCount: 10,
                          itemBuilder: (_, index) {
                            return Container(
                              margin: EdgeInsets.only(bottom: 10),
                              child: AppShimmer(
                                width: MediaQuery.of(context).size.width,
                                height: 50,
                              ),
                            );
                          },
                        ),
                      ),
                    )
                  : _history.isNotEmpty
                      ? Expanded(
                          child: ListView(
                          children: [
                            DataTable(
                                columnSpacing: 70,
                                dividerThickness: 1,
                                dataRowMaxHeight: 60,
                                columns: [
                                  DataColumn(
                                    label: Expanded(
                                      child: Text(
                                        "Order",
                                        style: TextStyle(fontWeight: FontWeight.w400, fontSize: 14, color: AppColors.textblack),
                                      ),
                                    ),
                                  ),
                                  DataColumn(
                                    label: Text(
                                      "Restaurant",
                                      style: TextStyle(fontWeight: FontWeight.w400, fontSize: 14, color: AppColors.textblack),
                                    ),
                                  ),
                                  DataColumn(
                                    label: Text(
                                      "Location",
                                      style: TextStyle(fontWeight: FontWeight.w400, fontSize: 14, color: AppColors.textblack),
                                    ),
                                  ),
                                  DataColumn(
                                    label: Text(
                                      "Total",
                                      style: TextStyle(fontWeight: FontWeight.w400, fontSize: 14, color: AppColors.textblack),
                                    ),
                                  ),
                                  DataColumn(
                                    label: Text(
                                      "Placed",
                                      style: TextStyle(fontWeight: FontWeight.w400, fontSize: 14, color: AppColors.textblack),
                                    ),
                                  ),
                                  DataColumn(
                                    label: Text(
                                      "View",
                                      style: TextStyle(fontWeight: FontWeight.w400, fontSize: 14, color: AppColors.textblack),
                                    ),
                                  ),
                                ],
                                rows: _searchHistory.isNotEmpty
                                    ? _searchHistory
                                        .map((value) => DataRow(
                                    cells: [
                                              DataCell(Row(
                                                children: [
                                                  InkWell(
                                                    child: Column(
                                                      mainAxisAlignment: MainAxisAlignment.center,
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      children: [
                                                        Text(
                                                          "#${value.id.toString()}",
                                                          style: TextStyle(
                                                            fontWeight: FontWeight.w400,
                                                            color: AppColors.textblack,
                                                            fontSize: 14,
                                                          ),
                                                        ),
                                                        Text(
                                                          "${value.customer.toString()}",
                                                          style: TextStyle(fontWeight: FontWeight.w700, color: AppColors.textblack, fontSize: normalFontSize),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              )),
                                              DataCell(InkWell(
                                                child: Text(
                                                  "${selectRsname}",
                                                  style: TextStyle(fontWeight: FontWeight.w600, color: AppColors.textblack, fontSize: titleFontSize),
                                                ),
                                              )),
                                              DataCell(InkWell(
                                                child: Text("${selectLocationName}",
                                                    style: TextStyle(fontWeight: FontWeight.w600, color: AppColors.textblack, fontSize: normalFontSize)),
                                              )),
                                              DataCell(InkWell(
                                                child: Text("CA\$${value.total.toString()}",
                                                    style: TextStyle(fontWeight: FontWeight.w400, color: AppColors.textblack, fontSize: 14)),
                                              )),
                                              DataCell(InkWell(
                                                child: Text("${DateFormat('dd-MM-yyyy hh:mm a').format(DateTime.parse("${value.createdDate}"))}",
                                                    style: TextStyle(fontWeight: FontWeight.w400, color: AppColors.textblack, fontSize: 14)),
                                              )),
                                              DataCell(AppButton(
                                                text: "VIEW",
                                                width: 70,
                                                fontSize: 13,
                                                height: 40,
                                                onClick: () => _orderDetails(value),
                                              )),
                                            ]))
                                        .toList()
                                    : _history
                                        .map((value) => DataRow(cells: [
                                              DataCell(Row(
                                                children: [
                                                  InkWell(
                                                    child: Column(
                                                      mainAxisAlignment: MainAxisAlignment.center,
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      children: [
                                                        Text("#${value.id.toString()}",
                                                            style: TextStyle(fontWeight: FontWeight.w400, color: AppColors.textblack, fontSize: 14)),
                                                        Text(
                                                          "${value.customer.toString()}",
                                                          style: TextStyle(fontWeight: FontWeight.w700, color: AppColors.textblack, fontSize: normalFontSize),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              )),
                                              DataCell(InkWell(
                                                child: Text(
                                                  "${selectRsname}",
                                                  style: TextStyle(fontWeight: FontWeight.w600, color: AppColors.textblack, fontSize: normalFontSize),
                                                ),
                                              )),
                                              DataCell(InkWell(
                                                child: Text("${selectLocationName}",
                                                    style: TextStyle(fontWeight: FontWeight.w600, color: AppColors.textblack, fontSize: 14)),
                                              )),
                                              DataCell(InkWell(
                                                child: Text("CA\$${value.total.toString()}",
                                                    style: TextStyle(fontWeight: FontWeight.w400, color: AppColors.textblack, fontSize: 14)),
                                              )),
                                              DataCell(InkWell(
                                                child: Text("${convertPacificTimeZoon(value.receiveDate)}",
                                                    style: TextStyle(fontWeight: FontWeight.w400, color: AppColors.textblack, fontSize: 14)),
                                              )),
                                              DataCell(AppButton(
                                                text: "VIEW",
                                                width: 70,
                                                fontSize: 13,
                                                height: 40,
                                                onClick: () => _orderDetails(value),
                                              )),
                                            ]))
                                        .toList()),
                          ],
                        ))
                      : EmptyData(onClick: () => _getIncomingOrders(), mes: "No history found for this Restaurant & Location."),
            ],
          ),
        ),
      )),
    );
  }

  _orderDetails(OrderResult orderResult) {
    showDialog(
        context: (context),
        builder: (context) => AlertDialog(
              backgroundColor: Colors.white,
              shape: OutlineInputBorder(
                borderRadius: BorderRadius.zero,
              ),
              alignment: Alignment.centerRight,
              title: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      PrinterViewPage(
                        orderResult: orderResult,
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
                ],
              ),
              content: SingleChildScrollView(
                child: Container(
                  //margin: EdgeInsets.only(top: 30, bottom: 30),
                  padding: EdgeInsets.all(15),
                  width: MediaQuery.of(context).size.width * .45,

                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [

                      Text(
                        "${orderResult.quantity} items for ${orderResult.customer}",
                        style: TextStyle(
                          fontSize: titleFontSize,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                        ),
                      ),
                      ListTile(
                        leading: Text(
                          "Order Placed",
                          style: TextStyle(fontWeight: FontWeight.w600, fontSize: normalFontSize, color: Colors.black),
                        ),
                        title: Divider(),
                        trailing: Text(
                          "${convertPacificTimeZoon(orderResult.receiveDate)}",
                          style: TextStyle(fontSize: normalFontSize, fontWeight: FontWeight.w500, color: Colors.black),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: orderResult.orderitemSet!.length,
                        itemBuilder: (_, index) {
                          var items = orderResult.orderitemSet![index];
                          if (items.modifiers!.length > 0) {
                            print(items.modifiers?.first);
                          }
                          return ListTile(
                            leading: Container(
                              alignment: Alignment.center,
                              height: 45,
                              width: 45,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100),
                                color: AppColors.textindigo,
                              ),
                              child: Text(
                                "${items.quantity!.toString()}",
                                style: TextStyle(fontWeight: FontWeight.w500, color: Colors.white, fontSize: normalFontSize),
                              ),
                            ),
                            subtitle: items.modifiers!.isNotEmpty && items.modifiers!.length > index
                                ? ListView.builder(
                                    shrinkWrap: true,
                                    physics: NeverScrollableScrollPhysics(),
                                    itemCount: items.modifiers![index].modifiersItems?.length,
                                    itemBuilder: (_, modifiarItem) {
                                      return Row(
                                        //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            "${items.modifiers![index].modifiersItems![modifiarItem].modifiersOrderItems!.name}",
                                            style: TextStyle(
                                              fontSize: 13,
                                              fontWeight: FontWeight.w400,
                                              color: AppColors.textblack,
                                            ),
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Text(
                                            "(CA\$${items.modifiers![index].modifiersItems![modifiarItem].modifiersOrderItems!.basePrice})",
                                            style: TextStyle(
                                              fontSize: 13,
                                              fontWeight: FontWeight.w600,
                                              color: AppColors.textblack,
                                            ),
                                          ),
                                        ],
                                      );
                                    },
                                  )
                                : Center(),
                            title: Text(
                              "${items.menuItem?.name}",
                              style: TextStyle(fontSize: normalFontSize, fontWeight: FontWeight.w600, color: Colors.black),
                            ),
                            trailing: Text(
                              "CA\$${items.menuItem?.basePrice}",
                              style: TextStyle(fontSize: normalFontSize, fontWeight: FontWeight.w500, color: Colors.black),
                            ),
                          );
                        },
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      ListTile(
                        leading: Text(
                          "Item Subtotal",
                          style: TextStyle(fontWeight: FontWeight.w600, fontSize: normalFontSize, color: Colors.black),
                        ),
                        title: Divider(),
                        trailing: Text(
                          "CA\$${orderResult.subtotal}",
                          style: TextStyle(fontSize: normalFontSize, fontWeight: FontWeight.w500, color: Colors.black),
                        ),
                      ),
                      ListTile(
                        leading: Text(
                          "Tax",
                          style: TextStyle(fontWeight: FontWeight.w600, fontSize: normalFontSize, color: Colors.black),
                        ),
                        title: Divider(),
                        trailing: Text(
                          "CA\$${orderResult.tax}",
                          style: TextStyle(fontSize: normalFontSize, fontWeight: FontWeight.w500, color: Colors.black),
                        ),
                      ),
                      orderResult.discount != 0.0
                          ? ListTile(
                              leading: Text(
                                "Discount",
                                style: TextStyle(fontWeight: FontWeight.w500, fontSize: normalFontSize, color: Colors.black),
                              ),
                              title: Divider(),
                              trailing: Text(
                                "CA\$${orderResult.discount}",
                                style: TextStyle(fontWeight: FontWeight.w500, fontSize: normalFontSize, color: Colors.black),
                              ),
                            )
                          : Center(),
                      orderResult.deliveryFee != 0.0
                          ? ListTile(
                              leading: Text(
                                "Delivery Fee",
                                style: TextStyle(fontWeight: FontWeight.w500, fontSize: normalFontSize, color: Colors.black),
                              ),
                              title: Divider(),
                              trailing: Text(
                                "CA\$${orderResult.deliveryFee}",
                                style: TextStyle(fontWeight: FontWeight.w500, fontSize: normalFontSize, color: Colors.black),
                              ),
                            )
                          : Center(),
                      orderResult.convenienceFee != 0.0
                          ? ListTile(
                              leading: Text(
                                "Convenience Fee",
                                style: TextStyle(fontWeight: FontWeight.w500, fontSize: normalFontSize, color: Colors.black),
                              ),
                              title: Divider(),
                              trailing: Text(
                                "CA\$${orderResult.convenienceFee}",
                                style: TextStyle(fontWeight: FontWeight.w500, fontSize: normalFontSize, color: Colors.black),
                              ),
                            )
                          : Center(),
                      orderResult.deliveryDiscount != 0.0
                          ? ListTile(
                              leading: Text(
                                "Delivery Discount",
                                style: TextStyle(fontWeight: FontWeight.w500, fontSize: normalFontSize, color: Colors.black),
                              ),
                              title: Divider(),
                              trailing: Text(
                                "CA\$${orderResult.deliveryDiscount}",
                                style: TextStyle(fontWeight: FontWeight.w500, fontSize: normalFontSize, color: Colors.black),
                              ),
                            )
                          : Center(),
                      orderResult.voucher != null && orderResult.voucher != 0.0
                          ? ListTile(
                              leading: Text(
                                "Voucher",
                                style: TextStyle(fontWeight: FontWeight.w500, fontSize: normalFontSize, color: Colors.black),
                              ),
                              title: Divider(),
                              trailing: Text(
                                "CA\$${orderResult.voucher}",
                                style: TextStyle(fontWeight: FontWeight.w500, fontSize: normalFontSize, color: Colors.black),
                              ),
                            )
                          : Center(),
                      orderResult.tips != null && orderResult.tips != 0.0
                          ? ListTile(
                              leading: Text(
                                "Tips",
                                style: TextStyle(fontWeight: FontWeight.w500, fontSize: normalFontSize, color: Colors.black),
                              ),
                              title: Divider(),
                              trailing: Text(
                                "CA\$${orderResult.tips}",
                                style: TextStyle(fontWeight: FontWeight.w500, fontSize: normalFontSize, color: Colors.black),
                              ),
                            )
                          : Center(),
                      Divider(
                        thickness: 5,
                        color: Colors.black,
                      ),
                      ListTile(
                        leading: Text(
                          "Total",
                          style: TextStyle(fontWeight: FontWeight.w600, fontSize: normalFontSize, color: Colors.black),
                        ),
                        title: Divider(),
                        trailing: Text(
                          "CA\$${orderResult.total}",
                          style: TextStyle(fontSize: normalFontSize, fontWeight: FontWeight.w500, color: Colors.black),
                        ),
                      ),
                      ListTile(
                        leading: Text(
                          "Order Completed",
                          style: TextStyle(fontWeight: FontWeight.w600, fontSize: normalFontSize, color: Colors.black),
                        ),
                        title: Divider(),
                        trailing: Text(
                          "${convertPacificTimeZoon(orderResult.modifiedDate)}",
                          style: TextStyle(fontSize: normalFontSize, fontWeight: FontWeight.w500, color: Colors.black),
                        ),
                      ),
                      HistoryOrderStatusCard(orderResult: orderResult)
                    ],
                  ),
                ),
              ),
            ));
  }

  void _searchOrder(String v) {
    _searchHistory.clear();
    setState(() {
      for (var i in _history) {
        //loop for items
        for (var j in i.orderitemSet!) {
          if (i.customer!.toLowerCase().contains(v.toLowerCase()) || j.menuItem!.name!.toLowerCase().contains(v)) {
            _searchHistory.add(i);
          }
        }
      }
    });
  }
}

class HistoryOrderStatusCard extends StatelessWidget {
  const HistoryOrderStatusCard({
    super.key,
    required this.orderResult,
  });

  final OrderResult orderResult;

  @override
  Widget build(BuildContext context) {
    // if (orderResult.isPaid! == false) {
    //   return _buildCard("Unpaid", Colors.red.shade100);
    // }
    if (orderResult.status == OrderStatus.completed) {
      return _buildCard("Completed", Colors.green.shade200);
    }
    if (orderResult.status == OrderStatus.cancelled) {
      return _buildCard("Cancelled", Colors.red, false);
    }
    if (orderResult.status == OrderStatus.readyForPickup) {
      return _buildCard("Ready For Pickup", Colors.blueAccent.shade100);
    }
    return _buildCard(orderResult.status?.capitalizeFirst ?? "Unknown", Colors.grey.shade300);
  }

  Container _buildCard(String value, Color color, [bool blackText = true]) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        color: color,
      ),
      child: Text(
        value,
        style: TextStyle(color: blackText ? Colors.black : Colors.white),
      ),
    );
  }
}
