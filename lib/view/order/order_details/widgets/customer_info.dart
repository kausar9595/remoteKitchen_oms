import 'package:flutter/material.dart';

import '../../../../controller/order_controller.dart';
import '../../../../model/order_model/order_curiar_model.dart';
import '../../../../model/order_model/order_list_model.dart';
import '../../../../utility/app_const.dart';
import '../../../../utility/appcolor.dart';
import 'customer_view.dart';


class CustomerInfo extends StatefulWidget {
  final OrderResult orderResult;
  const CustomerInfo({super.key, required this.orderResult});

  @override
  State<CustomerInfo> createState() => _CustomerInfoState();
}

class _CustomerInfoState extends State<CustomerInfo> {
  bool _iscustomer = true;
  bool _iscourier = false;


  @override
  Widget build(BuildContext context) {
    return Container(
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
            phone: "${widget.orderResult.dropoffPhoneNumber}",
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
    );
  }
}
