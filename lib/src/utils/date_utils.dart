import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

///Converting Date format to Month Day, Year e.g.(Aug 8, 2022)
getDateFormat({required String dateData}) async {
  debugPrint("Date => $dateData");
  DateTime convDate = DateTime.parse(dateData);
  DateFormat date = DateFormat.yMMMd();
  String finalDate = date.format(convDate);

  log("converted date => $finalDate");
  return finalDate;
}

getTimeFormat({required String timeData}) async {
  var newTime = timeData.split(":").first;
  log("newTime => $newTime");

  if (int.parse(newTime) >= 0 && int.parse(newTime) <= 11) {
    log('AM');
     return "AM";

  } else {
    log('PM');
    return "PM";
  }
}
