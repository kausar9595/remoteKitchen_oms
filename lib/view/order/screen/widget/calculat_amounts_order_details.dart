import 'package:flutter/material.dart';

import '../../../../model/order_model/order_list_model.dart';
import '../../../../utility/app_const.dart';


class CalculatOrdersAmount extends StatelessWidget {
  final OrderResult orderResult;
  const CalculatOrdersAmount({super.key, required this.orderResult});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        orderResult.discount != 0.0 ? ListTile(
          leading: Text("Discount",
            style: TextStyle(fontWeight: FontWeight.w400,
                fontSize: normalFontSize,color:Colors.black),
          ),
          title: Divider(),
          trailing: Text("(CA\$${orderResult.discount})",
            style: TextStyle(fontWeight: FontWeight.w400,
                fontSize: normalFontSize,color:Colors.black),
          ),
        ) :Center(),
        orderResult.deliveryFee != 0.0 ? ListTile(
          leading: Text("Delivery Fee",
            style: TextStyle(fontWeight: FontWeight.w400,
                fontSize: normalFontSize,color:Colors.black),
          ),
          title: Divider(),
          trailing: Text("CA\$${orderResult.deliveryFee}",
            style: TextStyle(fontWeight: FontWeight.w400,
                fontSize: normalFontSize,color: Colors.black),
          ),
        ) :Center(),
        orderResult.convenienceFee != 0.0 ? ListTile(
          leading: Text("Service Fee",
            style: TextStyle(fontWeight: FontWeight.w400,
                fontSize: normalFontSize,color:Colors.black),
          ),
          title: Divider(),
          trailing: Text("CA\$${orderResult.convenienceFee}",
            style: TextStyle(fontWeight: FontWeight.w400,
                fontSize: normalFontSize,color: Colors.black),
          ),
        ) :Center(),
        orderResult.deliveryDiscount != 0.0 ? ListTile(
          leading: Text("Delivery Discount",
            style: TextStyle(fontWeight: FontWeight.w400,
                fontSize: normalFontSize,color:Colors.black),
          ),
          title: Divider(),
          trailing: Text("(CA\$${orderResult.deliveryDiscount})",
            style: TextStyle(fontWeight: FontWeight.w400,
                fontSize: normalFontSize,color: Colors.black),
          ),
        ) :Center(),

        orderResult.tips != null && orderResult.tips != 0.0 ? ListTile(
          leading: Text("Tips",
            style: TextStyle(fontWeight: FontWeight.w400,
                fontSize: normalFontSize,color:Colors.black),
          ),
          title: Divider(),
          trailing: Text("CA\$${orderResult.tips}",
            style: TextStyle(fontWeight: FontWeight.w400,
                fontSize: normalFontSize,color: Colors.black),
          ),
        ) :Center(),
      ],
    );
  }
}
