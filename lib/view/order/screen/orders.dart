import 'package:flutter/material.dart';
import 'package:oms/controller/order_controller.dart';
import 'package:oms/controller/restaurant_controller.dart';
import 'package:oms/view/order/screen/widget/incoming_order.dart';
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
  bool _isLoading = false;
  _getIncomingOrders()async{
    setState(() => _isLoading = true);
    var response = await OrderController.getPendingOrder();
    for(var i in response!.results!){
      setState(() {
        _incomingOrdersList.add(i);
      });
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
    return SafeArea(child:DefaultTabController(
      length: 3,
      child: Scaffold(
        key: _key,
        drawer: AppDrawer(currentPage: Orders(),),
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0.5,
          title: Text("Orders",style: TextStyle(fontWeight: FontWeight.w600,color: Colors.black,fontSize: 25),),
          actions: [
            SizedBox(
              width: 600,
              child: TabBar(tabs:[
                Tab(text: "Incoming (10)",),
                Tab(text: "Competed Today (0)",),
                Tab(text: "Scheduled Orders",),
              ]),
            )

          ],
        ),
        body: _isNew ? NewUser(onClick: (){
          _key.currentState!.openDrawer();
        }, mes: "You are new here. You need to Choose Restaurant & Location") : TabBarView(children:[
          IncomingOrder(orders: _incomingOrdersList, onClick: ()=>_getIncomingOrders(), isLoading: _isLoading,),
          IncomingOrder(orders: _incomingOrdersList, onClick: () {  }, isLoading: _isLoading,),
          IncomingOrder(orders: _incomingOrdersList, onClick: () {  }, isLoading: _isLoading,),

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
