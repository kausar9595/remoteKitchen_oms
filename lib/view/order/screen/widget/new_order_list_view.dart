import 'package:flutter/material.dart';
import 'package:oms/utility/app_const.dart';

import '../../../../model/order_model/order_list_model.dart';
import '../../../../utility/appcolor.dart';
import '../../../../utility/order_status.dart';
import '../../order_details/order_details.dart';
import '../../order_incoming/order_incoming.dart';

class NewOrdersListView extends StatelessWidget {
  final String title;
  final List<OrderResult> orders;
  final bool isLast;
  final VoidCallback onClick;
  final String btnText;
  final Color btnColor;
  const NewOrdersListView({
    super.key, required this.title, required this.orders, this.isLast =  false, required this.onClick, required this.btnText, required this.btnColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(right: 10),
      decoration: BoxDecoration(
          border: isLast ? Border.all(width: 0, color: Colors.transparent) : Border(
              right: BorderSide(width: 1, color: Colors.grey)
          )
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                height: 40,
                decoration: BoxDecoration(
                    border: Border(
                        bottom: BorderSide(width: 3, color: AppColors.textindigo)
                    )
                ),
                child: Text("$title (${orders.length})",
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 20
                  ),
                ),
              ),

            ],
          ),
          SizedBox(height: 20,),
          Expanded(
            child: ListView.builder(
              itemCount: orders.length,
              itemBuilder: (_, index){
                var data = orders[index];
                return InkWell(
                  onTap: (){
                    if (data.status != OrderStatus.pending) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => OrderDetail(
                                orderResult: data,
                              )));
                    } else {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => OrderIncoming(
                                orderResult: data,
                              )));
                    }
                  },
                  child: Container(
                    padding: const EdgeInsets.only(bottom: 20),
                    margin: const EdgeInsets.only(top: 15, bottom: 10),
                    decoration: const BoxDecoration(
                        border: Border(
                            bottom: BorderSide(width: 1, color: AppColors.grey200)
                        )
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("#${data.orderId}",
                                  style: TextStyle(
                                    fontSize: 10,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                Text("${data.customer}",
                                  style: TextStyle(
                                    fontSize: normalFontSize,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                            Container(
                              height: 30,
                              width: 80,
                              decoration: BoxDecoration(
                                color:  data!.isPaid! ? Colors.lightGreen.shade100 : Colors.red.shade100,
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: data!.isPaid! ? Center(
                                child: Text(
                                  "Paid",
                                ),
                              ) : Center(
                                child: Text(
                                  "Unpaid",

                                ),
                              ) ,
                            )
                          ],
                        ),
                        SizedBox(height: 10,),
                        ListTile(
                          leading: Container(
                            width: 50,
                            height: 50,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100),
                                border: Border.all(width: 1, color: AppColors.grey200)
                            ),
                            child: Center(
                              child: Text("${data.quantity}",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 17
                                ),
                              ),
                            ),
                          ),
                          title: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              data.orderitemSet![0]!.modifiers!.isNotEmpty ? Text("${data.orderitemSet![0]!.modifiers![0].modifiers!.name}",
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.normal
                                ),
                              ) : Center(),
                               Text("Payment: ${data!.paymentMethod}",
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.normal
                                ),
                              ),
                              SizedBox(height: 5,),
                              Text(data.orderitemSet![0].menuItem!.name.toString(),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    fontSize: 17,
                                    fontWeight: FontWeight.bold
                                ),
                              ),
                              SizedBox(height: 10,),
                              InkWell(
                                onTap: onClick,
                                child: Container(
                                  padding: EdgeInsets.all(12),
                                  decoration: BoxDecoration(
                                    color: btnColor,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child:  Center(
                                    child: Text("$btnText"),
                                  ),
                                ),
                              )
                            ],
                          ),
                        )

                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      )
    );
  }
}
