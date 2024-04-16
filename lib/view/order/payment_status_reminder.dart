import 'dart:async';
import 'package:flutter/material.dart';
import 'package:oms/model/order_model/order_list_model.dart';
import 'payment_receive_confirmation/payment_receive_confirmation_screen.dart';

abstract class PaymentStatusReminder {
  static Map<int, Timer> reminders = {};

  static void add({required OrderResult orderResult, required int minutes, required BuildContext context}) {
    reminders[orderResult.id ?? 0] = Timer(
      Duration(minutes: minutes),
      () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => PaymentReceiveConfirmationScreen(
              orderResult: orderResult,
            ),
          ),
        );
      },
    );
  }

  static void remove(int id) {
    reminders[id]?.cancel();
  }
}
