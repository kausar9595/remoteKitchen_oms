import 'package:flutter/material.dart';
import 'package:oms/utility/order_status.dart';

import '../../../../model/order_model/order_list_model.dart';
import '../../../../utility/app_const.dart';
import '../../../../utility/appcolor.dart';
import '../../order_details/order_details.dart';
import '../../order_incoming/order_incoming.dart';

class OrderListView extends StatelessWidget {
  final String orderId;
  final String customerName;
  final String qty;
  final String itemName;
  final String orderType;
  final OrderResult orderInfo;
  final String status;
  final bool fromOrderIncoming;
  const OrderListView({super.key, required this.orderId, required this.customerName, required this.qty, required this.itemName, required this.orderType, required this.orderInfo, required this.status, this.fromOrderIncoming = false});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        if(status != OrderStatus.pending){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>OrderDetail(orderResult: orderInfo,)));
        }else{
          Navigator.push(context, MaterialPageRoute(builder: (context)=>OrderIncoming(orderResult: orderInfo,)));
        }


      },
      child: Container(
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(width: 1, color: Colors.grey),
            //top: BorderSide(width: 1, color: Colors.grey)
          )
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.25,
              child: ListTile(
                title: Text(
                  "#$orderId",
                  style: TextStyle(
                      fontSize: smallFontSize, fontWeight: FontWeight.w400),
                ),
                subtitle: Text(
                  "$customerName",
                  style: TextStyle(
                      fontSize: titleFontSize, fontWeight: FontWeight.w700),
                ),
              ),
            ),
            Container(
              alignment: Alignment.center,
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                border: Border.all(width: 1, color: AppColors.grey200)
              ),
              child: Text(
                "$qty",
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: normalFontSize,
                    color: AppColors.textblack),
              ),
            ),
            SizedBox(
              width: 15,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.35,
              child: ListTile(
                // title: Row(
                //   children: [
                //     Container(
                //       width: 150,
                //       padding: EdgeInsets.only(left: 10, right: 10, top: 7, bottom: 7),
                //       decoration: BoxDecoration(
                //         borderRadius: BorderRadius.circular(100),
                //         border: Border.all(width: 1, color: AppColors.grey200)
                //       ),
                //       child: Text(
                //         "$orderType - Order",
                //         style: TextStyle(
                //             fontSize: smallFontSize, fontWeight: FontWeight.w600),
                //       ),
                //     ),
                //     SizedBox()
                //   ],
                // ),
                title: Text(
                  itemName.isNotEmpty ? itemName : "No title",
                  style: TextStyle(
                      fontSize: titleFontSize, fontWeight: FontWeight.w700),
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
                                  fontSize: titleFontSize,
                                  color: AppColors.textblack),
                            )
                          ])),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
