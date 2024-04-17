import 'package:flutter/material.dart';

import '../utility/app_const.dart';
import '../widget/app_drawer.dart';
import 'order/screen/orders.dart';


class UnderConstractions extends StatefulWidget {
  const UnderConstractions({super.key});

  @override
  State<UnderConstractions> createState() => _UnderConstractionsState();
}

class _UnderConstractionsState extends State<UnderConstractions> {
  @override
  Widget build(BuildContext context) {
    final _key = GlobalKey<ScaffoldState>();

    return SafeArea(
      child:Scaffold(
        key: _key,
        drawer: AppDrawer(currentPage: UnderConstractions(),),
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0.5,
          title: Text("Under Constructions",
            style: TextStyle(fontWeight: FontWeight.w600,color: Colors.black,fontSize: titleFontSize),),
        ),
        body: Center(
          child: Text("Under Constructions",
            style: TextStyle(
              fontWeight: FontWeight.w600,
              color: Colors.red,
              fontSize: 15,
              fontStyle: FontStyle.italic

            ),
          ),
        )
      ),

    );
  }
}
