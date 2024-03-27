import 'package:flutter/material.dart';

import '../../../../model/order_model/order_list_model.dart';
import '../../../../utility/app_const.dart';
import '../../../../utility/appcolor.dart';

class IncomingOrderDetails extends StatelessWidget {
  final OrderResult orderResult;

  const IncomingOrderDetails({super.key, required this.orderResult});

  @override
  Widget build(BuildContext context) {
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
                              fontSize: 18,
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
              orderResult.orderMethod == "pickup"
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
                                      fontSize: normalFontSize,
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
                                      fontSize: normalFontSize,
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
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                        color: AppColors.textblack),
                  ),

                ],
              ),
              SizedBox(height: 20,),
              Text("Items",
                style: TextStyle(
                  fontSize: 14,
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
                trailing: Text("CA\$${orderResult.subtotal}",
                  style: TextStyle(fontSize: normalFontSize,
                    fontWeight: FontWeight.w400,color: AppColors.textblack,
                  ),
                ),
              ),
              ListTile(
                leading: Text("Tex",
                  style: TextStyle(fontWeight: FontWeight.w400,
                      fontSize: normalFontSize,color:AppColors.textblack),
                ),
                title: Divider(),
                trailing: Text("CA\$${orderResult.tax}",
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
