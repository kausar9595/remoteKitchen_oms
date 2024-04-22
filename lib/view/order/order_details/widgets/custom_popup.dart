import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:oms/utility/app_const.dart';

import '../../../../utility/appcolor.dart';

Future<void> CustomPopup({
  required BuildContext context,
  required Widget Texttitle,
  required Widget child,

}) async {
  return showDialog<void>(
    context: context,
    //barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
          content: Container(
            padding: EdgeInsets.all(10),
            height: MediaQuery.of(context).size.height*0.40,
            width: MediaQuery.of(context).size.width*0.30,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Align(
                  alignment: Alignment.centerRight,
                  child: IconButton(
                    onPressed: (){
                      Navigator.pop(context);
                    },
                    icon: Icon(Icons.cancel_outlined,color: Colors.red,size: 40,),
                  ),
                ),
                Texttitle,
                SizedBox(height: 25,),
                child


              ],
            ),
          ),
        );

    },
  );
}