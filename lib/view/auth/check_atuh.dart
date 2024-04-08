import 'package:flutter/material.dart';
import 'package:oms/utility/app_const.dart';
import 'package:oms/view/menus/menus.dart';
import 'package:oms/view/order/screen/orders.dart';


class CheckAuth extends StatefulWidget {
  const CheckAuth({super.key});

  @override
  State<CheckAuth> createState() => _CheckAuthState();
}

class _CheckAuthState extends State<CheckAuth> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      body: Column(
        children: [
          Center(
            child: const Text('CheckAuth',style: TextStyle(fontSize:25),),
          ),
          ElevatedButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>Menus()));
          }, child: Text("menus")),
          ElevatedButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>Orders()));
          }, child: Text("orders")),
        ],
      ),

    );
  }
}
