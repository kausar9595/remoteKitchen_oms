import 'package:bluetooth_print/bluetooth_print.dart';
import 'package:bluetooth_print/bluetooth_print_model.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:oms/controller/printer_controller.dart';
import 'package:oms/utility/app_const.dart';
import 'package:oms/utility/appcolor.dart';
import 'package:oms/utility/order_status.dart';
import 'package:oms/view/order/order_details/widgets/customer_info.dart';
import 'package:oms/view/order/order_details/widgets/printer_view.dart';
import 'package:oms/view/order/screen/orders.dart';
import 'package:oms/widget/app_alert.dart';
import '../../../controller/order_controller.dart';
import '../../../model/order_model/order_curiar_model.dart';
import '../../../model/order_model/order_list_model.dart';
import '../../under_constraction.dart';

class OrderDetail extends StatefulWidget {
  final OrderResult orderResult;

  const OrderDetail({super.key, required this.orderResult});

  @override
  State<OrderDetail> createState() => _OrderDetailState();
}

class _OrderDetailState extends State<OrderDetail> {

   bool _isScanning = false;

   String currentOrderStatus = "";


   Future<OrderCuriarInfoModel>? getOrderCuriar;




   @override
  void initState() {
    // TODO: implement initState
    super.initState();
    currentOrderStatus = widget.orderResult.status!;

  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      body: Row(
        children: [
          Expanded(
            flex: 1,
              child: CustomerInfo(orderResult: widget.orderResult)
          ),


          Expanded(
            flex: 1,
              child: Container(
                height: MediaQuery.of(context).size.height + 200,
                padding: EdgeInsets.all(15),
                color: Colors.white,
                child: ListView(
                  // mainAxisAlignment: MainAxisAlignment.start,
                 // crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        ///TODO: Uncomment it
                        PrinterViewPage(orderResult: widget.orderResult,),
                        Center(),
                        IconButton(onPressed: (){
                          Navigator.pop(context);
                        }, icon: Icon(Icons.cancel_outlined,color: Colors.black,size: 50,)
                        ),
                      ],
                    ),
                    Divider(),
                    SizedBox(height: 20,),

                    Center(
                      child: Text("${widget.orderResult.quantity} items for ${widget.orderResult.customer}",
                        style: TextStyle(
                            fontSize: titleFontSize,
                            fontWeight: FontWeight.w700,
                            color: AppColors.textblack),
                      ),
                    ),

                    SizedBox(height: 10,),
                    Text("Order Date: ${convertPacificTimeZoon(widget.orderResult.receiveDate)}",
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: normalFontSize
                      ),
                    ),
                    SizedBox(height: 20,),
                    Text("Items",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: titleFontSize,
                      ),
                    ),
                    SizedBox(height: 10,),
                    ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: widget.orderResult.orderitemSet!.length,
                        itemBuilder: (_, index) {
                          var items = widget.orderResult.orderitemSet![index];
                          return  ListTile(
                            leading: Container(
                              alignment: Alignment.center,
                              height: 45,
                              width: 45,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100),
                                color: AppColors.textindigo,
                              ),
                              child: Text("${items.quantity}",
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white,
                                    fontSize: normalFontSize,
                                ),
                              ),
                            ),
                            title: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                              //  items.modifiers!.isEmpty  ? SizedBox(height: 4.5,) : Center(),
                                Text("${items.menuItem!.name}",
                                  style: TextStyle(
                                    fontSize: normalFontSize,
                                    fontWeight: FontWeight.w700,
                                    color: AppColors.textblack,
                                  ),
                                ),
                              ],
                            ),
                            // subtitle: items.modifiers!.isNotEmpty ? Text("${items.modifiers![0]}",
                            //   style: TextStyle(
                            //     fontSize: smallFontSize,
                            //     fontWeight: FontWeight.w700,
                            //     color: AppColors.textblack,
                            //   ),
                            // ) : Center(),
                            trailing: Text("CA\$${items.menuItem!.name}",
                              style: TextStyle(
                                fontSize: normalFontSize,
                                fontWeight: FontWeight.w400,
                                color: AppColors.textblack,
                              ),
                            ),
                          );
                        }
                    ),

                    SizedBox(height: 10,),
                    ListTile(
                      leading: Text("Item Subtotal",
                        style: TextStyle(fontWeight: FontWeight.w400,
                          fontSize: normalFontSize,color: AppColors.textblack,
                        ),
                      ),
                      title: Divider(),
                      trailing: Text("CA\$${widget.orderResult.subtotal}",
                        style: TextStyle(fontSize: normalFontSize,
                          fontWeight: FontWeight.w400,color: AppColors.textblack,
                        ),
                      ),
                    ),
                    ListTile(
                      leading: Text("Tax",
                        style: TextStyle(fontWeight: FontWeight.w400,
                            fontSize: normalFontSize,color:AppColors.textblack),
                      ),
                      title: Divider(),
                      trailing: Text("CA\$${widget.orderResult.tax}",
                        style: TextStyle(fontWeight: FontWeight.w400,
                            fontSize: normalFontSize,color:AppColors.textblack),
                      ),
                    ),
                    Divider(),
                    ListTile(
                      leading: Text("Total",
                        style: TextStyle(fontWeight: FontWeight.w400,
                            fontSize: normalFontSize,color:AppColors.textblack),
                      ),
                      title: Divider(),
                      trailing: Text("CA\$${widget.orderResult.total}",
                        style: TextStyle(fontWeight: FontWeight.w400,
                            fontSize: normalFontSize,color:AppColors.textblack),
                      ),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height*0.1,),
                      currentOrderStatus == OrderStatus.rider_confirmed
                       ? StatusButton(
                           onClick: (){
                           },
                           text: "Rider Confirm",
                           bgColor:AppColors.textindigo,
                         ) : currentOrderStatus == OrderStatus.rider_confirmed_pickup_arrival
                       ?StatusButton(
                           onClick: (){
                           },
                           text: "Rider Confirm the Pickup",
                           bgColor:AppColors.textindigo,
                         ) : currentOrderStatus == OrderStatus.rider_confirmed_dropoff_arrival
                       ? StatusButton(
                         onClick: (){
                         },
                         text: "Rider Confirm the Order",
                         bgColor:AppColors.textindigo,
                       ) : currentOrderStatus == OrderStatus.rider_confirmed
                       ? StatusButton(
                           onClick: (){
                           },
                           text: "Rider Confirm the Order",
                           bgColor:AppColors.textindigo,
                         ) : currentOrderStatus == OrderStatus.completed
                       ? StatusButton(
                         onClick: (){
                         },
                         text: "Order Delivered",
                         bgColor: Colors.green,
                       )
                        : currentOrderStatus == OrderStatus.cancelled
                       ?  StatusButton(
                           onClick: (){
                           },
                           text: "Order Cancelled",
                           bgColor: Colors.red,
                         ) : currentOrderStatus == OrderStatus.readyForPickup || currentOrderStatus == OrderStatus.schedule && widget.orderResult.orderMethod == "pickup"
                       ? StatusButton(
                         onClick: (){
                           appPopup(
                               context: context,
                               id: widget.orderResult!.id.toString(),
                               title: "Are you sure?",
                               child: const Text("Are you sure? This order is Delivered?"),
                               okClick: ()=> orderStatusChange(OrderStatus.completed)
                           );
                         },
                         text: "Order Delivered",
                         bgColor: Colors.green,
                   ) :  Column(
                         children: [
                           StatusButton(
                             onClick: (){
                               appPopup(
                                   context: context,
                                   id: widget.orderResult!.id.toString(),
                                   title: "Are you sure?",
                                   child: Text("Are you sure? Your order is Ready for Pickup?"),
                                   okClick: ()=> orderStatusChange(OrderStatus.readyForPickup)
                               );
                             },
                             text: "Mark as Ready",
                             bgColor:AppColors.textindigo,
                           ),
                           SizedBox(height: 10,),
                           StatusButton(
                             onClick: (){
                               appPopup(
                                   context: context,
                                   id: widget.orderResult!.id.toString(),
                                   title: "Are you sure?",
                                   child: Text("Are you sure? You want to Cancelled this order?"),
                                   okClick: ()=> orderStatusChange(OrderStatus.cancelled)
                               );
                             },
                             text: "Cancel Order",
                             bgColor: AppColors.textred,
                           ),
                         ],
                       )
                  ],
                ),
              ),
          ),
        ],
      ),
    ));
  }


  orderStatusChange(status) async{
     appLoading(context);
      await OrderController.changeStatus(widget.orderResult.id.toString(), status).then((value) {
        if(value.statusCode == 200){
          setState(() => currentOrderStatus = status);
          if(status == OrderStatus.cancelled){
            AppSnackBar(context, "Order has been cancelled", Colors.green);
            Navigator.push(context, MaterialPageRoute(builder: (context)=> Orders(pageIndex: 3,)));

          } else if(status == OrderStatus.completed){

            AppSnackBar(context, "Order has been Delivered", Colors.green);
            Navigator.push(context, MaterialPageRoute(builder: (context)=> Orders(pageIndex: 1,)));
          }else{
            AppSnackBar(context, "Order has been Delivered", Colors.green);
            Navigator.push(context, MaterialPageRoute(builder: (context)=> Orders(pageIndex: 1,)));
          }

        }else{
          AppSnackBar(context, "Getting some issues to Accept this order.", Colors.red);
          Navigator.pop(context);
        }
      });
  }
}

class StatusButton extends StatelessWidget {
  final String text;
  final Color bgColor;
  final VoidCallback onClick;
  const StatusButton({
    super.key, required this.text, required this.bgColor, required this.onClick,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onClick,
      child: Container(
        alignment: Alignment.center,
        height: MediaQuery.of(context).size.height*0.08,
        width: MediaQuery.of(context).size.width*0.80,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: bgColor,
        ),
        child: Text("${text}",
          style: TextStyle(fontSize: titleFontSize,fontWeight: FontWeight.w600,color: Colors.white),),
      ),
    );
  }
}

