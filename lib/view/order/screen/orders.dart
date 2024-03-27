import 'package:flutter/material.dart';
import 'package:oms/controller/order_controller.dart';
import 'package:oms/controller/restaurant_controller.dart';
import 'package:oms/utility/order_status.dart';
import 'package:oms/view/order/screen/widget/order_list.dart';
import 'package:oms/widget/new_user.dart';

import '../../../model/order_model/order_list_model.dart';
import '../../../widget/app_drawer.dart';
import '../../menus/menus.dart';


class Orders extends StatefulWidget {
  const Orders({super.key});

  @override
  ///
  State<Orders> createState() => _OrdersState();
}

class _OrdersState extends State<Orders> {
  final _key = GlobalKey<ScaffoldState>();

  List<OrderResult> _incomingOrdersList = [];
  List<OrderResult> _readyForDelivered = [];
  List<OrderResult> _cancelledOrderList = [];
  List<OrderResult> _acceptedOrderList = [];
  List<OrderResult> _scheduleOrderList = [];
  bool _isLoading = false;
  _getIncomingOrders()async{
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
      if(i.status == OrderStatus.accepted || i.status == OrderStatus.readyForPickup){
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


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //get location id and restaurant id
    _getLocationAndRestaurantId();
    _getIncomingOrders();

    //store incoming orders into "_incomingOrdersList"


    print("this is order page");
  }

  bool _isNew = true;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child:DefaultTabController(
          length: 4,
          child: Scaffold(
            key: _key,
            drawer: AppDrawer(currentPage: Orders(),),
            appBar: AppBar(
              backgroundColor: Colors.white,
              elevation: 0.5,
              title: Text("Orders",style: TextStyle(fontWeight: FontWeight.w600,color: Colors.black,fontSize: 25),),
              actions:  [
                SizedBox(
                  width: MediaQuery.of(context).size.width*.60,
                  child: TabBar(tabs:[
                    Tab(text: "Incoming (${_incomingOrdersList.length})",),
                    Tab(text: "Competed Today (${_acceptedOrderList.length})",),
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
                    OrderList(orders: _incomingOrdersList, onClick: ()=>_getIncomingOrders(), isLoading: _isLoading,),
                    OrderList(orders: _acceptedOrderList, onClick: () => _getIncomingOrders(), isLoading: _isLoading, isCompleteToday: true,),
                    //OrderList(orders: _readyForDelivered, onClick: () => _getIncomingOrders(), isLoading: _isLoading,),
                    OrderList(orders: _scheduleOrderList, onClick: () => _getIncomingOrders(), isLoading: _isLoading,),
                    OrderList(orders: _cancelledOrderList, onClick: () => _getIncomingOrders(), isLoading: _isLoading,),

            ]),
          ),
        ));
  }

  Future _getLocationAndRestaurantId() async{
    await RestaurantController.getLocationAndRestaurantIds().then((value){
      if(value.locationId!.isNotEmpty && value!.restaurantId!.isNotEmpty){
        setState(() => _isNew = false);
      }
    });
  }
}
