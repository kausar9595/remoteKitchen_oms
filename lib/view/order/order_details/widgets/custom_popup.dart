import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:oms/utility/app_const.dart';

import '../../../../utility/appcolor.dart';

Future<void> CustomPopup({
  required BuildContext context,
  required Widget Texttitle,
  required Widget child,
  bool fizedHeight = true,
}) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return AlertDialog(
        content: Container(
          padding: EdgeInsets.all(10),
          height: fizedHeight ? MediaQuery.of(context).size.height * 0.40 : null,
          width: MediaQuery.of(context).size.width * 0.30,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Align(
                  alignment: Alignment.centerRight,
                  child: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(
                      Icons.cancel_outlined,
                      color: Colors.red,
                      size: 40,
                    ),
                  ),
                ),
                Texttitle,
                SizedBox(
                  height: 25,
                ),
                child
              ],
            ),
          ),
        ),
      );
    },
  );
}
