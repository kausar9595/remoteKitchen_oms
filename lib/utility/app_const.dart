
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

double smallFontSize = 4.00.sp;
double normalFontSize = 5.00.sp;
double bigFontSize = 10.00.sp;
double titleFontSize = 7.00.sp;



String convertPacificTimeZoon(time){
  String dateTimeString = time;
  DateTime dateTime = DateTime.parse(dateTimeString);
  DateTime ptTime = convertPSTtoPT(dateTime);
  String formattedDateTime = DateFormat('yyyy-MM-dd hh:mm a').format(ptTime);
  return formattedDateTime;
}

/// Function to convert Pacific Standard Time (PST) to Pacific Time (PT)
/// considering Daylight Saving Time (DST).
DateTime convertPSTtoPT(DateTime dateTime) {
  DateTime utcTime = dateTime.toUtc();
  DateTime ptTime = utcTime.add(const Duration(hours: -8)); // Adjust for PT

  // Optional check for DST (can be removed if DST is not a concern)
  if (isDSTObservedInPT(ptTime)) {
    ptTime = ptTime.add(const Duration(hours: 1)); // Adjust for DST
  }
  return ptTime;
}

/// Function to check if Daylight Saving Time (DST) is observed in Pacific Time (PT)
/// for the given date and time (optional).
///
/// This implementation is a simplified example and might not be
/// entirely accurate for all cases. You can refer to a more comprehensive DST
/// library for a more precise check.
bool isDSTObservedInPT(DateTime ptTime) {
  // Simplified DST check (assuming standard DST rules):
  // - DST starts on the second Sunday of March at 2:00 AM.
  // - DST ends on the first Sunday of November at 2:00 AM.
  final marchStart = DateTime(ptTime.year, 3, 1);
  final novemberStart = DateTime(ptTime.year, 11, 1);
  final secondSundayOfMarch = marchStart.add(Duration(days: (DateTime.sunday - marchStart.weekday) % 7, hours: 14));
  final firstSundayOfNovember = novemberStart.add(Duration(days: (DateTime.sunday - novemberStart.weekday) % 7, hours: 14));

  return ptTime.isAfter(secondSundayOfMarch) && ptTime.isBefore(firstSundayOfNovember);
}