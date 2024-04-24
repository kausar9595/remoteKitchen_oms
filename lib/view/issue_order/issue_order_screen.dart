import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:oms/utility/app_const.dart';
import 'package:oms/widget/app_alert.dart';
import 'package:oms/widget/app_button.dart';
import 'package:oms/widget/app_drawer.dart';
import 'package:oms/widget/app_shemmer.dart';
import 'package:oms/widget/empty_data.dart';

import '../../controller/order_controller.dart';
import '../../controller/restaurant_controller.dart';
import '../../model/order_model/order_list_model.dart';
import '../../utility/appcolor.dart';
import '../../utility/order_status.dart';

class IssueOrderScreen extends StatefulWidget {
  const IssueOrderScreen({super.key});

  @override
  State<IssueOrderScreen> createState() => _IssueOrderScreenState();
}

class _IssueOrderScreenState extends State<IssueOrderScreen> {
  final _search = TextEditingController();
  var _searchText;

  List<OrderResult> _history = [];
  List<OrderResult> _searchHistory = [];
  bool _isLoading = false;

  Future _getIncomingOrders() async {
    _history.clear();
    setState(() => _isLoading = true);
    var response = await OrderController.getPendingOrder();
    if (response.results!.isNotEmpty) {
      for (var i in response.results!) {
        if (i.status == OrderStatus.cancelled || i.status == OrderStatus.rejected) {
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
        drawer: const AppDrawer(
          currentPage: IssueOrderScreen(),
        ),
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0.3,
          backgroundColor: Colors.white,
          title: const Text(
            "Issue Orders",
            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 24, color: Colors.black),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              TextFormField(
                onChanged: (v) {
                  setState(() {
                    _searchOrder(v);
                  });
                },
                decoration: const InputDecoration(
                  hintText: "Search By Customer Name",
                  hintStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.normal),
                  contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 6),
                  prefixIcon: Icon(
                    Icons.search,
                    color: Colors.grey,
                  ),
                  enabledBorder: OutlineInputBorder(borderSide: BorderSide(width: 1, color: Colors.grey), borderRadius: BorderRadius.all(Radius.circular(10))),
                  focusedBorder: OutlineInputBorder(borderSide: BorderSide(width: 1, color: Colors.blue), borderRadius: BorderRadius.all(Radius.circular(10))),
                  border: OutlineInputBorder(borderSide: BorderSide(width: 1, color: Colors.grey), borderRadius: BorderRadius.all(Radius.circular(10))),
                ),
              ),
              const Divider(),
              _isLoading
                  ? Expanded(
                      child: Container(
                        child: ListView.builder(
                          itemCount: 10,
                          itemBuilder: (_, index) {
                            return Container(
                              margin: const EdgeInsets.only(bottom: 10),
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
                                  columns: const [
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
                                        "Status",
                                        style: TextStyle(fontWeight: FontWeight.w400, fontSize: 14, color: AppColors.textblack),
                                      ),
                                    ),
                                  ],
                                  rows: _searchHistory.isNotEmpty
                                      ? _searchHistory
                                          .map(
                                            (value) => DataRow(
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
                                                            style: const TextStyle(
                                                              fontWeight: FontWeight.w400,
                                                              color: AppColors.textblack,
                                                              fontSize: 14,
                                                            ),
                                                          ),
                                                          Text(
                                                            "${value.customer.toString()}",
                                                            style: const TextStyle(fontWeight: FontWeight.w500, color: AppColors.textblack, fontSize: 18),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                )),
                                                DataCell(InkWell(
                                                  child: Text(
                                                    "${selectRsname}",
                                                    style: TextStyle(fontWeight: FontWeight.w600, color: AppColors.textblack, fontSize: 14),
                                                  ),
                                                )),
                                                DataCell(InkWell(
                                                  child: Text("${selectLocationName}",
                                                      style: TextStyle(fontWeight: FontWeight.w600, color: AppColors.textblack, fontSize: 14)),
                                                )),
                                                DataCell(InkWell(
                                                  child: Text("CA\$${value.total.toString()}",
                                                      style: const TextStyle(fontWeight: FontWeight.w400, color: AppColors.textblack, fontSize: 14)),
                                                )),
                                                DataCell(InkWell(
                                                  child: Text("${DateFormat('dd-MM-yyyy hh:mm a').format(DateTime.parse("${value.createdDate}"))}",
                                                      style: const TextStyle(fontWeight: FontWeight.w400, color: AppColors.textblack, fontSize: 14)),
                                                )),
                                                DataCell(
                                                  HistoryOrderStatusCard(orderResult: value, onClick: () => _orderDetails(value)),
                                                ),
                                              ],
                                            ),
                                          )
                                          .toList()
                                      : _history
                                          .map(
                                            (value) => DataRow(
                                              cells: [
                                                DataCell(Row(
                                                  children: [
                                                    InkWell(
                                                      child: Column(
                                                        mainAxisAlignment: MainAxisAlignment.center,
                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                        children: [
                                                          Text("#${value.id.toString()}",
                                                              style: const TextStyle(fontWeight: FontWeight.w400, color: AppColors.textblack, fontSize: 14)),
                                                          Text(
                                                            "${value.customer.toString()}",
                                                            style: const TextStyle(fontWeight: FontWeight.w500, color: AppColors.textblack, fontSize: 18),
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
                                                      style: const TextStyle(fontWeight: FontWeight.w600, color: AppColors.textblack, fontSize: 14)),
                                                )),
                                                DataCell(InkWell(
                                                  child: Text("CA\$${value.total.toString()}",
                                                      style: const TextStyle(fontWeight: FontWeight.w400, color: AppColors.textblack, fontSize: 14)),
                                                )),
                                                DataCell(InkWell(
                                                  child: Text("${DateFormat('dd-MM-yyyy hh:mm a').format(DateTime.parse("${value.createdDate}"))}",
                                                      style: const TextStyle(fontWeight: FontWeight.w400, color: AppColors.textblack, fontSize: 14)),
                                                )),
                                                DataCell(HistoryOrderStatusCard(orderResult: value, onClick: () => _orderDetails(value))),
                                              ],
                                            ),
                                          )
                                          .toList()),
                            ],
                          ),
                        )
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
              shape: const OutlineInputBorder(
                borderRadius: BorderRadius.zero,
              ),
              alignment: Alignment.centerRight,
              title: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        alignment: Alignment.center,
                        height: MediaQuery.of(context).size.height * 0.07,
                        width: MediaQuery.of(context).size.width * 0.20,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                          border: Border.all(color: Colors.grey),
                        ),
                        child: DropdownButton<String>(
                          icon: const Icon(
                            Icons.keyboard_arrow_down_rounded,
                            size: 35,
                            color: Colors.black,
                          ),
                          elevation: 0,
                          underline: Container(
                            decoration: const BoxDecoration(
                              border: Border(bottom: BorderSide.none),
                            ),
                          ),
                          hint: const Row(
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
                          items: <String>['A', 'B', 'C', 'D'].map((String value) {
                            return DropdownMenuItem<String>(
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
                          icon: const Icon(
                            Icons.cancel_outlined,
                            color: Colors.black,
                            size: 50,
                          )),
                    ],
                  ),
                  const Divider(),
                  const SizedBox(
                    height: 30,
                  ),
                ],
              ),
              content: SingleChildScrollView(
                child: Container(
                  //margin: EdgeInsets.only(top: 30, bottom: 30),
                  padding: const EdgeInsets.all(15),
                  width: MediaQuery.of(context).size.width * .45,

                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "${orderResult.quantity} items for Example User Name",
                        style: TextStyle(
                          fontSize: bigFontSize,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                        ),
                      ),
                      ListTile(
                        leading: Text(
                          "Order Placed",
                          style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14, color: Colors.black),
                        ),
                        title: const Divider(),
                        trailing: Text(
                          "${DateFormat("dd-MM-yyyy hh:mm a").format(DateTime.parse("${orderResult.receiveDate}"))}",
                          style: TextStyle(fontSize: normalFontSize, fontWeight: FontWeight.w500, color: Colors.black),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: orderResult.orderitemSet!.length,
                        itemBuilder: (_, index) {
                          var items = orderResult.orderitemSet![index];
                          return ListTile(
                            leading: Container(
                              alignment: Alignment.center,
                              height: MediaQuery.of(context).size.height * 0.06,
                              width: MediaQuery.of(context).size.width * 0.04,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100),
                                color: AppColors.textindigo,
                              ),
                              child: Text(
                                "${items.quantity!.toString()}",
                                style: TextStyle(fontWeight: FontWeight.w500, color: Colors.white, fontSize: normalFontSize),
                              ),
                            ),
                            title: Text(
                              "${items.menuItem != null ? items.menuItem!.name : "Null"}",
                              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: Colors.black),
                            ),
                            trailing: Text(
                              "CA\$${items.menuItem != null ? items.menuItem!.basePrice : "Null"}",
                              style: TextStyle(fontSize: normalFontSize, fontWeight: FontWeight.w500, color: Colors.black),
                            ),
                          );
                        },
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      ListTile(
                        leading: Text(
                          "Item Subtotal",
                          style: TextStyle(fontWeight: FontWeight.w600, fontSize: normalFontSize, color: Colors.black),
                        ),
                        title: const Divider(),
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
                        title: const Divider(),
                        trailing: Text(
                          "CA\$${orderResult.tax}",
                          style: TextStyle(fontSize: normalFontSize, fontWeight: FontWeight.w500, color: Colors.black),
                        ),
                      ),
                      const Divider(
                        thickness: 5,
                        color: Colors.black,
                      ),
                      ListTile(
                        leading: Text(
                          "Total",
                          style: TextStyle(fontWeight: FontWeight.w600, fontSize: normalFontSize, color: Colors.black),
                        ),
                        title: const Divider(),
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
                        title: const Divider(),
                        trailing: Text(
                          "${DateFormat("dd-MM-yyyy hh:mm a").format(DateTime.parse("${orderResult.modifiedDate}"))}",
                          style: TextStyle(fontSize: normalFontSize, fontWeight: FontWeight.w500, color: Colors.black),
                        ),
                      ),
                      orderResult.isPaid == false
                          ? AppButton(
                              text: "Paid",
                              width: 200,
                              height: 45,
                              bgColor: Colors.green,
                              onClick: () async {
                                ///TODO api....
                                OrderController.changeStatus(orderResult.id.toString(), OrderStatus.completed).then((value) {
                                  AppSnackBar(context, "Order mark as complete", Colors.green);
                                  Navigator.push(context, MaterialPageRoute(builder: (context) => IssueOrderScreen()));
                                });

                                ///
                              })
                          : Center()
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
    required this.onClick,
  });

  final OrderResult orderResult;
  final VoidCallback onClick;

  @override
  Widget build(BuildContext context) {
    if (orderResult.isPaid! == false) {
      return _buildCard("Unpaid", Colors.red, false);
    }
    if (orderResult.status == OrderStatus.cancelled) {
      return _buildCard("Cancelled", Colors.red, false);
    }
    if (orderResult.status == OrderStatus.rejected) {
      return _buildCard("Rejected", Colors.red, false);
    }
    return _buildCard(orderResult.status?.capitalizeFirst ?? "Unknown", Colors.grey.shade300);
  }

  Widget _buildCard(String value, Color color, [bool blackText = true]) {
    return InkWell(
      onTap: onClick,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          color: color,
        ),
        child: Text(
          value,
          style: TextStyle(color: blackText ? Colors.black : Colors.white),
        ),
      ),
    );
  }
}
