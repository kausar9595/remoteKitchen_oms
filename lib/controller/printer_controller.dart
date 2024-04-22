import 'dart:convert';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:bluetooth_print/bluetooth_print.dart';
import 'package:bluetooth_print/bluetooth_print_model.dart';
import 'package:oms/model/order_model/order_list_model.dart';
import 'package:oms/widget/app_alert.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PrinterController{
  static BluetoothPrint bluetoothPrint = BluetoothPrint.instance;

  //scan printer
  static Future scanPrinter(){
   return bluetoothPrint.startScan(timeout: Duration(seconds: 3));
  }

  //receipt print
  static Future printReceipt(BuildContext context, OrderResult orderResult)async{
    try{
      SharedPreferences _pref = await SharedPreferences.getInstance();
      var resturantName = _pref.getString("restaurant_name");
      Map<String, dynamic> config = Map();

      // Define the width of the paper and adjust text positions accordingly
      int paperWidth = 400; // Adjust this value based on the width of your paper

// Define the positions and alignment of your text elements based on paper width
      int leftAlignX = 0;
      int rightAlignX = paperWidth - 80; // Adjust this value based on the width reserved for right-aligned content

// Calculate the y-position based on the relative position
      int startY = 200; // Adjust this value based on the initial y-position
      double lineHeight = 20; // Adjust this value based on the height of each line of text


      List<LineText> list = [];
      //
       list.add(LineText(type: LineText.TYPE_TEXT, content: '${resturantName}', weight: 3, align: LineText.ALIGN_CENTER, fontZoom: 2, linefeed: 1));
      list.add(LineText(type: LineText.TYPE_TEXT, content: '******************************', weight: 1, align: LineText.ALIGN_CENTER,linefeed: 1));
      list.add(LineText(linefeed: 1));

      list.add(LineText(type: LineText.TYPE_TEXT, content: 'Order Id: ${orderResult.orderId}', weight: 0, align: LineText.ALIGN_LEFT, linefeed: 1));
      list.add(LineText(type: LineText.TYPE_TEXT, content: 'Order Type: ${orderResult.orderMethod}', weight: 0, align: LineText.ALIGN_LEFT, linefeed: 1));
      if(orderResult.orderMethod != "pickup"){
        list.add(LineText(type: LineText.TYPE_TEXT, content: 'Delivery Platform: ${orderResult.deliveryPlatform}', weight: 0, align: LineText.ALIGN_LEFT, linefeed: 1));
        list.add(LineText(type: LineText.TYPE_TEXT, content: 'Delivery address: ${orderResult.dropoffAddress}', weight: 0, align: LineText.ALIGN_LEFT, linefeed: 1));
      }
      list.add(LineText(linefeed: 1));

      list.add(LineText(type: LineText.TYPE_TEXT, content: 'Order Items', weight: 3, align: LineText.ALIGN_CENTER, linefeed: 1));
      list.add(LineText(linefeed: 1));

      //show order detisl in loop
      for(var i =0; i<orderResult.orderitemSet!.length; i++){
        //order item details
        list.add(LineText(
            type: LineText.TYPE_TEXT, content: '${orderResult.orderitemSet![i]!.menuItem != null ? orderResult.orderitemSet![i]!.menuItem!.name : "Item name is empty"}   -   ', weight: 0, align: LineText.ALIGN_LEFT, x: leftAlignX, relativeX: 0, y: startY, linefeed: 0));
        //order item printer
        list.add(LineText(
            type: LineText.TYPE_TEXT, content: '${orderResult.orderitemSet![i]!.quantity} X \$${orderResult.orderitemSet![i]!.menuItem != null ? orderResult.orderitemSet![i]!.menuItem!.basePrice : "0.00"}',  weight: 0, align: LineText.ALIGN_RIGHT, x: rightAlignX, relativeX: 0, y: startY, linefeed: 1));

      }
       list.add(LineText(linefeed: 1));
      list.add(LineText(type: LineText.TYPE_TEXT, content: '------------------------------------', weight: 1, align: LineText.ALIGN_CENTER, linefeed: 1));
      list.add(LineText(linefeed: 1));

      // Add your text elements with adjusted positions
      list.add(LineText(type: LineText.TYPE_TEXT, content: 'Subtotal: ', weight: 0, align: LineText.ALIGN_LEFT, x: leftAlignX, relativeX: 0, y: startY, linefeed: 0));
      list.add(LineText(type: LineText.TYPE_TEXT, content: '\$${orderResult.subtotal}', weight: 0, align: LineText.ALIGN_RIGHT, x: rightAlignX, relativeX: 0, y: startY, linefeed: 1));

      // list.add(LineText(type: LineText.TYPE_TEXT, content: 'Tax: ', weight: 0,align: LineText.ALIGN_LEFT, x: leftAlignX, relativeX: 0, y: startY, linefeed: 0));
      // list.add(LineText(type: LineText.TYPE_TEXT, content: '\$${orderResult.tax}', weight: 0, align: LineText.ALIGN_RIGHT, x: rightAlignX, relativeX: 0, y: startY, linefeed: 1));
      //
      // list.add(LineText(type: LineText.TYPE_TEXT, content: 'Delivery Fee: ', weight: 0,align: LineText.ALIGN_LEFT, x: leftAlignX, relativeX: 0, y: startY, linefeed: 0));
      // list.add(LineText(type: LineText.TYPE_TEXT, content: '\$${orderResult.tax}', weight: 0, align: LineText.ALIGN_RIGHT, x: rightAlignX, relativeX: 0, y: startY, linefeed: 1));

      list.add(LineText(type: LineText.TYPE_TEXT, content: 'Total: ', weight: 0, align: LineText.ALIGN_LEFT, x: leftAlignX, relativeX: 0, y: startY, linefeed: 0));
      list.add(LineText(type: LineText.TYPE_TEXT, content: '\$${orderResult.total}', weight: 0, align: LineText.ALIGN_RIGHT, x: rightAlignX, relativeX: 0, y: startY, linefeed: 1));

      list.add(LineText(linefeed: 1));
      list.add(LineText(type: LineText.TYPE_TEXT, content: '------------------------------------', weight: 1, align: LineText.ALIGN_CENTER, linefeed: 1));
      list.add(LineText(linefeed: 1));

      list.add(LineText(type: LineText.TYPE_TEXT, content: 'Thank you! Hope you enjoy your meal.', weight: 0, align: LineText.ALIGN_LEFT, x: 0,relativeX: 0, linefeed: 1));


      list.add(LineText(type: LineText.TYPE_TEXT, content: '******************************************', weight: 1, align: LineText.ALIGN_CENTER,linefeed: 1));
      list.add(LineText(linefeed: 1));
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


  //save printer connection
  static Future savePrinterConnection(String printerName)async{
    SharedPreferences _pref = await SharedPreferences.getInstance();
    _pref.setString("printer_name", printerName);
  }

  //save printer connection
  static Future<String> getSavePrinter()async{
    SharedPreferences _pref = await SharedPreferences.getInstance();
    return _pref.getString("printer_name").toString();
  }







}