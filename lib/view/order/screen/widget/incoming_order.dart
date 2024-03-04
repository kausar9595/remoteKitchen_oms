import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import '../../../../utility/appcolor.dart';

class IncomingOrder extends StatefulWidget {
  const IncomingOrder({super.key});

  @override
  State<IncomingOrder> createState() => _IncomingOrderState();
}

class _IncomingOrderState extends State<IncomingOrder> {
  final _search= TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.07,
                width: MediaQuery.of(context).size.width * 0.45,
                child: TextFormField(
                  controller: _search,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.search,size: 30,color: Colors.black,),
                    fillColor: Colors.white,
                    filled: true,
                    hintText: "Search Order number, Customer name, or Items",
                    hintStyle: TextStyle(fontSize: 15,fontWeight: FontWeight.w500,color: Colors.grey),
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide.none,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide.none,
                    )
                  ),
                ),
              ),
              InkWell(
                onTap: (){},
                child: Container(
                  alignment: Alignment.center,
                  height: MediaQuery.of(context).size.height*0.07,
                  width: MediaQuery.of(context).size.width*0.22,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.grey,width: 1.5),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text("No Filter Currently Applied",
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 15,
                            color:AppColors.textblack,
                        ),
                      ),
                      IconButton(onPressed: (){}, icon: Icon(Icons.keyboard_arrow_down,size: 40,color: Colors.black,))
                    ],
                  )
                ),
              )
            ],
          ),
          Divider(color: Colors.grey.shade200,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text("Not in POS ( 4 )",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w500,color: Colors.black),),
              InkWell(
                onTap: (){},
                child: Container(
                    alignment: Alignment.center,
                    height: MediaQuery.of(context).size.height*0.07,
                    width: MediaQuery.of(context).size.width*0.10,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: AppColors.textindigo,width: 1.5),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text("ETA",
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                            color:AppColors.textindigo,
                          ),
                        ),
                        Icon(Icons.keyboard_arrow_down,size: 40,color:AppColors.textindigo,),
                      ],
                    )
                ),
              )
            ],
          ),
          Divider(color: Colors.grey.shade200,),
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width*0.25,
                      child: ListTile(
                        title: Text("#600175820",style: TextStyle(fontSize: 14,fontWeight: FontWeight.w500),),
                        subtitle:Text("Customer Name Ex.",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w600),),
                      ),
                    ),
                    Container(
                      alignment: Alignment.center,
                      height: MediaQuery.of(context).size.height*0.06,
                      width: MediaQuery.of(context).size.width*0.04,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        border: Border.all(color: Colors.black),
                      ),
                      child: Text("5",style: TextStyle(fontWeight: FontWeight.w600,fontSize:16,color: Colors.black),),
                    ),
                    SizedBox(width: 15,),
                    SizedBox(
                      width: MediaQuery.of(context).size.width*0.35,
                      child: ListTile(
                        title: Text("Meat that Skewers&Kebab",style: TextStyle(fontSize: 14,fontWeight: FontWeight.w500),),
                        subtitle:Text("Fresh lamb kebab (10 skewers)- BOG....",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w600),),
                      ),
                    ),
                    Container(
                      alignment: Alignment.center,
                      width: MediaQuery.of(context).size.width*0.30,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Icon(Icons.access_time_sharp,size: 20,color: Colors.black,),
                          RichText(text: TextSpan(
                            text: "Courier",
                            style: TextStyle(fontWeight: FontWeight.w500,fontSize: 15,color: Colors.grey),
                            children:[
                              TextSpan(
                                text: ".22m",
                                style: TextStyle(fontWeight: FontWeight.w600,fontSize: 18,color: Colors.black),
                              )
                            ]
                          ))
                        ],
                      ),

                    )
                  ],
                ),

              ],
            ),
          Divider(color: Colors.grey.shade200,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width*0.25,
                    child: ListTile(
                      title: Text("#600175820",style: TextStyle(fontSize: 14,fontWeight: FontWeight.w500),),
                      subtitle:Text("Customer Name Ex.",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w600),),
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    height: MediaQuery.of(context).size.height*0.06,
                    width: MediaQuery.of(context).size.width*0.04,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      border: Border.all(color: Colors.black),
                    ),
                    child: Text("5",style: TextStyle(fontWeight: FontWeight.w600,fontSize:16,color: Colors.black),),
                  ),
                  SizedBox(width: 15,),
                  SizedBox(
                    width: MediaQuery.of(context).size.width*0.35,
                    child: ListTile(
                      title: Text("Meat that Skewers&Kebab",style: TextStyle(fontSize: 14,fontWeight: FontWeight.w500),),
                      subtitle:Text("Fresh lamb kebab (10 skewers)- BOG....",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w600),),
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    width: MediaQuery.of(context).size.width*0.30,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Icon(Icons.access_time_sharp,size: 20,color: Colors.black,),
                        RichText(text: TextSpan(
                            text: "Courier",
                            style: TextStyle(fontWeight: FontWeight.w500,fontSize: 15,color: Colors.grey),
                            children:[
                              TextSpan(
                                text: ".22m",
                                style: TextStyle(fontWeight: FontWeight.w600,fontSize: 18,color: Colors.black),
                              )
                            ]
                        ))
                      ],
                    ),

                  )
                ],
              ),

            ],
          ),
          Divider(color: Colors.grey.shade200,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width*0.25,
                    child: ListTile(
                      title: Text("#600175820",style: TextStyle(fontSize: 14,fontWeight: FontWeight.w500),),
                      subtitle:Text("Customer Name Ex.",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w600),),
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    height: MediaQuery.of(context).size.height*0.06,
                    width: MediaQuery.of(context).size.width*0.04,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      border: Border.all(color: Colors.black),
                    ),
                    child: Text("5",style: TextStyle(fontWeight: FontWeight.w600,fontSize:16,color: Colors.black),),
                  ),
                  SizedBox(width: 15,),
                  SizedBox(
                    width: MediaQuery.of(context).size.width*0.35,
                    child: ListTile(
                      title: Text("Meat that Skewers&Kebab",style: TextStyle(fontSize: 14,fontWeight: FontWeight.w500),),
                      subtitle:Text("Fresh lamb kebab (10 skewers)- BOG....",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w600),),
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    width: MediaQuery.of(context).size.width*0.30,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Icon(Icons.access_time_sharp,size: 20,color: Colors.black,),
                        RichText(text: TextSpan(
                            text: "Courier",
                            style: TextStyle(fontWeight: FontWeight.w500,fontSize: 15,color: Colors.grey),
                            children:[
                              TextSpan(
                                text: ".22m",
                                style: TextStyle(fontWeight: FontWeight.w600,fontSize: 18,color: Colors.black),
                              )
                            ]
                        ))
                      ],
                    ),

                  )
                ],
              ),

            ],
          ),
          Divider(color: Colors.grey.shade200,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width*0.25,
                    child: ListTile(
                      title: Text("#600175820",style: TextStyle(fontSize: 14,fontWeight: FontWeight.w500),),
                      subtitle:Text("Customer Name Ex.",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w600),),
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    height: MediaQuery.of(context).size.height*0.06,
                    width: MediaQuery.of(context).size.width*0.04,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      border: Border.all(color: Colors.black),
                    ),
                    child: Text("5",style: TextStyle(fontWeight: FontWeight.w600,fontSize:16,color: Colors.black),),
                  ),
                  SizedBox(width:10),
                  SizedBox(
                    width: MediaQuery.of(context).size.width*0.35,
                    child: ListTile(
                      title: Text("Meat that Skewers&Kebab",style: TextStyle(fontSize: 14,fontWeight: FontWeight.w500),),
                      subtitle:Text("Fresh lamb kebab (10 skewers)- BOG....",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w600),),
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    width: MediaQuery.of(context).size.width*0.30,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Icon(Icons.access_time_sharp,size: 20,color: Colors.black,),
                        RichText(text: TextSpan(
                            text: "Courier",
                            style: TextStyle(fontWeight: FontWeight.w500,fontSize: 15,color: Colors.grey),
                            children:[
                              TextSpan(
                                text: ".22m",
                                style: TextStyle(fontWeight: FontWeight.w600,fontSize: 18,color: Colors.black),
                              )
                            ]
                        ))
                      ],
                    ),

                  )
                ],
              ),

            ],
          ),
          Divider(color: Colors.grey.shade200,),
        ],
      ),
    );
  }
}
