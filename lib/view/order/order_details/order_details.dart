import 'package:flutter/material.dart';
import 'package:oms/utility/app_const.dart';
import 'package:oms/utility/appcolor.dart';
import 'package:shimmer/shimmer.dart';
import '../order_incoming/order_incoming.dart';

class OrderDetail extends StatefulWidget {
  const OrderDetail({super.key});

  @override
  State<OrderDetail> createState() => _OrderDetailState();
}

class _OrderDetailState extends State<OrderDetail> {
   bool _iscustomer = true;
   bool _iscourier = false;
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
                        InkWell(
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
                        ),

                      ],
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height*0.20,
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
                    Text("User Name",
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
                    SizedBox(height: 10,),
                    Text("exampleemail@gmail.com",
                      style: TextStyle(fontWeight: FontWeight.w500,fontSize: 15,color: Colors.white),
                    ),
                    SizedBox(height: 10,),
                    RichText(text: TextSpan(
                      text: "Accumulated order :",
                      style: TextStyle(
                          fontSize: normalFontSize,
                          fontWeight: FontWeight.w700,
                          color: AppColors.textorange,
                      ),
                      children: [
                        TextSpan(
                          text: " CA\$356.98",
                          style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: normalFontSize,
                              color: Colors.white,
                          ),
                        )
                      ]
                    ))
                  ],
                ),
              ),
          ),
          Expanded(
            flex: 1,
              child: SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.all(15),
                  color: Colors.white,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            alignment: Alignment.center,
                            height: MediaQuery.of(context).size.height*0.07,
                            width: MediaQuery.of(context).size.width*0.20,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white,
                              border: Border.all(color: Colors.grey),
                            ),
                            child: DropdownButton<String>(
                              icon: Icon(Icons.keyboard_arrow_down_rounded,size: 35,color: Colors.black,),
                              elevation: 0,
                              underline:Container(
                                decoration: BoxDecoration(
                                  border: Border(bottom: BorderSide.none),
                                ),
                              ),
                              hint: Row(
                                children: [
                                  Icon(Icons.print,color: Colors.black,size: 35,),
                                  SizedBox(height: 5,),
                                  Text("Reprint Ticket",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: smallFontSize,
                                      color: AppColors.textblack,
                                    ),),
                                  SizedBox(height: 10,),
                                ],
                              ),
                              items: <String>['A', 'B', 'C', 'D'].map((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                              onChanged: (_) {},
                            ),
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
                        child: Text("3 items for\n Example User\n Name",
                          style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.w700,
                              color: AppColors.textblack),
                        ),
                      ),
                      ListTile(
                        leading: Container(
                          alignment: Alignment.center,
                          height: MediaQuery.of(context).size.height*0.06,
                          width: MediaQuery.of(context).size.width*0.04,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            color: AppColors.textindigo,
                          ),
                          child: Text("2",
                            style: TextStyle(fontWeight: FontWeight.w500,color: Colors.white,fontSize: 16),
                          ),
                        ),
                        title: Text("Fresh lamb kebab (10\nskewers)- BOGO item ",
                          style: TextStyle(
                              fontSize: normalFontSize,
                              fontWeight: FontWeight.w700,
                              color: AppColors.textblack,
                          ),
                        ),
                        trailing: Text("CA\$13.99",
                          style: TextStyle(
                              fontSize: normalFontSize,
                              fontWeight: FontWeight.w400,
                              color: AppColors.textblack,
                          ),
                        ),
                      ),
                      SizedBox(height: 10,),
                      ListTile(
                        leading: Container(
                          alignment: Alignment.center,
                          height: MediaQuery.of(context).size.height*0.06,
                          width: MediaQuery.of(context).size.width*0.04,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            color: AppColors.textindigo,
                          ),
                          child: Text("1",
                            style: TextStyle(
                                fontWeight: FontWeight.w700,
                                color: Colors.white,
                                fontSize: normalFontSize,
                            ),
                          ),
                        ),
                        title: Text("Lamb Fried Rice",
                          style: TextStyle(
                              fontSize: normalFontSize,
                              fontWeight: FontWeight.w700,color: AppColors.textblack,
                          ),
                        ),
                        trailing: Text("CA\$13.99",
                          style: TextStyle(fontSize: normalFontSize,
                              fontWeight: FontWeight.w400,color: AppColors.textblack,
                          ),
                        ),
                      ),
                      SizedBox(height: 10,),
                      ListTile(
                        leading: Text("Item Subtotal",
                          style: TextStyle(fontWeight: FontWeight.w400,
                              fontSize: normalFontSize,color: AppColors.textblack,
                          ),
                        ),
                        title: Divider(),
                        trailing: Text("CA\$13.99",
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
                        trailing: Text("CA\$7.1",
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
                        trailing: Text("CA\$20.0",
                          style: TextStyle(fontWeight: FontWeight.w400,
                              fontSize: normalFontSize,color:AppColors.textblack),
                        ),
                      ),
                      SizedBox(height: MediaQuery.of(context).size.height*0.1,),
                      InkWell(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>OrderIncoming()));
                        },
                        child: Container(
                          alignment: Alignment.center,
                          height: MediaQuery.of(context).size.height*0.08,
                          width: MediaQuery.of(context).size.width*0.80,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color:AppColors.textindigo,
                          ),
                          child: Text("Mark as Ready",
                            style: TextStyle(fontSize: 20,fontWeight: FontWeight.w600,color: Colors.white),),
                        ),
                      ),
                      SizedBox(height: 10,),
                      InkWell(
                        onTap: (){},
                        child: Container(
                          alignment: Alignment.center,
                          height: MediaQuery.of(context).size.height*0.08,
                          width: MediaQuery.of(context).size.width*0.80,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color:AppColors.textred,
                          ),
                          child: Text("Cancel Order",
                            style: TextStyle(fontSize: 20,fontWeight: FontWeight.w600,color: Colors.white),),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
          ),
        ],
      ),
    ));
  }
}
