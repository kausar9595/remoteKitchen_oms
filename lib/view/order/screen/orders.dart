import 'package:flutter/material.dart';
import 'package:oms/view/order/screen/widget/incoming_order.dart';

import '../../../widget/app_drawer.dart';
import '../../menus/menus.dart';


class Orders extends StatefulWidget {
  const Orders({super.key});

  @override
  ///
  State<Orders> createState() => _OrdersState();
}

class _OrdersState extends State<Orders> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print("this is order page");
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(child:DefaultTabController(
      length: 3,
      child: Scaffold(
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
        body: TabBarView(children:[
          IncomingOrder(),
          IncomingOrder(),
          IncomingOrder(),

        ]),
      ),
    ));
  }
}
