import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

///Converting Date format to Month Day, Year e.g.(Aug 8, 2022)
getDateFormat({required String dateData}) {
  DateTime convDate = DateTime.parse(dateData);
  DateFormat date = DateFormat.yMMMd();
  String finalDate = date.format(convDate);

  log("converted date => $finalDate");
  return finalDate;
}

// ///Converting Hour format to Hour, Minute and AM/PM e.g.(10:00 AM)
// getHourFormat({required String hourData}) {
//   DateTime convDate = DateTime.parse(hourData);
//   DateFormat date = DateFormat.yMEd().add_jms();
//   String finalTime = date.format(convDate);
//
//   log("converted time => $finalTime");
//   return finalTime;
// }

getAMOrPM({required String hour}) {
  final convTime = TimeOfDay.fromDateTime(DateTime.parse(hour));
  TimeOfDayFormat timeFormat = TimeOfDayFormat.h_colon_mm_space_a;
  // String finalTime = TimeOfDay.;

  log("converted time => $convTime");
  return convTime;
}
