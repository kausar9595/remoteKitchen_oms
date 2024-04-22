import 'dart:async';
import 'dart:ui';

import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:oms/utility/app_const.dart';
import 'package:oms/utility/appcolor.dart';
import 'package:oms/view/order/order_details/widgets/custom_popup.dart';
import 'package:oms/view/order/screen/widget/new_order_list_view.dart';
import 'package:oms/view/setting_screen/widget/app_input.dart';
import 'package:oms/widget/app_button.dart';

import '../../../controller/order_controller.dart';
import '../../../controller/restaurant_controller.dart';
import '../../../model/order_model/order_list_model.dart';
import '../../../notifications/notification.dart';
import '../../../utility/order_status.dart';
import '../../../widget/app_drawer.dart';
import '../../../widget/new_user.dart';
import '../../menus/widgets/widget/radio.dart';
import 'orders.dart';

class NewOrderScreen extends StatefulWidget {
  final int? pageIndex;
  const NewOrderScreen({super.key, this.pageIndex});

  @override
  State<NewOrderScreen> createState() => _NewOrderScreenState();
}

class _NewOrderScreenState extends State<NewOrderScreen> {
  final List<String> items = [
    'Filter Items',
    'Filter Items',
    'Filter Items',
  ];
  String? selectedValue;
  final _key = GlobalKey<ScaffoldState>();

  Timer? _timer;

  List<OrderResult> _incomingOrdersList = [];
  List<OrderResult> _readyForDelivered = [];
  List<OrderResult> _cancelledOrderList = [];
  List<OrderResult> _acceptedOrderList = [];
  List<OrderResult> _scheduleOrderList = [];
  List<OrderResult> _unpaidCashlist = [];
  List<OrderResult> _preparingOrderList = [];
  bool _isLoading = false;
  Future<void> _getIncomingOrders() async {
    _incomingOrdersList.clear();
    _acceptedOrderList.clear();
    _readyForDelivered.clear();
    _cancelledOrderList.clear();
    _scheduleOrderList.clear();
    _unpaidCashlist.clear();
    _preparingOrderList.clear();
    setState(() => _isLoading = true);
    var response = await OrderController.getPendingOrder();
    for (var i in response!.results!) {
      if (i.status == OrderStatus.pending) {
        setState(() {
          _incomingOrdersList.add(i);
        });
      }
      if (i.isPaid != true && i.paymentMethod == "cash" && i.status == OrderStatus.readyForPickup) {
        setState(() {
          _unpaidCashlist.add(i);
        });
      }
      if (i.status == OrderStatus.accepted) {
        setState(() {
          _preparingOrderList.add(i);
        });
      }
      if (i.status == OrderStatus.cancelled) {
        setState(() {
          _cancelledOrderList.add(i);
        });
      }
      if (i.status == OrderStatus.accepted || i.status == OrderStatus.readyForPickup || i.status == OrderStatus.completed) {
        setState(() {
          _acceptedOrderList.add(i);
        });
      }
      if (i.status == OrderStatus.schedule) {
        setState(() {
          _scheduleOrderList.add(i);
        });
      }
      if (i.status == OrderStatus.readyForPickup) {
        setState(() {
          _readyForDelivered.add(i);
        });
      }
    }
    setState(() => _isLoading = false);
  }

