import 'package:bluetooth_print/bluetooth_print.dart';
import 'package:bluetooth_print/bluetooth_print_model.dart';
import 'package:flutter/material.dart';
import 'package:oms/widget/app_alert.dart';

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
  late BluetoothDevice _selectedDevice;
  BluetoothPrint bluetoothPrint = BluetoothPrint.instance;

  bool _isScanning = false;
  bool _isPrinting = false;

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
          height: 60,
          width: MediaQuery
              .of(context)
              .size
              .width * .20,
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
                  return _devices.isNotEmpty ? InkWell(
                    onTap: ()=>_choosePrinterPopup(),
                    child: SizedBox(
                      height: 60,
                      width: MediaQuery.of(context).size.width * .15,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                        Icon(Icons.print, size: 30,),
                          _selectedDevice != null ? Text("Choose Printer",
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: smallFontSize,
                              color: AppColors.textblack,
                            ),):  Text("${_selectedDevice.name}",
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: smallFontSize,
                              color: AppColors.textblack,
                            ),),
                        ],
                      ),
                    ),
                  )
                      : SizedBox(
                          height: 60,
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
          onTap: (){
            setState(() => _isPrinting = true);
            if(_devices.isNotEmpty && _selectedDevice != null && _selectedDevice.address != null){
              PrinterController.printReceipt(context, widget.orderResult, _selectedDevice);
            }else{
              AppSnackBar(context, "Printer is connected but face some issues to print", Colors.red);
            }
            setState(() => _isPrinting = false);

          },
          child: Container(
            width: 150,
            height: 60,
            decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(10)
            ),
            child:  Center(child: _isPrinting ? CircularProgressIndicator(color: Colors.white,) : Text("Print Recipe",
              style: TextStyle(
                  color: Colors.white
              ),
            ),),
          ),
        ),
      ],
    );
  }

  Future<void> _choosePrinterPopup() {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: SizedBox(
            height: 40,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Select Printer'),
                InkWell(
                  onTap: ()=>Navigator.pop(context),
                  child: Icon(Icons.close, color: Colors.red,),
                )
              ],
            ),
          ),
          content: StatefulBuilder(
            builder: (context, setState) {
              return SizedBox(
                height: MediaQuery.of(context).size.height*.50,
                width: MediaQuery.of(context).size.width * .30,
                child: _devices.isNotEmpty ? ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: _devices.length,
                  itemBuilder: (_, index){
                    return ListTile(
                      onTap: (){
                        setState(() {
                          bluetoothPrint.connect(_devices[index]).then((value) {
                            if(value){
                              AppSnackBar(context, "Printer is connected: ${_selectedDevice.name}", Colors.green);
                            }else{
                              AppSnackBar(context, "Printer is not connected", Colors.red);
                            }
                          });

                          _selectedDevice = _devices[index];
                        });
                        Navigator.pop(context);
                      },
                      leading: Icon(Icons.print, ),
                      title: Text("${_devices[index].name}"),
                      subtitle: Text("${_devices[index].address}"),
                    );
                  },
                ) : Center(child: Text("No printer is online."),),
              );
            }
          ),
        );
      },
    );
  }
}
