import 'package:flutter/material.dart';
import 'package:oms/view/order/screen/widget/incoming_order.dart';


class Orders extends StatefulWidget {
  const Orders({super.key});

  @override
  ///
  State<Orders> createState() => _OrdersState();
}

class _OrdersState extends State<Orders> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(child:DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0.5,
          leading: Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child: IconButton(onPressed: (){}, icon: Icon(Icons.menu,size: 30,color: Colors.black,)),
          ),
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
