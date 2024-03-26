import 'package:flutter/material.dart';

import '../../../../utility/app_const.dart';
import '../../../../utility/appcolor.dart';
import '../../order_details/order_details.dart';

class OrderListView extends StatelessWidget {
  final String orderId;
  final String customerName;
  final String qty;
  final String itemName;
  final String itemSubName;
  final List item;
  final String status;
  const OrderListView({super.key, required this.orderId, required this.customerName, required this.qty, required this.itemName, required this.itemSubName, required this.item, required this.status});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(width: 1, color: Colors.grey),
          //top: BorderSide(width: 1, color: Colors.grey)
        )
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.25,
            child: ListTile(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>OrderDetail()));
              },
              title: Text(
                "#$orderId",
                style: TextStyle(
                    fontSize: smallFontSize, fontWeight: FontWeight.w400),
              ),
              subtitle: Text(
                "$customerName",
                style: TextStyle(
                    fontSize: normalFontSize, fontWeight: FontWeight.w700),
              ),
            ),
          ),
          Container(
            alignment: Alignment.center,
            height: 60,
            width: 60,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              border: Border.all(width: 1, color: AppColors.grey200)
            ),
            child: Text(
              "$qty",
              style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 14,
                  color: AppColors.textblack),
            ),
          ),
          SizedBox(
            width: 15,
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.35,
            child: ListTile(
              // title: Text(
              //   "$itemSubName",
              //   style: TextStyle(
              //       fontSize: smallFontSize, fontWeight: FontWeight.w400),
              // ),
              subtitle: Text(
                "$itemName",
                style: TextStyle(
                    fontSize: normalFontSize, fontWeight: FontWeight.w700),
              ),
            ),
          ),
          Container(
            alignment: Alignment.center,
            width: MediaQuery.of(context).size.width * 0.30,
            height: 70,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  Icons.access_time_sharp,
                  size: bigFontSize,
                  color: AppColors.textblack,
                ),
                RichText(
                    text: TextSpan(
                        text: "Courier",
                        style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: normalFontSize,
                            color: AppColors.grey100),
                        children: [
                          TextSpan(
                            text: " $status",
                            style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: normalFontSize,
                                color: AppColors.textblack),
                          )
                        ])),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
