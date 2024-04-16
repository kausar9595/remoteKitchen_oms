import 'package:flutter/material.dart';

import '../../../../model/order_model/order_list_model.dart';
import '../../../../utility/app_const.dart';
import '../../../../utility/appcolor.dart';



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
              fontSize: normalFontSize,
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
                  fontSize: normalFontSize,
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
                style: TextStyle(fontSize: normalFontSize,
                    fontWeight: FontWeight.w600,color: Colors.white),
              ),
            ),
          ),
          ///TODO: Uncomment it

          SizedBox(height: 10,),
          RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                  text: "${"Accumulated order: "}",
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
          if (isCurirar != true) RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                  text: "Phone Number: ",
                  style: TextStyle(
                    fontSize: normalFontSize,
                    fontWeight: FontWeight.w700,
                    color: AppColors.textorange,
                  ),
                  children: [
                    TextSpan(
                      text: phone,
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: normalFontSize,
                        color: Colors.white,
                      ),
                    )
                  ]
              )) else Center(),

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
