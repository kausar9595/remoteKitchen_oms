import 'package:flutter/material.dart';
import 'package:oms/utility/app_const.dart';
import 'package:oms/view/schedule_order/widget/data_table.dart';
import 'package:oms/widget/app_button.dart';
import 'package:oms/widget/app_input.dart';
import 'package:url_launcher/link.dart';

import '../../controller/order_controller.dart';
import '../../controller/restaurant_controller.dart';
import '../../controller/restaurant_controller.dart';
import '../../model/order_model/order_list_model.dart';
import '../../utility/appcolor.dart';
import '../../utility/order_status.dart';
import '../../widget/app_drawer.dart';
import '../../widget/app_shemmer.dart';

class ScheduleOrder extends StatefulWidget {
  const ScheduleOrder({super.key});

  @override
  State<ScheduleOrder> createState() => _ScheduleOrderState();
}

class _ScheduleOrderState extends State<ScheduleOrder> {
  final _search= TextEditingController();


  var _searchText;

  List<OrderResult> _orders = [];
  List<OrderResult> _searchHistory = [];
  bool _isLoading = false;

  Future _getIncomingOrders() async {
    _orders.clear();
    setState(() => _isLoading = true);
    var response = await OrderController.getPendingOrder();
    if (response!.results!.isNotEmpty) {
      for (var i in response!.results!) {
        print("i.status === ${i.status}");
        if (i.status == OrderStatus.schedule && i.status == OrderStatus.accepted) {
          setState(() {
            _orders.add(i);
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
    return SafeArea(child:Scaffold(
      drawer: AppDrawer(
        currentPage: ScheduleOrder(),
      ),
      backgroundColor: Colors.white,
      appBar: AppBar(
        bottom: PreferredSize(
            preferredSize: Size.fromHeight(10.0),
            child: Padding(
              padding: const EdgeInsets.only(left: 20.0,right: 20),
              child: Divider(color: Colors.grey.withOpacity(0.5),),
            )
        ),
        elevation: 0,
        title: Text("Schedule Order",
          style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w600,
              color:AppColors.textblack
          ),
        ),

      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width*0.45,
              child: TextFormField(
                controller: _search,
                decoration: InputDecoration(
                  hintText: "Search Order number, Customer name, or Items",
                  hintStyle: TextStyle(
                      fontSize: smallFontSize,
                      fontWeight: FontWeight.w400,
                      color: AppColors.textblack,
                  ),
                  contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 6),
                  fillColor: Colors.white,
                  filled: true,
                  prefixIcon: Icon(Icons.search,color: AppColors.textblack,),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.grey.withOpacity(0.5),width: 1),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.grey.withOpacity(0.5),width: 1),
                  ),
                  disabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.grey.withOpacity(0.5),width: 1),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.grey.withOpacity(0.5),width: 1),
                  ),
                ),
              ),
            ),
            SizedBox(height: 10,),
            Divider(color: Colors.grey.withOpacity(0.5),
            ),
            SizedBox(height: 20,),


            _isLoading
                ? ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: 10,
                itemBuilder: (_, index){
                  return Container(
                    margin: EdgeInsets.only(bottom: 10),
                    child: AppShimmer(
                      width: MediaQuery.of(context).size.width,
                      height: 50,
                    ),
                  );

                }
            )
                : _orders.isNotEmpty
                ? ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: _orders.length,
                itemBuilder: (_, index){
                  var data = _orders[index];
                  return  ScheduleTable(
                    date: convertPacificTimeZoon(data.modifiedDate.toString()),
                    customerName: "${data.customer}",
                    orderId: "${data.orderId}",
                    itemName: "${data.orderitemSet![0].menuItem!.name}",
                    modifire: "${data.orderitemSet![0].modifiers!.isNotEmpty ?  data.orderitemSet![0].modifiers![0].modifiers!.name!.toString() : ""}",
                    qty: "${data.quantity}",
                    orderPrice: "CA\$${data.total}",
                    buttonColor: Colors.blue.shade100,
                    buttonText: "Schedule",
                  );
                  // return ScheduleTable(
                  //     customerName: data.customer ?? "",
                  //     orderId: data.orderId ?? "",
                  //     qty: data.quantity .toString(),
                  //     itemName: data.orderitemSet![0] != null ? data.orderitemSet![0].menuItem!.name.toString() : "Null",
                  //     modifire: data.orderitemSet![0] != null &&  data.orderitemSet![0].modifiers!.isNotEmpty?  data.orderitemSet![0].modifiers![0].modifiers!.name.toString() : "NUll",
                  //     orderPrice: data.total.toString(),
                  //   buttonColor: Colors.blue.shade200,
                  //   onTap: (){},
                  // );
                }
            )
                : Center(child: Text("Schedule order is empty!"),),
            Divider(color: Colors.grey.withOpacity(0.5),),
            SizedBox(height: 10,),

            
          ],
        ),
      ),
    ));
  }
}


