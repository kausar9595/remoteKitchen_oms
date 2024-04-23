import 'package:alarm/alarm.dart';
import 'package:flutter/material.dart';
import 'package:oms/assets/app_assets.dart';
import 'package:get/get.dart';
import 'package:oms/controller/order_controller.dart';
import 'package:oms/controller/prepare_time_controller.dart';
import 'package:oms/model/order_model/order_list_model.dart';
import 'package:oms/utility/app_const.dart';
import 'package:oms/utility/appcolor.dart';
import 'package:oms/utility/order_status.dart';
import 'package:oms/view/order/screen/new_orders.dart';
import 'package:oms/view/order/screen/orders.dart';
import 'package:oms/widget/app_alert.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

import '../../../model/order_model/order_list_model.dart';
import 'widgets/incoming_order_details.dart';

class OrderIncoming extends StatefulWidget {
  final OrderResult orderResult;
  const OrderIncoming({super.key, required this.orderResult});

  @override
  State<OrderIncoming> createState() => _OrderIncomingState();
}

class _OrderIncomingState extends State<OrderIncoming> {
  double _value = 20;

  final _key = GlobalKey<ScaffoldState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  bool _isAccepting = false;
  bool _isRejecting = false;

  var OrderResult;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    OrderResult = widget.orderResult;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.black,
      endDrawer: IncomingOrderDetails(
        orderResult: widget.orderResult,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
                title: const Text(
                  "New Ordering Incoming",
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
                trailing: IconButton(
                  onPressed: () async {
                    //alarm stop
                    await Alarm.stop(1);

                    Navigator.push(context, MaterialPageRoute(builder: (context) => const NewOrderScreen()));
                  },
                  icon: const Icon(
                    Icons.cancel_outlined,
                    color: Colors.white,
                    size: 40,
                  ),
                )),
            const SizedBox(
              height: 25,
            ),
            Container(
              padding: const EdgeInsets.only(left: 50),
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    alignment: Alignment.center,
                    height: MediaQuery.of(context).size.height * 0.09,
                    width: MediaQuery.of(context).size.width * 0.06,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: Colors.white,
                    ),
                    child: const Icon(
                      Icons.person,
                      size: 50,
                      color: AppColors.textindigo,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "${widget.orderResult!.customer}",
                        style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w700, color: Colors.white),
                      ),
                      // SizedBox(width: 10,),
                      // InkWell(
                      //   onTap: (){},
                      //   child: Container(
                      //     alignment: Alignment.center,
                      //     height: MediaQuery.of(context).size.height*0.04,
                      //     width: MediaQuery.of(context).size.width*0.06,
                      //     decoration: BoxDecoration(
                      //       borderRadius: BorderRadius.circular(10),
                      //       color: AppColors.textindigo,
                      //     ),
                      //     child: Text("Lvl 01",
                      //       style: TextStyle(
                      //           fontWeight: FontWeight.w600,
                      //           fontSize: smallFontSize,color: Colors.white,
                      //       ),
                      //     ),
                      //   ),
                      // ),
                      const SizedBox(
                        width: 15,
                      ),
                      const Text(
                        "(",
                        style: TextStyle(color: Colors.white),
                      ),
                      RichText(
                          text: TextSpan(
                              text: "Accumulated order:",
                              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: AppColors.textorange),
                              children: [
                            TextSpan(
                              text: "CA\$${widget.orderResult!.total}",
                              style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 16, color: Colors.white),
                            )
                          ])),
                      const Text(
                        ")",
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Has ordered ${widget.orderResult.quantity} Items",
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Order for ${widget.orderResult.orderMethod}",
                    style: const TextStyle(fontSize: 16, color: Colors.white, fontWeight: FontWeight.w400),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: widget.orderResult.orderitemSet!.length,
                    itemBuilder: (_, index) {
                      var items = widget.orderResult.orderitemSet![index];
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            alignment: Alignment.center,
                            height: 45,
                            width: 45,
                            margin: const EdgeInsets.only(bottom: 10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                              border: Border.all(color: Colors.white, width: 2),
                              color: AppColors.textindigo,
                            ),
                            child: Text(
                              "${items.quantity}",
                              style: const TextStyle(fontWeight: FontWeight.w600, color: Colors.white, fontSize: 16),
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Text(
                            "${items.menuItem?.name}",
                            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w700, color: Colors.white),
                          ),
                        ],
                      );
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextButton(
                    onPressed: () async {
                      //alarm stop
                      await Alarm.stop(1);
                      _scaffoldKey.currentState?.openEndDrawer();
                    },
                    child: const Text(
                      "View Order Details",
                      style: TextStyle(fontWeight: FontWeight.w400, fontSize: 16, color: AppColors.textindigo),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  widget.orderResult.paymentMethod == "cash"
                      ? SizedBox(
                          width: MediaQuery.of(context).size.width * 0.25,
                          child: ListTile(
                            leading: Container(
                              margin: const EdgeInsets.all(5),
                              padding: const EdgeInsets.all(5),
                              height: 70,
                              width: 60,
                              decoration: BoxDecoration(
                                image: const DecorationImage(image: AssetImage(AppAssets.bankCode), fit: BoxFit.contain),
                                border: Border.all(color: Colors.grey),
                                borderRadius: BorderRadius.circular(6),
                              ),
                            ),
                            // leading: ClipRRect(
                            //   borderRadius: BorderRadius.circular(5),
                            //
                            //   child: Image.asset(
                            //     AppAssets.bankCode,
                            //     fit: BoxFit.cover,
                            //   ),
                            // ),
                            title: Text(
                              "Pay Later With Cash",
                              style: TextStyle(fontSize: normalFontSize, fontWeight: FontWeight.w500, color: Colors.white),
                            ),
                            subtitle: Text(
                              "Pay with credit card  in person",
                              style: TextStyle(fontSize: smallFontSize, fontWeight: FontWeight.w400, color: Colors.white),
                            ),
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10), side: const BorderSide(color: Colors.grey)),
                            onTap: () {},
                          ),
                        )
                      : const SizedBox.shrink(),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.30,
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              "Prepare Time",
                              style: TextStyle(fontSize: 16, color: Colors.white, fontWeight: FontWeight.w600),
                            ),
                            ElevatedButton(
                              onPressed: () {
                                _value = 20;
                                setState(() {});
                              },
                              child: const Text("Default"),
                            ),
                          ],
                        ),
                        SfSlider(
                          min: 5,
                          max: 30,
                          value: _value,
                          interval: 5,
                          showTicks: true,
                          showLabels: true,
                          enableTooltip: true,
                          //minorTicksPerInterval: 1,
                          onChanged: (dynamic value) {
                            setState(() {
                              _value = value;
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            InkWell(
              onTap: () => orderAccept(widget.orderResult.id.toString()),
              child: Container(
                alignment: Alignment.center,
                height: MediaQuery.of(context).size.height * 0.06,
                width: MediaQuery.of(context).size.width * 0.35,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: AppColors.textindigo,
                ),
                child: _isAccepting
                    ? const Center(
                        child: CircularProgressIndicator(
                          color: Colors.white,
                        ),
                      )
                    : const Text(
                        "Accept",
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600, color: Colors.white),
                      ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            InkWell(
              onTap: () => orderCancelled(widget.orderResult.id.toString()),
              child: Container(
                alignment: Alignment.center,
                height: MediaQuery.of(context).size.height * 0.06,
                width: MediaQuery.of(context).size.width * 0.35,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: AppColors.textred,
                ),
                child: _isRejecting
                    ? const Center(
                        child: CircularProgressIndicator(
                          color: Colors.white,
                        ),
                      )
                    : const Text(
                        "Reject",
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600, color: Colors.white),
                      ),
              ),
            ),
          ],
        ),
      ),
    ));
  }

  //
  ////
  //Order accept
  orderAccept(id) async {
    setState(() => _isAccepting = true);
    //alarm stop
    await Alarm.stop(1);
    try {
      await OrderController.changeStatus(id, OrderStatus.accepted).then((value) {
        if (value.statusCode == 200) {
          // Prep TIme
          Get.find<PrepareTimeController>().setOrderAcceptTime(int.parse(id));
          Get.find<PrepareTimeController>().setOrderPrepTime(int.parse(id), _value.round());

          AppSnackBar(context, "Order has been accepted", Colors.green);
          Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => const NewOrderScreen()), (route) => false);
        } else {
          AppSnackBar(context, "Getting some issues to Accept this order.", Colors.red);
        }
      });
    } catch (e) {
      print("error: $e");
    }
    setState(() => _isAccepting = false);
  }

  //Order accept
  orderCancelled(id) async {
    //alarm stop
    await Alarm.stop(1);
    setState(() => _isRejecting = true);
    await OrderController.changeStatus(id, OrderStatus.cancelled).then((value) {
      if (value.statusCode == 200) {
        AppSnackBar(context, "Order has be rejected", Colors.green);
        Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => const NewOrderScreen()), (route) => false);
      } else {
        AppSnackBar(context, "Getting some issues to Reject this order.", Colors.red);
      }
    });
    setState(() => _isRejecting = false);
  }
}
