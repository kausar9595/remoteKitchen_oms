import 'dart:async';

import 'package:flutter/material.dart';
import 'package:oms/controller/order_controller.dart';
import 'package:oms/controller/restaurant_controller.dart';
import 'package:oms/utility/app_const.dart';
import 'package:oms/utility/order_status.dart';
import 'package:oms/view/order/screen/widget/order_list.dart';
import 'package:oms/view/printer/printer_page.dart';
import 'package:oms/widget/new_user.dart';

import '../../../model/order_model/order_list_model.dart';
import '../../../notifications/notification.dart';
import '../../../widget/app_drawer.dart';
import '../../menus/menus.dart';


class Orders extends StatefulWidget {
  final int pageIndex;
  const Orders({super.key,  this.pageIndex = 0});

  @override
  ///
  State<Orders> createState() => _OrdersState();
}

class _OrdersState extends State<Orders> {
  final _key = GlobalKey<ScaffoldState>();

  Timer? _timer;



  List<OrderResult> _incomingOrdersList = [];
  List<OrderResult> _readyForDelivered = [];
  List<OrderResult> _cancelledOrderList = [];
  List<OrderResult> _acceptedOrderList = [];
  List<OrderResult> _scheduleOrderList = [];
  bool _isLoading = false;
  Future<void> _getIncomingOrders()async{
    _incomingOrdersList.clear();
    _acceptedOrderList.clear();
    _readyForDelivered.clear();
    _cancelledOrderList.clear();
    _scheduleOrderList.clear();
    setState(() => _isLoading = true);
    var response = await OrderController.getPendingOrder();
    for(var i in response!.results!){
      if(i.status == OrderStatus.pending){
        setState(() {
          _incomingOrdersList.add(i);
        });
      }
      if(i.status == OrderStatus.cancelled){
        setState(() {
          _cancelledOrderList.add(i);
        });
      }
      if(i.status == OrderStatus.accepted || i.status == OrderStatus.readyForPickup || i.status == OrderStatus.completed){
        setState(() {
          _acceptedOrderList.add(i);
        });
      }
      if(i.status == OrderStatus.schedule){
        setState(() {
          _scheduleOrderList.add(i);
        });
      }
      if(i.status == OrderStatus.readyForPickup){
        setState(() {
          _readyForDelivered.add(i);
        });
      }

    }
    setState(() => _isLoading = false);

  }


  void withoutLoadingOrderLoad()async{
    _incomingOrdersList.clear();
    _scheduleOrderList.clear();
    _cancelledOrderList.clear();
    _readyForDelivered.clear();
    _acceptedOrderList.clear();
    var response = await OrderController.getPendingOrder();
    for(var i in response!.results!){
      if(i.status == OrderStatus.pending){
        setState(() {
          _incomingOrdersList.add(i);
        });
      }
      if(i.status == OrderStatus.cancelled){
        setState(() {
          _cancelledOrderList.add(i);
        });
      }
      if(i.status == OrderStatus.accepted || i.status == OrderStatus.readyForPickup || i.status == OrderStatus.completed){
        setState(() {
          _acceptedOrderList.add(i);
        });
      }
      if(i.status == OrderStatus.schedule){
        setState(() {
          _scheduleOrderList.add(i);
        });
      }
      if(i.status == OrderStatus.readyForPickup){
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

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child:DefaultTabController(
          length: 4,
          initialIndex: widget.pageIndex,
          child: Scaffold(
            key: _key,
            drawer: AppDrawer(currentPage: Orders(),),
            appBar: AppBar(
              backgroundColor: Colors.white,
              elevation: 0.5,
              title: Text("Orders",
                style: TextStyle(fontWeight: FontWeight.w600,color: Colors.black,fontSize: titleFontSize),),
              actions:  [
                SizedBox(
                  width: MediaQuery.of(context).size.width*.60,
                  child: TabBar(tabs:[
                    Tab(text: "Incoming (${_incomingOrdersList.length})",),
                    Tab(text: "Active Orders (${_acceptedOrderList.length})",),
                    //Tab(text: "Pickup Orders",),
                    Tab(text: "Scheduled Orders",),
                    Tab(text: "Canceled Orders",),
                  ]),
                )
              ],
            ),
            body: _isNew ? NewUser(onClick: (){
              _key.currentState!.openDrawer();
            }, mes: "You are new here. You need to Choose Restaurant & Location")
                : TabBarView(children:[
                    OrderList(orders: _incomingOrdersList, onClick: ()=>_getIncomingOrders(), onRefresh: ()=>_getIncomingOrders(), isLoading: _isLoading,),
                    OrderList(orders: _acceptedOrderList, onClick: () => _getIncomingOrders(), onRefresh: ()=>_getIncomingOrders(), isLoading: _isLoading, isCompleteToday: true,),
                    //OrderList(orders: _readyForDelivered, onClick: () => _getIncomingOrders(), isLoading: _isLoading,),
                    OrderList(orders: _scheduleOrderList, onClick: () => _getIncomingOrders(), onRefresh: ()=>_getIncomingOrders(), isLoading: _isLoading,),
                    OrderList(orders: _cancelledOrderList, onClick: () => _getIncomingOrders(), onRefresh: ()=>_getIncomingOrders(), isLoading: _isLoading,),

            ],
            ),
          ),
        ),

    );
  }

  Future _getLocationAndRestaurantId() async{
    await RestaurantController.getLocationAndRestaurantIds().then((value){
      print("value.locationId == ${value.locationId}");
      if(value.locationId == "null" && value.restaurantId == "null"){
        setState(() => _isNew = true);
      }else{
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
}
