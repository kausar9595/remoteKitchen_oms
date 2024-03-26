import 'package:flutter/material.dart';
import 'package:oms/view/order/screen/widget/incoming_order.dart';

import '../../../widget/app_drawer.dart';
import '../../../widget/new_user.dart';
import '../../menus/menus.dart';


class Orders extends StatefulWidget {
  const Orders({super.key});

  @override
  ///
  State<Orders> createState() => _OrdersState();
}

class _OrdersState extends State<Orders> {

  final GlobalKey<ScaffoldState> _key = GlobalKey<ScaffoldState>();


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print("this is order page");
  }

  bool _isEmpty = true;

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
        body: _isEmpty ? NewUser(
          onClick: (){
            _key.currentState!.openDrawer();
          },
          mes: "You are new here. Please select Restaurant and Location to get Orders",
        ) : TabBarView(children:[
          IncomingOrder(),
          IncomingOrder(),
          IncomingOrder(),

        ]),
      ),
    ));
  }
}
