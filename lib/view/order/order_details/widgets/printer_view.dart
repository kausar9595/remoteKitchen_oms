import 'package:bluetooth_print/bluetooth_print.dart';
import 'package:bluetooth_print/bluetooth_print_model.dart';
import 'package:flutter/material.dart';

import '../../../../controller/printer_controller.dart';
import '../../../../model/order_model/order_list_model.dart';
import '../../../../utility/app_const.dart';
import '../../../../utility/appcolor.dart';
import '../../../under_constraction.dart';


class PrinterViewPage extends StatefulWidget {
  final OrderResult orderResult;

  const PrinterViewPage({super.key, required this.orderResult});

  @override
  State<PrinterViewPage> createState() => _PrinterViewPageState();
}

class _PrinterViewPageState extends State<PrinterViewPage> {
  List<BluetoothDevice> _devices = [];
  BluetoothPrint bluetoothPrint = BluetoothPrint.instance;

  bool _isScanning = false;

  void initBluetoothPrinter()async{
    // begin scan
    bluetoothPrint.startScan(timeout: Duration(seconds: 2));
    if(!mounted) return;
    bluetoothPrint.scanResults.listen((event) {
      setState(() {
        _devices = event;
      });
      print("bluetooth printer list == ${_devices}");
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) => initBluetoothPrinter());

  }


  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          alignment: Alignment.center,
          height: 50,
          width: MediaQuery
              .of(context)
              .size
              .width * .22,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white,
            border: Border.all(color: Colors.grey),
          ),
          child: StreamBuilder<List<BluetoothDevice>>(
              stream: bluetoothPrint.scanResults,
              builder: (context, snapshot) {
                print("bluetoothPrint.scanResults === ${bluetoothPrint
                    .scanResults}");
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator(),);
                } else if (snapshot.hasData) {
                  _devices = snapshot.data!;
                  print("printer list === ${_devices}");
                  print("printer result ===== ${snapshot.data}");
                  return _devices.isNotEmpty ? DropdownButton<String>(
                    icon: Icon(Icons.keyboard_arrow_down_rounded, size: 35,
                      color: Colors.black,),
                    elevation: 0,
                    underline: Container(
                      decoration: BoxDecoration(
                        border: Border(bottom: BorderSide.none),
                      ),
                    ),
                    hint: SizedBox(
                      width: MediaQuery
                          .of(context)
                          .size
                          .width * .15,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Icon(Icons.print, color: Colors.black, size: 35,),
                          Text("Choose Printer",
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: smallFontSize,
                              color: AppColors.textblack,
                            ),),
                        ],
                      ),
                    ),
                    items: snapshot.data!.map((d) {
                      return DropdownMenuItem<String>(
                        value: d.name ?? "",
                        child: snapshot.data!.isEmpty
                            ? Text("No printer found")
                            : Text("${d.address}"),
                      );
                    }).toList(),
                    onChanged: (_) {},
                  )
                      : SizedBox(
                    width: MediaQuery.of(context).size.width * .15,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                            icon: _isScanning ? Container(
                              width: 20,
                              height: 20,
                              child: CircularProgressIndicator(),
                            ) : Icon(Icons.refresh, color: Colors.black,
                              size: 25,),
                            onPressed: () {
                              setState(() => _isScanning = true);
                              PrinterController.scanPrinter().then((value) {
                                setState(() => _isScanning = false);
                              });
                            }),
                        Text("No printer found",
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: smallFontSize,
                            color: AppColors.textblack,
                          ),),
                      ],
                    ),
                  ); //SCAN PRINTER
                } else {
                  return Center(child: Text("no printer found"),);
                }
              }
          ),
        ),
        SizedBox(width: 15,),
        InkWell(
          onTap: () =>
              Navigator.push(context, MaterialPageRoute(
                  builder: (context) => UnderConstractions())),
          child: Container(
            width: 150,
            height: 60,
            decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(10)
            ),
            child: const Center(child: Text("Print Recipe",
              style: TextStyle(
                  color: Colors.white
              ),
            ),),
          ),
        ),
      ],
    );
  }
}
