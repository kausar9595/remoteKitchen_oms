import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:oms/utility/app_const.dart';
import 'package:oms/utility/appcolor.dart';
import 'package:oms/utility/order_status.dart';
import 'package:oms/view/order/screen/orders.dart';
import 'package:oms/widget/app_alert.dart';
import 'package:shimmer/shimmer.dart';
import '../../../controller/order_controller.dart';
import '../../../model/order_model/order_curiar_model.dart';
import '../../../model/order_model/order_list_model.dart';

class OrderDetail extends StatefulWidget {
  final OrderResult orderResult;

  const OrderDetail({super.key, required this.orderResult});

  @override
  State<OrderDetail> createState() => _OrderDetailState();
}

class _OrderDetailState extends State<OrderDetail> {
   bool _iscustomer = true;
   bool _iscourier = false;
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
              child: Container(
                alignment: Alignment.center,
                width: double.infinity,
                color: AppColors.textblack,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: 20,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        InkWell(
                          onTap: (){
                            setState(() {
                              _iscustomer = true;
                              _iscourier = false;
                            });
                          },
                          child: Container(
                            alignment: Alignment.center,
                            height: MediaQuery.of(context).size.height*0.08,
                            width: MediaQuery.of(context).size.width*0.12,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color:_iscustomer?AppColors.Customerbuttom:AppColors.textblack,
                            ),
                            child:  Text("Customer",
                              style:TextStyle(
                                fontSize: normalFontSize,
                                fontWeight: FontWeight.w700,
                                color: Colors.white,),
                            ),
                          ),
                        ),

                        ///TODO: Uncomment it
                        widget.orderResult.orderMethod == "delivery" ? InkWell(
                          onTap: (){
                            setState(() {
                              _iscustomer = false;
                              _iscourier = true;
                            });
                          },
                          child: Container(
                            alignment: Alignment.center,
                            height: MediaQuery.of(context).size.height*0.08,
                            width: MediaQuery.of(context).size.width*0.12,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color:_iscourier?AppColors.Customerbuttom:AppColors.textblack,
                            ),
                            child: Text("Courier",
                              style:TextStyle(
                                fontSize: normalFontSize,
                                fontWeight: FontWeight.w700,
                                color: Colors.white,),
                            ),
                          ),
                        ) : Center(),

                      ],
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height*0.20,
                    ),
                    _iscustomer ? UserInfo(
                      orderResult: widget.orderResult,
                      address: " ${widget.orderResult.pickupAddress}",
                      phone: " ",
                      amount: widget.orderResult.total!.toString(),
                      isCurirar: _iscourier,
                      name: widget.orderResult.customer!,
                      orderMethod: widget.orderResult.orderMethod.toString(),
                    ) : widget.orderResult.orderMethod == "delivery" ?  FutureBuilder<OrderCuriarInfoModel>(
                      future: OrderController.geteCuriarInfo(widget.orderResult.id.toString()),
                      builder: (context, snapshot) {
                        if(snapshot.connectionState == ConnectionState.waiting){
                          return Center(child: CircularProgressIndicator(color: Colors.white,),);
                        }else if(snapshot.hasData){
                          return  UserInfo(
                            orderResult: widget.orderResult,
                            address: " ${snapshot.data!.dropoffAddress}",
                            phone: snapshot.data!.dasherDropoffPhoneNumber.toString(),
                            amount: widget.orderResult.total!.toString(),
                            isCurirar: _iscourier,
                            name: snapshot.data!.dasherName.toString(),
                            orderMethod: widget.orderResult.orderMethod.toString(),

                          );
                        }else{
                          return const Center(child: Text("No courier data found"),);
                        }
                      }
                    ) : Center()
                  ],
                ),
              ),
          ),


          Expanded(
            flex: 1,
              child: SingleChildScrollView(
                child: Container(
                  height: MediaQuery.of(context).size.height,
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
                          // Container(
                          //   alignment: Alignment.center,
                          //   height: MediaQuery.of(context).size.height*0.07,
                          //   width: MediaQuery.of(context).size.width*0.20,
                          //   decoration: BoxDecoration(
                          //     borderRadius: BorderRadius.circular(10),
                          //     color: Colors.white,
                          //     border: Border.all(color: Colors.grey),
                          //   ),
                          //   child:  DropdownButton<String>(
                          //     icon: Icon(Icons.keyboard_arrow_down_rounded,size: 35,color: Colors.black,),
                          //     elevation: 0,
                          //     underline:Container(
                          //       decoration: BoxDecoration(
                          //         border: Border(bottom: BorderSide.none),
                          //       ),
                          //     ),
                          //     hint: Row(
                          //       children: [
                          //         Icon(Icons.print,color: Colors.black,size: 35,),
                          //         SizedBox(height: 5,),
                          //         Text("Reprint Ticket",
                          //           style: TextStyle(
                          //             fontWeight: FontWeight.w400,
                          //             fontSize: smallFontSize,
                          //             color: AppColors.textblack,
                          //           ),),
                          //         SizedBox(height: 10,),
                          //       ],
                          //     ),
                          //     items: <String>['Print - A', 'Printer - B', 'Printer - C', 'Printer - D'].map((String value) {
                          //       return DropdownMenuItem<String>(
                          //         value: value,
                          //         child: Text(value),
                          //       );
                          //     }).toList(),
                          //     onChanged: (_) {},
                          //   ),
                          // ),
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
                              fontSize: 25,
                              fontWeight: FontWeight.w700,
                              color: AppColors.textblack),
                        ),
                      ),
                      SizedBox(height: 20,),
                      Text("Items",
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 18,
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
                                  style: TextStyle(fontWeight: FontWeight.w500,color: Colors.white,fontSize: 16),
                                ),
                              ),
                              title: Text("${items.itemName}",
                                style: TextStyle(
                                  fontSize: normalFontSize,
                                  fontWeight: FontWeight.w700,
                                  color: AppColors.textblack,
                                ),
                              ),
                              trailing: Text("CA\$${items.itemPrice}",
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
          style: TextStyle(fontSize: 20,fontWeight: FontWeight.w600,color: Colors.white),),
      ),
    );
  }
}

