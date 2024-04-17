import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../model/order_model/order_list_model.dart';
import '../../../../utility/app_const.dart';
import '../../../../utility/appcolor.dart';

class IncomingOrderDetails extends StatelessWidget {
  final OrderResult orderResult;

  const IncomingOrderDetails({super.key, required this.orderResult});

  @override
  Widget build(BuildContext context) {

    print("orderResult.receiveDate --- ${orderResult.receiveDate}");
    return Drawer(
      backgroundColor: Colors.white,
      width: MediaQuery.of(context).size.width*.40,
      child: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width*.40,
          padding: EdgeInsets.all(15),

          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Text("Order Will Be: ",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: normalFontSize,
                          fontWeight: FontWeight.w500,
                        )
                      ),
                      SizedBox(width: 10,),
                      Container(
                        width: 100,
                        height: 30,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(100),
                          border: Border.all(width: 1, color: AppColors.textindigo),
                        ),
                        child: Center(
                          child: Text(orderResult.orderMethod!,
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: normalFontSize,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  IconButton(
                      onPressed: ()=>Navigator.pop(context),
                      icon: Icon(Icons.close)
                  )
                ],
              ), 
              SizedBox(height: 10,),

              Text("Order Date: ${convertPacificTimeZoon(orderResult.receiveDate)}",
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: normalFontSize
                ),
              ),
              SizedBox(height: 10,),
              orderResult.orderMethod != "pickup"
                  ? Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      RichText(
                          text: TextSpan(
                              children: [
                                TextSpan(
                                    text: "Drop of address :",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: normalFontSize,
                                      fontWeight: FontWeight.w400,
                                    )
                                ),
                                TextSpan(
                                    text: "${orderResult.dropoffAddress}",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: normalFontSize,
                                      fontWeight: FontWeight.w500,
                                    )
                                ),
                              ]
                          )
                      ),
                      SizedBox(height: 7,),
                      RichText(
                          text: TextSpan(
                              children: [
                                TextSpan(
                                    text: "Drop of phone number:",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: smallFontSize,
                                      fontWeight: FontWeight.w400,
                                    )
                                ),
                                TextSpan(
                                    text: " ${orderResult.dropoffPhoneNumber}",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: normalFontSize,
                                      fontWeight: FontWeight.w500,
                                    )
                                ),
                              ]
                          )
                      ),
                      SizedBox(height: 7,),
                      RichText(
                          text: TextSpan(
                              children: [
                                TextSpan(
                                    text: "Drop of contact person:",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: smallFontSize,
                                      fontWeight: FontWeight.w400,
                                    )
                                ),
                                TextSpan(
                                    text: " ${orderResult.dropoffContactFirstName} ${orderResult.dropoffContactLastName}",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: normalFontSize,
                                      fontWeight: FontWeight.w500,
                                    )
                                ),
                              ]
                          )
                      ),
                    ],
                   ) : Center(),

              SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("${orderResult.quantity} items for - ${orderResult.customer}",
                    style: TextStyle(
                        fontSize: normalFontSize,
                        fontWeight: FontWeight.w700,
                        color: AppColors.textblack),
                  ),

                ],
              ),
              SizedBox(height: 20,),
              Text("Items",
                style: TextStyle(
                  fontSize: normalFontSize,
                  fontWeight: FontWeight.w500
                ),
              ),
              SizedBox(height: 10,),
              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: orderResult.orderitemSet!.length,
                itemBuilder: (_, index) {
                  var items = orderResult.orderitemSet![index];
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
                    subtitle: items.modifiers!.isNotEmpty
                        ? ListView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: items.modifiers![index].modifiersItems!.length,
                          itemBuilder: (_, modifiarItem){
                            return Row(
                              //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("${items.modifiers![index].modifiersItems![modifiarItem].modifiersOrderItems!.name}",
                                  style: TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w400,
                                    color: AppColors.textblack,
                                  ),
                                ),
                                SizedBox(width: 10,),
                                Text("(CA\$${items.modifiers![index].modifiersItems![modifiarItem].modifiersOrderItems!.basePrice})",
                                  style: TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w600,
                                    color: AppColors.textblack,
                                  ),
                                ),
                              ],
                            );
                          },
                        ) : Center(),
                    title: Text("${items.menuItem!.name}",
                      style: TextStyle(
                        fontSize: normalFontSize,
                        fontWeight: FontWeight.w700,
                        color: AppColors.textblack,
                      ),
                    ),
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
                trailing: Text("CA\$${orderResult.subtotal}",
                  style: TextStyle(fontSize: normalFontSize,
                    fontWeight: FontWeight.w400,color: AppColors.textblack,
                  ),
                ),
              ),
              ListTile(
                leading: Text(
                  "Tax",
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: normalFontSize,
                      color: Colors.black),
                ),
                title: Divider(),
                trailing: Text(
                  "CA\$${orderResult.tax}",
                  style: TextStyle(
                      fontSize: normalFontSize,
                      fontWeight: FontWeight.w500,
                      color: Colors.black),
                ),
              ),
              orderResult.discount != 0.0 ? ListTile(
                leading: Text("Discount",
                  style: TextStyle(fontWeight: FontWeight.w500,
                      fontSize: normalFontSize,color:Colors.black),
                ),
                title: Divider(),
                trailing: Text("CA\$${orderResult.discount}",
                  style: TextStyle(fontWeight: FontWeight.w500,
                      fontSize: normalFontSize,color:Colors.black),
                ),
              ) :Center(),
              orderResult.deliveryFee != 0.0 ? ListTile(
                leading: Text("Delivery Fee",
                  style: TextStyle(fontWeight: FontWeight.w500,
                      fontSize: normalFontSize,color:Colors.black),
                ),
                title: Divider(),
                trailing: Text("CA\$${orderResult.deliveryFee}",
                  style: TextStyle(fontWeight: FontWeight.w500,
                      fontSize: normalFontSize,color: Colors.black),
                ),
              ) :Center(),
              orderResult.convenienceFee != 0.0 ? ListTile(
                leading: Text("Convenience Fee",
                  style: TextStyle(fontWeight: FontWeight.w500,
                      fontSize: normalFontSize,color:Colors.black),
                ),
                title: Divider(),
                trailing: Text("CA\$${orderResult.convenienceFee}",
                  style: TextStyle(fontWeight: FontWeight.w500,
                      fontSize: normalFontSize,color: Colors.black),
                ),
              ) :Center(),
              orderResult.deliveryDiscount != 0.0 ? ListTile(
                leading: Text("Delivery Discount",
                  style: TextStyle(fontWeight: FontWeight.w500,
                      fontSize: normalFontSize,color:Colors.black),
                ),
                title: Divider(),
                trailing: Text("CA\$${orderResult.deliveryDiscount}",
                  style: TextStyle(fontWeight: FontWeight.w500,
                      fontSize: normalFontSize,color: Colors.black),
                ),
              ) :Center(),
              orderResult.voucher != null && orderResult.voucher != 0.0 ? ListTile(
                leading: Text("Voucher",
                  style: TextStyle(fontWeight: FontWeight.w500,
                      fontSize: normalFontSize,color:Colors.black),
                ),
                title: Divider(),
                trailing: Text("CA\$${orderResult.voucher}",
                  style: TextStyle(fontWeight: FontWeight.w500,
                      fontSize: normalFontSize,color: Colors.black),
                ),
              ) :Center(),
              orderResult.tips != null && orderResult.tips != 0.0 ? ListTile(
                leading: Text("Tips",
                  style: TextStyle(fontWeight: FontWeight.w500,
                      fontSize: normalFontSize,color:Colors.black),
                ),
                title: Divider(),
                trailing: Text("CA\$${orderResult.tips}",
                  style: TextStyle(fontWeight: FontWeight.w500,
                      fontSize: normalFontSize,color: Colors.black),
                ),
              ) :Center(),
              Divider(),
              ListTile(
                leading: Text("Total",
                  style: TextStyle(fontWeight: FontWeight.w400,
                      fontSize: normalFontSize,color:AppColors.textblack),
                ),
                title: Divider(),
                trailing: Text("CA\$${orderResult.total}",
                  style: TextStyle(fontWeight: FontWeight.w400,
                      fontSize: normalFontSize,color:AppColors.textblack),
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
