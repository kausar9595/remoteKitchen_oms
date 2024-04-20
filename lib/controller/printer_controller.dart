import 'dart:convert';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:bluetooth_print/bluetooth_print.dart';
import 'package:bluetooth_print/bluetooth_print_model.dart';
import 'package:oms/model/order_model/order_list_model.dart';
import 'package:oms/widget/app_alert.dart';

class PrinterController{
  static BluetoothPrint bluetoothPrint = BluetoothPrint.instance;

  //scan printer
  static Future scanPrinter(){
   return bluetoothPrint.startScan(timeout: Duration(seconds: 3));
  }

  //receipt print
  static Future printReceipt(BuildContext context, OrderResult orderResult, BluetoothDevice selectedDevice)async{
    try{
      Map<String, dynamic> config = Map();

      List<LineText> list = [];

      list.add(LineText(type: LineText.TYPE_TEXT, content: '**********************************************', weight: 1, align: LineText.ALIGN_CENTER,linefeed: 1));
      list.add(LineText(type: LineText.TYPE_TEXT, content: 'ChatChef', weight: 1, align: LineText.ALIGN_CENTER, fontZoom: 2, linefeed: 1));
      list.add(LineText(linefeed: 1));

      list.add(LineText(type: LineText.TYPE_TEXT, content: '------------------- Order Details ---------------------', weight: 1, align: LineText.ALIGN_CENTER, linefeed: 1));
      list.add(LineText(type: LineText.TYPE_TEXT, content: 'Order Id: ${orderResult.orderId}', weight: 1, align: LineText.ALIGN_LEFT, linefeed: 1));
      list.add(LineText(type: LineText.TYPE_TEXT, content: 'Order Type: ${orderResult.orderType}', weight: 1, align: LineText.ALIGN_LEFT, linefeed: 1));
      if(orderResult.orderType != "pickup"){
        list.add(LineText(type: LineText.TYPE_TEXT, content: 'Delivery Platform: ${orderResult.deliveryPlatform}', weight: 1, align: LineText.ALIGN_LEFT, linefeed: 1));
        list.add(LineText(type: LineText.TYPE_TEXT, content: 'Delivery address: ${orderResult.dropoffAddress}', weight: 1, align: LineText.ALIGN_LEFT, linefeed: 1));
      }
      list.add(LineText(linefeed: 1));

      list.add(LineText(type: LineText.TYPE_TEXT, content: '------------------- Order Items ---------------------', weight: 1, align: LineText.ALIGN_CENTER, linefeed: 1));

      //show order detisl in loop
      for(var i =0; i<orderResult.orderitemSet!.length; i++){
        //order item details
        list.add(LineText(type: LineText.TYPE_TEXT, content: '${orderResult.orderitemSet![i]!.menuItem!.name}', weight: 1, align: LineText.ALIGN_LEFT, x: 0,relativeX: 0, linefeed: 0));
        //order item printer
        list.add(LineText(type: LineText.TYPE_TEXT, content: '${orderResult.orderitemSet![i]!.quantity} X ${orderResult.currency} \$${orderResult.orderitemSet![i]!.menuItem!.basePrice}', weight: 1, align: LineText.ALIGN_LEFT, x: 0,relativeX: 0, linefeed: 0));

      }
      list.add(LineText(linefeed: 1));
      list.add(LineText(type: LineText.TYPE_TEXT, content: '-------------------------------------------', weight: 1, align: LineText.ALIGN_CENTER, linefeed: 1));
      list.add(LineText(linefeed: 1));

      list.add(LineText(type: LineText.TYPE_TEXT, content: 'Subtotal: ', weight: 1, align: LineText.ALIGN_LEFT, x: 0,relativeX: 0, linefeed: 1));
      list.add(LineText(type: LineText.TYPE_TEXT, content: '${orderResult.currency} \$${orderResult.subtotal}', weight: 1, align: LineText.ALIGN_RIGHT, x: 350, relativeX: 0, linefeed: 1));
      // list.add(LineText(type: LineText.TYPE_TEXT, content: 'Tax: ', weight: 1, align: LineText.ALIGN_LEFT, x: 0,relativeX: 0, linefeed: 1));
      // list.add(LineText(type: LineText.TYPE_TEXT, content: '${orderResult.currency} \$${orderResult.tax}', weight: 1, align: LineText.ALIGN_RIGHT, x: 350, relativeX: 0, linefeed: 1));

      list.add(LineText(type: LineText.TYPE_TEXT, content: 'Total: ', weight: 1, align: LineText.ALIGN_LEFT, x: 0,relativeX: 0, linefeed: 1));
      list.add(LineText(type: LineText.TYPE_TEXT, content: '${orderResult.total} \$${orderResult.subtotal}', weight: 1, align: LineText.ALIGN_RIGHT, x: 350, relativeX: 0, linefeed: 1));

      list.add(LineText(linefeed: 1));
      list.add(LineText(type: LineText.TYPE_TEXT, content: '-------------------------------------------', weight: 1, align: LineText.ALIGN_CENTER, linefeed: 1));
      list.add(LineText(linefeed: 1));

      list.add(LineText(type: LineText.TYPE_TEXT, content: 'Thank you! Hope you enjoy your meal.', weight: 1, align: LineText.ALIGN_LEFT, x: 0,relativeX: 0, linefeed: 1));


      list.add(LineText(type: LineText.TYPE_TEXT, content: '**********************************************', weight: 1, align: LineText.ALIGN_CENTER,linefeed: 1));
      list.add(LineText(linefeed: 1));

      await bluetoothPrint.printReceipt(config, list).then((value) {
        if(value){
          AppSnackBar(context, "Print Recipe", Colors.green);
        }
      });
    }catch(e){
      print("Printer error: $e");
      AppSnackBar(context, "Printer error: $e", Colors.green);
    }
  }





}