  void withoutLoadingOrderLoad() async {
    _incomingOrdersList.clear();
    _scheduleOrderList.clear();
    _cancelledOrderList.clear();
    _readyForDelivered.clear();
    _acceptedOrderList.clear();
    var response = await OrderController.getPendingOrder();
    for (var i in response!.results!) {
      if (i.status == OrderStatus.pending) {
        setState(() {
          _incomingOrdersList.add(i);
        });
      }
      if (i.status == OrderStatus.cancelled) {
        setState(() {
          _cancelledOrderList.add(i);
        });
      }
      if (i.status == OrderStatus.accepted || i.status == OrderStatus.readyForPickup || i.status == OrderStatus.completed) {
        setState(() {
          _acceptedOrderList.add(i);
        });
      }
      if (i.status == OrderStatus.schedule) {
        setState(() {
          _scheduleOrderList.add(i);
        });
      }
      if (i.status == OrderStatus.readyForPickup) {
        setState(() {
          _readyForDelivered.add(i);
        });
      }
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //get location id and restaurant id
    NotificationController().initNotification(context);
    _getLocationAndRestaurantId();
    _getIncomingOrders();
    //_startTimerToAutoLoad();

    //store incoming orders into "_incomingOrdersList"
    print("this is order page");
  }

  bool _isNew = true;

  final _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
          key: _key,
          drawer: AppDrawer(
            currentPage: NewOrderScreen(),
          ),
          appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 0.5,
            title: Text(
              "Orders",
              style: TextStyle(fontWeight: FontWeight.w600, color: Colors.black, fontSize: titleFontSize),
            ),
            actions: [
              InkWell(
                onTap: () => showDialog(
                    context: (context),
                    builder: (context) => AlertDialog(
                          backgroundColor: Colors.white,
                          shape: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide.none,
                          ),
                          title: Container(
                            padding: EdgeInsets.all(15),
                            //height: MediaQuery.of(context).size.height-200,
                            width: MediaQuery.of(context).size.width * 0.35,
                            child: Column(
                              children: [
                                Align(
                                    alignment: Alignment.centerRight,
                                    child: IconButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        icon: Icon(
                                          Icons.cancel_outlined,
                                          size: 40,
                                          color: Colors.red,
                                        ))),
                                SizedBox(
                                  height: 30,
                                ),
                                Center(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Center(
                                        child: Text(
                                          "Store Status",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            fontSize: titleFontSize,
                                            fontWeight: FontWeight.w600,
                                            color: Colors.black,
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Container(
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(10),
                                          border: Border.all(color: AppColors.grey200),
                                        ),
                                        child: ListTile(
                                          leading: Icon(Icons.check_box_outlined),
                                          title: Text("Open"),
                                          subtitle: Text("Can't Complete Instraction"),
                                          trailing: Icon(
                                            Icons.circle_outlined,
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Container(
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(10),
                                          border: Border.all(color: AppColors.textindigo),
                                        ),
                                        child: ListTile(
                                          leading: Icon(Icons.refresh),
                                          title: Text("Busy"),
                                          subtitle: Text("Can't Complete Instraction"),
                                          trailing: Icon(
                                            Icons.task_alt,
                                            color: AppColors.textindigo,
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Container(
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(10),
                                          border: Border.all(color: AppColors.grey200),
                                        ),
                                        child: ListTile(
                                          leading: Icon(Icons.pause_circle_outline),
                                          title: Text("Paush"),
                                          subtitle: Text("Can't Complete Instraction"),
                                          trailing: Icon(
                                            Icons.circle_outlined,
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Container(
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(10),
                                          border: Border.all(color: AppColors.grey200),
                                        ),
                                        child: ListTile(
                                          leading: Icon(Icons.schedule),
                                          title: Text("Schedule paush"),
                                          subtitle: Text("Can't Complete Instraction"),
                                          trailing: Icon(
                                            Icons.circle_outlined,
                                          ),
                                          onTap: () {
                                            Navigator.pop(context);
                                            _schedulePopUp(context);
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )),
                child: Container(
                  margin: EdgeInsets.only(right: 10),
                  padding: EdgeInsets.all(5),
                  height: 40,
                  width: 100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: AppColors.textindigo),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Busy",
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          color: AppColors.textindigo,
                          fontSize: normalFontSize,
                        ),
                      ),
                      Icon(
                        Icons.keyboard_arrow_down_rounded,
                        color: AppColors.textindigo,
                      ),
                    ],
                  ),
                ),
              )

              ///TODO:: "Add busy dropdown"
            ],
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(100),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  children: [
                    Expanded(
                        child: TextFormField(
                      controller: _searchController,
                      decoration: const InputDecoration(
                          hintText: "Search Order Number, Customer Name or Items",
                          hintStyle: TextStyle(fontSize: 12, fontWeight: FontWeight.normal),
                          contentPadding: EdgeInsets.all(20),
                          prefixIcon: Icon(
                            Icons.search,
                            color: Colors.grey,
                          ),
                          enabledBorder:
                              OutlineInputBorder(borderSide: BorderSide(width: 1, color: Colors.grey), borderRadius: BorderRadius.all(Radius.circular(10))),
                          focusedBorder:
                              OutlineInputBorder(borderSide: BorderSide(width: 1, color: Colors.blue), borderRadius: BorderRadius.all(Radius.circular(10))),
                          border:
                              OutlineInputBorder(borderSide: BorderSide(width: 1, color: Colors.grey), borderRadius: BorderRadius.all(Radius.circular(10)))),
                    )),
                    SizedBox(
                      width: 30,
                    ),
                    Container(
                      width: 220,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton2<String>(
                          isExpanded: true,
                          hint: Text(
                            "No Filter Current Applied",
                            style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400, color: AppColors.textblack),
                          ),
                          items: items
                              .map((String item) => DropdownMenuItem<String>(
                                    value: item,
                                    child: Text(
                                      item,
                                      style: const TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w400,
                                        color: AppColors.textblack,
                                      ),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ))
                              .toList(),
                          value: selectedValue,
                          onChanged: (value) {
                            setState(() {
                              selectedValue = value;
                            });
                          },
                        ),
                      ),
                    )

                    ///TODO: Add "No Filter Currently Applied dropdown"
                  ],
                ),
              ),
            ),
          ),
          body: _isNew
              ? NewUser(
                  onClick: () {
                    _key.currentState!.openDrawer();
                  },
                  mes: "You are new here. You need to Choose Restaurant & Location")
              : Container(
                  margin: EdgeInsets.only(left: 30, right: 30, top: 20, bottom: 20),
                  height: size.height,
                  width: size.width,
                  child: Row(
                    children: [
                      Expanded(
                          child: NewOrdersListView(
                        title: "Incoming Orders",
                        orders: _incomingOrdersList,
                        btnText: "Incoming Orders",
                        btnColor: Colors.blue.shade100,
                        onClick: () {},
                      )),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                          child: NewOrdersListView(
                        title: "Preparing",
                        orders: _preparingOrderList,
                        btnText: "Ready in 13 Mins",
                        btnColor: Colors.greenAccent.shade100,
                        onClick: () {},
                      )),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                          child: NewOrdersListView(
                        isLast: true,
                        title: "Cash Unpaid",
                        orders: _unpaidCashlist,
                        btnText: "Unpaid",
                        btnColor: Colors.red.shade100,
                        onClick: () {},
                      )),
                    ],
                  ),
                )),
    );
  }

  Future _getLocationAndRestaurantId() async {
    await RestaurantController.getLocationAndRestaurantIds().then((value) {
      print("value.locationId == ${value.locationId}");
      if (value.locationId == "null" && value.restaurantId == "null") {
        setState(() => _isNew = true);
      } else {
        setState(() => _isNew = false);
      }
    });
  }

  @override
  void dispose() {
    // Cancel the timer when the widget is disposed to avoid memory leaks
    _timer?.cancel();
    super.dispose();
  }

  void _startTimerToAutoLoad() {
    // Create a timer that runs a function every 5 seconds
    _timer = Timer.periodic(Duration(seconds: 4), (timer) {
      // Call your function here
      withoutLoadingOrderLoad();
    });
  }

  /*---schedule popUp---*/
  Future<void> _schedulePopUp(BuildContext context) {
    return showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) {
          return AlertDialog(
            backgroundColor: Colors.white,
            shape: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide.none,
            ),
            title: Container(
              padding: EdgeInsets.all(15),
              //height: MediaQuery.of(context).size.height-200,
              width: MediaQuery.of(context).size.width * 0.30,
              child: Column(
                children: [
                  Align(
                      alignment: Alignment.centerRight,
                      child: IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: Icon(
                            Icons.cancel_outlined,
                            size: 40,
                            color: Colors.red,
                          ))),
                  SizedBox(
                    height: 15,
                  ),
                  Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Center(
                          child: Text(
                            "Select Schedule\n Pause Time",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: titleFontSize,
                              fontWeight: FontWeight.w600,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        ListTile(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                            side: BorderSide(color: AppColors.grey200),
                          ),
                          title: Text(
                            "15 Minutes",
                            style: TextStyle(fontWeight: FontWeight.w500, fontSize: normalFontSize, color: AppColors.textblack),
                          ),
                          subtitle: Text(
                            "For Pause",
                            style: TextStyle(fontSize: smallFontSize, fontWeight: FontWeight.w400, color: AppColors.textblack),
                          ),
                          trailing: IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.circle_outlined,
                              )),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        ListTile(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                            side: BorderSide(color: AppColors.grey200),
                          ),
                          title: Text(
                            "30 Minutes",
                            style: TextStyle(fontWeight: FontWeight.w500, fontSize: normalFontSize, color: AppColors.textblack),
                          ),
                          subtitle: Text(
                            "For Pause",
                            style: TextStyle(fontSize: smallFontSize, fontWeight: FontWeight.w400, color: AppColors.textblack),
                          ),
                          trailing: IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.circle_outlined,
                              )),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        ListTile(
                          title: Text(
                            "45 Minutes",
                            style: TextStyle(fontWeight: FontWeight.w500, fontSize: normalFontSize, color: AppColors.textblack),
                          ),
                          subtitle: Text(
                            "For Pause",
                            style: TextStyle(fontSize: smallFontSize, fontWeight: FontWeight.w400, color: AppColors.textblack),
                          ),
                          trailing: IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.task_alt,
                                color: AppColors.textindigo,
                              )),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                            side: BorderSide(color: AppColors.textindigo),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        ListTile(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                            side: BorderSide(color: AppColors.grey200),
                          ),
                          title: Text(
                            "60 Minutes",
                            style: TextStyle(fontWeight: FontWeight.w500, fontSize: normalFontSize, color: AppColors.textblack),
                          ),
                          subtitle: Text(
                            "For Pause",
                            style: TextStyle(fontSize: smallFontSize, fontWeight: FontWeight.w400, color: AppColors.textblack),
                          ),
                          trailing: IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.circle_outlined,
                              )),
                          onTap: () {},
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        AppButton(text: "Pause Orders", width: double.infinity, height: 50, onClick: () {}),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
