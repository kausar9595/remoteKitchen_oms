import 'package:flutter/material.dart';
import 'package:oms/utility/appcolor.dart';


AppSnackBar(context, text, color){
  return ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Text("$text"),
    duration: Duration(milliseconds: 2000),
    backgroundColor: color,
  ));
}


Future<void> appPopup({
  required BuildContext context,
  required String id,
  required String title,
  required Widget child,
  required VoidCallback okClick,
  }) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(title),
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              child
            ],
          ),
        ),
        actions: <Widget>[
          TextButton(
            child:  Text('Yes'),
            onPressed: okClick
          ),
          TextButton(
            child: const Text('Close'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}


Future<void> appLoading(context) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        content: SingleChildScrollView(
          child: Center(
            child: CircularProgressIndicator(color: AppColors.textindigo,),
          )
        ),
      );
    },
  );
}