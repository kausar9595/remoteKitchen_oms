
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:oms/utility/app_const.dart';
import 'package:oms/utility/appcolor.dart';
import 'package:oms/utility/order_status.dart';
import 'package:oms/view/order/order_details/widgets/custom_popup.dart';
import 'package:oms/view/order/order_details/widgets/customer_info.dart';
import 'package:oms/view/order/order_details/widgets/printer_view.dart';
import 'package:oms/view/order/screen/new_orders.dart';
import 'package:oms/widget/app_alert.dart';
import 'package:oms/widget/app_button.dart';
import '../../../controller/order_controller.dart';
import '../../../model/order_model/order_curiar_model.dart';
import '../../../model/order_model/order_list_model.dart';
import '../../../utility/appcolor.dart';
import '../screen/widget/calculat_amounts_order_details.dart';

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

   final modefires = <Widget>[];





   @override
  void initState() {
    // TODO: implement initState
    super.initState();
    currentOrderStatus = widget.orderResult.status!;

  }
   int _quantity = 0;

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

                        AppButton(
                          bgColor: AppColors.adjbutton,
                            text: "Adjust Order",
                            fontSize: normalFontSize,
                            width: 110,
                            height: 60,
                            onClick: (){
                            _adjustBuilder(context);

                            },
                        ),

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
                          //add modifires
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
                            subtitle: items.modifiers!.isNotEmpty
                                ? ListView(
                              physics: NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              children: List.generate(items.modifiers!.length, (modifires) {
                                  return  ListView.builder(
                                    shrinkWrap: true,
                                    physics: NeverScrollableScrollPhysics(),
                                    itemCount: items.modifiers![modifires].modifiersItems!.length,
                                    itemBuilder: (_, modifiarItem){
                                      return Row(
                                        //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text("${items.modifiers![modifires].modifiersItems![modifiarItem].modifiersOrderItems!.name}",
                                            style: TextStyle(
                                              fontSize: 13,
                                              fontWeight: FontWeight.w400,
                                              color: AppColors.textblack,
                                            ),
                                          ),
                                          SizedBox(width: 10,),
                                          Text("(CA\$${items.modifiers![modifires].modifiersItems![modifiarItem].modifiersOrderItems!.basePrice})",
                                            style: TextStyle(
                                              fontSize: 13,
                                              fontWeight: FontWeight.w600,
                                              color: AppColors.textblack,
                                            ),
                                          ),
                                        ],
                                      );
                                    },
                                  );
                              }),
                            )

                                : Center(),
                            trailing: Text("CA\$${items.menuItem!.basePrice}",
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

                    CalculatOrdersAmount(orderResult: widget.orderResult),

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
                                   okClick: ()=> orderStatusChange(OrderStatus.completed)
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
            Navigator.push(context, MaterialPageRoute(builder: (context)=> NewOrderScreen()));

          } else if(status == OrderStatus.completed){

            AppSnackBar(context, "Order has been Delivered", Colors.green);
            Navigator.push(context, MaterialPageRoute(builder: (context)=> NewOrderScreen()));
          }else{
            AppSnackBar(context, "Order has been Delivered", Colors.green);
            Navigator.push(context, MaterialPageRoute(builder: (context)=> NewOrderScreen()));
          }

        }else{
          AppSnackBar(context, "Getting some issues to Accept this order.", Colors.red);
          Navigator.pop(context);
        }
      });
  }

   /*---Adjust Order---*/
    Future<void>_adjustBuilder(BuildContext context)async{
      return showDialog(barrierDismissible:false,context: context, builder: (context){
        return Container(
          height: 300,
          child: AlertDialog(
            insetPadding: EdgeInsets.only(bottom: 20,top: 10),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            content: Container(
              height: MediaQuery.of(context).size.height*0.40,
              width: MediaQuery.of(context).size.width * 0.30,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Adjust Order",
                        style: TextStyle(fontSize: titleFontSize,
                          fontWeight: FontWeight.w600,
                          color: AppColors.textblack,
                        ),
                      ),
                      SizedBox(height: 20,),
                      Align(
                        alignment: Alignment.topRight,
                        child: IconButton(onPressed: (){
                          Navigator.pop(context);
                        }, icon: Icon(Icons.cancel_outlined,color: Colors.red,size: 30,),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10,),
                  ListTile(
                    leading: Icon(Icons.cancel_outlined,color: AppColors.textblack,),
                    title: Text("Can’t Complete Instruction",
                      style: TextStyle(fontSize: normalFontSize,fontWeight: FontWeight.w600,color:AppColors.textblack),
                    ),
                    trailing: Icon(Icons.arrow_forward_ios_sharp,color: AppColors.textblack,),
                    onTap: (){Navigator.pop(context);},
                  ),
                  ListTile(
                    leading: Icon(Icons.monetization_on_outlined,color: AppColors.textblack,),
                    title: Text("Update Price",
                      style: TextStyle(fontSize: normalFontSize,fontWeight: FontWeight.w600,color: AppColors.textblack),
                    ),
                    trailing: Icon(Icons.arrow_forward_ios_sharp,color: AppColors.textblack,),
                    onTap: (){
                      Navigator.pop(context);
                      CustomPopup(context: context,
                          Texttitle: Column(
                            children: [
                              Text("Update Price",
                                style: TextStyle(fontWeight: FontWeight.w600,fontSize: titleFontSize,color: AppColors.textblack),
                              ),
                            ],
                          ),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("Current subtotal",
                                    style: TextStyle(fontSize: normalFontSize,color: AppColors.textblack,fontWeight: FontWeight.w400),
                                  ),
                                  Text("CA \$23.47",
                                    style: TextStyle(fontSize: normalFontSize,color: AppColors.textblack,fontWeight: FontWeight.w400),
                                  ),

                                ],
                              ),
                              SizedBox(height: 30,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("Price Adjust",
                                    style: TextStyle(fontSize: normalFontSize,fontWeight: FontWeight.w400,color: AppColors.textblack),),
                                  Container(
                                    padding: EdgeInsets.only(left: 20,right: 20,top: 10,bottom: 10),
                                  alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8),
                                      color: Colors.grey.shade300,
                                    ),

                                    child: Center(
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          InkWell(
                                            onTap:(){
                                              setState(() {
                                                _quantity++;
                                              });
                                            },
                                            child: Container(
                                              height: 30,
                                              width: 30,
                                              decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                border:Border.all(color: AppColors.textblack,width: 1),
                                              ),
                                              child: Center(child: Icon(Icons.add,size: 15,color: Colors.black,)),
                                            ),
                                          ),
                                          SizedBox(width: 20,),
                                          Padding(
                                            padding: const EdgeInsets.all(5.0),
                                            child: Text("${_quantity}",
                                              style: TextStyle(fontSize: normalFontSize,fontWeight: FontWeight.w600,color: AppColors.textblack),
                                            ),
                                          ),
                                          SizedBox(width: 20,),
                                          InkWell(
                                            onTap:(){
                                              setState(() {
                                                _quantity--;
                                              });
                                            },
                                            child: Container(
                                              height: 30,
                                              width: 30,
                                              decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                border:Border.all(color: AppColors.textblack,width: 1),
                                              ),
                                              child: Center(child: Icon(Icons.remove,size: 15,color: Colors.black,)),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              SizedBox(height: 40,),
                              AppButton(
                                  text: "Continue",
                                  width: 260,
                                  height: 40,
                                  bgColor: AppColors.popupbutton,
                                  onClick: (){})

                            ],
                          ),
                      );
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.access_time_sharp,color: AppColors.textblack,),
                    title: Text("Update Ready Time",
                      style: TextStyle(fontSize: normalFontSize,fontWeight: FontWeight.w600,color: AppColors.textblack),
                    ),
                    trailing: Icon(Icons.arrow_forward_ios_sharp,color:AppColors.textblack,),
                    onTap: (){
                       Navigator.pop(context);
                       CustomPopup(
                           context: context,
                           Texttitle: Center(
                             child: Text("Ready Time",
                               style: TextStyle(fontWeight: FontWeight.w600,fontSize: titleFontSize,color: AppColors.textblack),
                             ),
                           ),

                           child: Column(
                           children: [
                             Text("A delivery person will pickup\n the order around the\n time the order is Ready",
                               style: TextStyle(
                                 fontSize: normalFontSize,
                                 fontWeight: FontWeight.w400,
                                 color: AppColors.textblack,
                               ),
                             ),
                             SizedBox(height: 20,),
                             SizedBox(
                               child: Row(
                                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                 children: [
                                   InkWell(
                                     onTap:(){
                                       setState(() {
                                         _quantity++;
                                       });
                                     },
                                     child: Container(
                                       height: 30,
                                       width: 30,
                                       decoration: BoxDecoration(
                                         shape: BoxShape.circle,
                                         border:Border.all(color: AppColors.textblack,width: 2),
                                       ),
                                       child: Center(child: Icon(Icons.add,size: 18,color: Colors.black,)),
                                     ),
                                   ),
                                   Text("${_quantity} MIN",
                                     style: TextStyle(fontSize: titleFontSize,fontWeight: FontWeight.w600,color: AppColors.textblack),
                                   ),
                                   InkWell(
                                     onTap:(){
                                       setState(() {
                                         _quantity--;
                                       });
                                     },
                                     child: Container(
                                       height: 30,
                                       width: 30,
                                       decoration: BoxDecoration(
                                         shape: BoxShape.circle,
                                         border:Border.all(color: AppColors.textblack,width: 2),
                                       ),
                                       child: Center(child: Icon(Icons.remove,size: 18,color: Colors.black,)),
                                     ),
                                   ),
                                 ],
                               ),
                             ),
                             SizedBox(height: 35,),
                             AppButton(
                                 text: "Ready",
                                 width: 260,
                                 height: 40,
                                 bgColor: AppColors.popupbutton,
                                 onClick: (){},
                             ),
                           ],
                                                        ),
                       );

                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.phone,color: AppColors.textblack,),
                    title: Text("Call Customer Or Support",
                      style: TextStyle(fontSize: normalFontSize,fontWeight: FontWeight.w600,color: AppColors.textblack),
                    ),
                    trailing: Icon(Icons.arrow_forward_ios_sharp,color:AppColors.textblack,),
                    onTap: (){
                      Navigator.pop(context);
                      CustomPopup(
                          context: context,
                          Texttitle: Center(child: Text("Call",
                            style: TextStyle(fontWeight: FontWeight.w600,fontSize: titleFontSize,color: AppColors.textblack),),),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                height: 60,
                                width: 300,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(25),
                                  border: Border.all(color: AppColors.textindigo),
                                ),
                                child: Center(child: Text("Customer : ( Customer Number)",
                                  style: TextStyle(fontSize: normalFontSize,fontWeight: FontWeight.w500,color: AppColors.textindigo),
                                ),
                                ),
                              ),
                              SizedBox(height: 10,),
                              Container(
                                height: 60,
                                width: 300,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(25),
                                  border: Border.all(color: AppColors.textindigo),
                                ),
                                child: Center(child: Text("Support Centre : +1 236-239-6988",
                                  style: TextStyle(fontSize: normalFontSize,fontWeight: FontWeight.w500,color: AppColors.textindigo),
                                ),
                                ),
                              ),
                            ],
                          ),
                      );
                    },
                  ),

                ],
              ),
            ),

          ),
        );
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

