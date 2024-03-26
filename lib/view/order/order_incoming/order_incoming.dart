

import 'package:flutter/material.dart';
import 'package:oms/utility/app_const.dart';
import 'package:oms/utility/appcolor.dart';


class OrderIncoming extends StatefulWidget {
  const OrderIncoming({super.key});

  @override
  State<OrderIncoming> createState() => _OrderIncomingState();
}

class _OrderIncomingState extends State<OrderIncoming> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      backgroundColor:Colors.black,
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              title: Text("New Ordering Incoming",style: TextStyle(
                fontWeight: FontWeight.w700,color: Colors.white,fontSize: 20,
              ),),
              trailing: IconButton(
                  onPressed: (){Navigator.pop(context);},
                  icon: Icon(Icons.cancel_outlined,color: Colors.white,size: 40,),)

            ),
            SizedBox(height: MediaQuery.of(context).size.height*0.1,),
            Container(
              padding: EdgeInsets.only(left: 50),
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    alignment: Alignment.center,
                    height: MediaQuery.of(context).size.height*0.09,
                    width: MediaQuery.of(context).size.width*0.06,

                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: Colors.white,
                    ),
                    child: Icon(Icons.person,size:50,color: AppColors.textindigo,),
                  ),
                  SizedBox(height: 10,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text("User Name",
                        style: TextStyle(fontSize: 20,fontWeight: FontWeight.w700,color: Colors.white),
                      ),
                      SizedBox(width: 10,),
                      InkWell(
                        onTap: (){},
                        child: Container(
                          alignment: Alignment.center,
                          height: MediaQuery.of(context).size.height*0.04,
                          width: MediaQuery.of(context).size.width*0.06,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: AppColors.textindigo,
                          ),
                          child: Text("Lvl 01",
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: smallFontSize,color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 10,),
                      Text("(",style: TextStyle(color: Colors.white),),
                      RichText(text: TextSpan(
                          text: "Accumulated order:",
                          style: TextStyle(fontSize: 16,fontWeight: FontWeight.w600,color: AppColors.textorange),
                          children: [
                            TextSpan(
                              text: "CA\$356.98",
                              style: TextStyle(fontWeight: FontWeight.w500,fontSize: 16,color: Colors.white),
                            )
                          ]
                      )),
                      Text(")",style: TextStyle(color: Colors.white),),

                    ],
                  ),
                  SizedBox(height: 10,),
                  Text("Has ordered 3 Items",style: TextStyle(
                    fontSize: 16,color: Colors.white,fontWeight:FontWeight.w700,
                  ),),
                  SizedBox(height: 5,),
                  Text("Order for Delivery",
                    style: TextStyle(fontSize: 16,color:Colors.white,fontWeight: FontWeight.w400),
                  ),
                  SizedBox(height: 5,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        alignment: Alignment.center,
                        height: MediaQuery.of(context).size.height*0.06,
                        width:MediaQuery.of(context).size.width*0.04,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          border: Border.all(color: Colors.white,width: 2),
                          color: AppColors.textindigo,
                        ),
                        child: Text("2",style: TextStyle(fontWeight: FontWeight.w600,color: Colors.white,fontSize: 16),
                        ),
                      ),
                      SizedBox(width: 10,),
                      Text("Fresh lamb kebab (10 skewers)- BOGO item ",
                        style: TextStyle(fontSize:16,fontWeight: FontWeight.w700,color: Colors.white),
                      ),

                    ],
                  ),
                  SizedBox(height: 5,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        alignment: Alignment.center,
                        height: MediaQuery.of(context).size.height*0.06,
                        width:MediaQuery.of(context).size.width*0.04,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          border: Border.all(color: Colors.white,width: 2),
                          color: AppColors.textindigo,
                        ),
                        child: Text("1",style: TextStyle(fontWeight: FontWeight.w600,color: Colors.white,fontSize: 16),
                        ),
                      ),
                      SizedBox(width: 10,),
                      Text("Lamb Fried Rice",
                        style: TextStyle(fontSize:18,fontWeight: FontWeight.w600,color: Colors.white),
                      ),

                    ],
                  ),
                  SizedBox(height: 5,),
                  TextButton(onPressed: (){},
                    child: Text("View Order Details",
                    style: TextStyle(fontWeight: FontWeight.w400,fontSize: 16,color: AppColors.textindigo),),
                  ),
                ],

              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height*0.2,),
            InkWell(
              onTap: (){},
              child: Container(
                alignment: Alignment.center,
                height: MediaQuery.of(context).size.height*0.06,
                width: MediaQuery.of(context).size.width*0.35,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: AppColors.textindigo,
                ),
                child: Text("Accept",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w600,color: Colors.white),
                ),

              ),
            ),
            SizedBox(height: 20,),
            InkWell(
              onTap: (){},
              child: Container(
                alignment: Alignment.center,
                height: MediaQuery.of(context).size.height*0.06,
                width: MediaQuery.of(context).size.width*0.35,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: AppColors.textred,
                ),
                child: Text("Reject",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w600,color: Colors.white),
                ),

              ),
            ),
          ],
        ),
      ),
    ));
  }
}
