import 'package:alarm/alarm.dart';
import 'package:flutter/material.dart';
import 'package:oms/controller/order_controller.dart';
import 'package:oms/model/order_model/order_list_model.dart';
import 'package:oms/utility/appcolor.dart';
import 'package:oms/utility/order_status.dart';
import 'package:oms/view/order/screen/new_orders.dart';
import 'package:oms/view/order/screen/orders.dart';
import 'package:oms/widget/app_alert.dart';
import '../../../utility/app_const.dart';
import '../order_incoming/widgets/incoming_order_details.dart';

class PaymentReceiveConfirmationScreen extends StatefulWidget {
  final OrderResult orderResult;
  const PaymentReceiveConfirmationScreen({super.key, required this.orderResult});

  @override
  State<PaymentReceiveConfirmationScreen> createState() => _PaymentReceiveConfirmationScreenState();
}

class _PaymentReceiveConfirmationScreenState extends State<PaymentReceiveConfirmationScreen> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  bool _isAccepting = false;
  bool _isRejecting = false;

  late final OrderResult orderResult;
  @override
  void initState() {
    super.initState();
    orderResult = widget.orderResult;
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
                  "Payment Confirmation",
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

                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Orders(
                                  pageIndex: 0,
                                )));
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
                  const Text(
                    "Have You Received The Payment?",
                    style: TextStyle(fontSize: 32, color: Colors.white),
                  ),
                  const SizedBox(height: 15),
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
                        "${widget.orderResult.customer}",
                        style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w700, color: Colors.white),
                      ),
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
                              text: "CA\$${widget.orderResult.total}",
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
                  const Text(
                    "Order for Delivery",
                    style: TextStyle(fontSize: 16, color: Colors.white, fontWeight: FontWeight.w400),
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
                            "${items.menuItem!.name}",
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
                ],
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.2,
            ),
            InkWell(
              onTap: () => paymentReceived(widget.orderResult.id.toString()),
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
                        "Payment Received",
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600, color: Colors.white),
                      ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            InkWell(
              onTap: () => paymentDidntReceived(widget.orderResult.id.toString()),
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
                        "Payment Not Received",
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
  paymentReceived(id) async {
    setState(() => _isAccepting = true);
    //alarm stop
    await Alarm.stop(1);
    try {
      await OrderController.paymentReceived(id).then((value) {
        if (value.statusCode == 200) {
          AppSnackBar(context, "Payment Received", Colors.green);
          Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => const NewOrderScreen()), (route) => false);
        } else {
          AppSnackBar(context, "An error occured!", Colors.red);
        }
      });
    } catch (e) {
      print("error: $e");
    }
    setState(() => _isAccepting = false);
  }

  //Order accept
  paymentDidntReceived(id) async {
    //alarm stop
    await Alarm.stop(1);
    setState(() => _isRejecting = true);
    await OrderController.changeStatus(id, OrderStatus.cancelled).then((value) {
      if (value.statusCode == 200) {
        AppSnackBar(context, "Order has been rejected", Colors.green);
        Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => const NewOrderScreen()), (route) => false);
      } else {
        AppSnackBar(context, "An error occured!", Colors.red);
      }
    });
    setState(() => _isRejecting = false);
  }
}
