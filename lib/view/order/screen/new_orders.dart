import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:oms/utility/app_const.dart';
import 'package:oms/utility/appcolor.dart';
import 'package:oms/view/order/screen/widget/new_order_list_view.dart';
import 'package:oms/view/setting_screen/widget/app_input.dart';

import '../../../controller/order_controller.dart';
import '../../../controller/restaurant_controller.dart';
import '../../../model/order_model/order_list_model.dart';
import '../../../notifications/notification.dart';
import '../../../utility/order_status.dart';
import '../../../widget/app_drawer.dart';
import '../../../widget/new_user.dart';
import 'orders.dart';

class NewOrderScreen extends StatefulWidget {
  final int? pageIndex;
  const NewOrderScreen({super.key,  this.pageIndex});

  @override
  State<NewOrderScreen> createState() => _NewOrderScreenState();
}

class _NewOrderScreenState extends State<NewOrderScreen> {
  final _key = GlobalKey<ScaffoldState>();

  Timer? _timer;



  List<OrderResult> _incomingOrdersList = [];
  List<OrderResult> _readyForDelivered = [];
  List<OrderResult> _cancelledOrderList = [];
  List<OrderResult> _acceptedOrderList = [];
  List<OrderResult> _scheduleOrderList = [];
  List<OrderResult> _unPaidCash = [];
  bool _isLoading = false;
  Future<void> _getIncomingOrders()async{
    _incomingOrdersList.clear();
    _acceptedOrderList.clear();
    _readyForDelivered.clear();
    _cancelledOrderList.clear();
    _scheduleOrderList.clear();
    _unPaidCash.clear();
    setState(() => _isLoading = true);
    var response = await OrderController.getPendingOrder();
    for(var i in response!.results!){
      if(i.isPaid != true && i.paymentMethod == "cash"){
        setState(() {
          _unPaidCash.add(i);
        });
      }
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

  final _searchController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SafeArea(
      child:Scaffold(
        key: _key,
        drawer: AppDrawer(currentPage: NewOrderScreen(),),
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0.5,
          title: Text("Orders",
            style: TextStyle(fontWeight: FontWeight.w600,color: Colors.black,fontSize: titleFontSize),),
          actions: [
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
                        hintStyle: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.normal
                        ),
                        contentPadding: EdgeInsets.all(20),
                        prefixIcon: Icon(Icons.search, color: Colors.grey,),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(width: 1, color: Colors.grey),
                          borderRadius: BorderRadius.all(Radius.circular(10))
                        ),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(width: 1, color: Colors.blue),
                              borderRadius: BorderRadius.all(Radius.circular(10))
                          ),
                          border: OutlineInputBorder(
                              borderSide: BorderSide(width: 1, color: Colors.grey),
                              borderRadius: BorderRadius.all(Radius.circular(10))
                          )
                      ),
                    )
                  ),
                  SizedBox(width: 30,),
                  ///TODO: Add "No Filter Currently Applied dropdown"

                ],
              ),
            ),
          ),
        ),
        body: _isNew ? NewUser(onClick: (){
          _key.currentState!.openDrawer();
        }, mes: "You are new here. You need to Choose Restaurant & Location")
            :  Container(
          margin: EdgeInsets.only(left: 30, right: 30, top: 20, bottom: 20),
          height: size.height,
          width: size.width,
          child: Row(
            children: [
              Expanded(
                child: NewOrdersListView(
                    title: "Incoming Orders",
                    orders: _incomingOrdersList,
                    onClick: (){},
                    btnText: "Incoming Orders",
                    btnColor: Colors.blue.shade100
                )
              ),
              SizedBox(width: 10,),
              Expanded(
                 child: NewOrdersListView(
                    title: "Preparing",
                    orders: _readyForDelivered,
                    onClick: (){},
                    btnText: "Ready in 13 Mins",
                    btnColor: Colors.greenAccent.shade100
                )
              ),
              SizedBox(width: 10,),
              Expanded(
                  child: NewOrdersListView(
                    isLast: true,
                      title: "Cash Unpaid",
                      orders: _unPaidCash,
                      onClick: (){},
                      btnText: "Unpaid",
                      btnColor: Colors.red.shade100
                  )
              ),
            ],
          ),
        )
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