class UserInfo extends StatelessWidget {
  final bool isCurirar;
  final OrderResult orderResult;
  final String address;
  final String phone;
  final String amount;
  final String name;
  final String orderMethod;
  const UserInfo({
    super.key, required this.orderResult, required this.isCurirar, required this.address, required this.phone, required this.amount, required this.name, required this.orderMethod,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width*.25,
      child: Column(
        children: [
          Text("Order For",style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: Colors.white
          ),),
          Container(
            padding: EdgeInsets.only(left: 20, right: 20, bottom: 8, top: 8),
            margin: EdgeInsets.only(bottom: 30, top: 5),
            decoration: BoxDecoration(
              color: Colors.transparent,
              border: Border.all(width: 1, color: Colors.white),
              borderRadius: BorderRadius.circular(5)
            ),
            child: Text("${orderMethod}",
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: Colors.white
              ),
            ),
          ),
          Container(
            alignment: Alignment.center,
            height: MediaQuery.of(context).size.height*0.15,
            width:MediaQuery.of(context).size.width*0.10,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              color: Colors.white,
            ),
            child: Icon(Icons.person,color: Colors.black,size: 50,),
          ),
          SizedBox(height: 10,),
          Text("$name",
            style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: normalFontSize,
              color: Colors.white,
            ),
          ),
          SizedBox(height: 10,),
          InkWell(
            onTap: (){},
            child: Container(
              alignment: Alignment.center,
              height: MediaQuery.of(context).size.height*0.05,
              width: MediaQuery.of(context).size.width*0.06,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: AppColors.textindigo,
              ),
              child: Text("Lvl 01",
                style: TextStyle(fontSize: smallFontSize,
                    fontWeight: FontWeight.w600,color: Colors.white),
              ),
            ),
          ),
          ///TODO: Uncomment it

          SizedBox(height: 10,),
          RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
              text: "${isCurirar ? "Phone: " : "Accumulated order: "}",
              style: TextStyle(
                fontSize: normalFontSize,
                fontWeight: FontWeight.w700,
                color: AppColors.textorange,
              ),
              children: [
                TextSpan(
                  text: "${isCurirar ? "$phone " : "CAD\$$amount"}",
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: normalFontSize,
                    color: Colors.white,
                  ),
                )
              ]
          )),
          SizedBox(height: 10,),
          RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
              text: "${isCurirar ? "Drop Address: " : "Pickup Address" }",
              style: TextStyle(
                fontSize: normalFontSize,
                fontWeight: FontWeight.w700,
                color: AppColors.textorange,
              ),
              children: [
                TextSpan(
                  text: "$address",
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: normalFontSize,
                    color: Colors.white,
                  ),
                )
              ]
          )),
        ],
      ),
    );
  }
}
