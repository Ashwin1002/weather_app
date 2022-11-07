import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../../state/index_state.dart';
import '../../../widget/widget_space.dart';


class LocationInfoSection extends StatefulWidget {
  const LocationInfoSection({Key? key}) : super(key: key);

  @override
  State<LocationInfoSection> createState() => _LocationInfoSectionState();
}

class _LocationInfoSectionState extends State<LocationInfoSection> {

  var timeOfDay = "";
  var finalDate = "";

  //Converting Date format to Month Day, Year e.g.(Aug 8, 2022)
  getDateFormat({required String dateData}) async {
    debugPrint("Date => $dateData");
    DateTime convDate = DateTime.parse(dateData);
    DateFormat date = DateFormat.yMMMd();
    finalDate = date.format(convDate);
    log("converted date => $finalDate");
  }

  getTimeFormat({required String timeData}) async {
    var newTime = timeData
        .split(":")
        .first;
    log("newTime => $newTime");

    if (int.parse(newTime) >= 0 && int.parse(newTime) <= 11) {
      log('AM');
      timeOfDay = "AM";
    } else {
      log('PM');
      timeOfDay = "PM";
    }
  }

  @override
  Widget build(BuildContext context) {

    final textTheme = Theme.of(context).textTheme;

    var state = context.watch<IndexState>();

    final dateData = state.locationDataModel.localtime.split(" ").first;

    var time = state.locationDataModel.localtime.split(" ").last;

    if (dateData.isNotEmpty) {
      getDateFormat(dateData: dateData);
    }

    if (time.isNotEmpty) {
      getTimeFormat(timeData: time);
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Today\'s Weather,',
          style: textTheme.headlineLarge?.copyWith(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
              color: Colors.grey.shade800,
              overflow: TextOverflow.ellipsis),
        ),
        verticalSpace(height: 12.0),
        Container(
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.symmetric(
              horizontal: 10.0, vertical: 12.0),
          decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.4),
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "${state.locationDataModel.name}, ${state.locationDataModel.country}",
                style: textTheme.headlineLarge?.copyWith(
                  fontSize: 15.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Text(
                "$finalDate  $time $timeOfDay",
                style: textTheme.headlineLarge?.copyWith(
                    fontSize: 12.0,
                    fontWeight: FontWeight.w500,
                    color: Colors.white),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
