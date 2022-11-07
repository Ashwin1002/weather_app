import 'dart:async';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/src/constant/constant_list.dart';
import 'package:weather_app/src/state/index_state.dart';
import 'package:weather_app/src/widget/widget_space.dart';
import '../../widget/row_item.dart';

class IndexScreen extends StatefulWidget {
  const IndexScreen({Key? key}) : super(key: key);

  @override
  State<IndexScreen> createState() => _IndexScreenState();
}

class _IndexScreenState extends State<IndexScreen> {
  Timer? timer;
  var timeOfDay = "";
  var finalDate = "";

  @override
  void initState() {
    super.initState();
    Provider.of<IndexState>(context, listen: false).getContext = context;
    timer = Timer(
      const Duration(seconds: 0),
      () {
        Provider.of<IndexState>(context, listen: false).init();
      },
    );
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  ///Converting Date format to Month Day, Year e.g.(Aug 8, 2022)
  getDateFormat({required String dateData}) async {
    debugPrint("Date => $dateData");
    DateTime convDate = DateTime.parse(dateData);
    DateFormat date = DateFormat.yMMMd();
    finalDate = date.format(convDate);

    log("converted date => $finalDate");
  }

  getTimeFormat({required String timeData}) async {
    var newTime = timeData.split(":").first;
    log("newTime => $newTime");

    if (int.parse(newTime) >= 0 && int.parse(newTime) <= 11) {
      timeOfDay = "AM";
      log('AM');
    } else {
      log('PM');
      timeOfDay = "PM";
    }
  }

  onBack() {
    SystemNavigator.pop(animated: true);
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Consumer<IndexState>(builder: (context, state, child) {
      final dateData = state.locationDataModel.localtime.split(" ").first;

      if (dateData.isNotEmpty) {
        getDateFormat(dateData: dateData);
      }

      var time = state.locationDataModel.localtime.split(" ").last;

      if (time.isNotEmpty) {
        getTimeFormat(timeData: time);
      }

      return Stack(
        alignment: Alignment.topCenter,
        children: [
          Scaffold(
            appBar: AppBar(
              elevation: 0,
              backgroundColor: primaryColor,
              automaticallyImplyLeading: false,
              actions: [
                IconButton(
                  onPressed: () {
                    state.navigateUser();
                  },
                  icon: const Icon(
                    Icons.output_outlined,
                    color: Colors.white,
                    size: 30.0,
                  ),
                )
              ],
            ),
            body: WillPopScope(
              onWillPop: () => onBack(),
              child: SafeArea(
                child: Container(
                  color: Colors.grey.shade50,
                  margin: const EdgeInsets.symmetric(horizontal: 12.0),
                  child: Form(
                    onChanged: () {
                      state.errorValueClear();
                    },
                    child: ListView(
                      children: [
                        verticalSpace(height: 5.0),
                        Container(
                          margin: const EdgeInsets.symmetric(vertical: 10.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                flex: 4,
                                child: TextFormField(
                                  maxLines: 1,
                                  controller: state.searchController,
                                  validator: (value) {
                                    return null;
                                  },
                                  textInputAction: TextInputAction.done,
                                  style: textTheme.displayMedium?.copyWith(
                                      fontSize: 16.0,
                                      color: Colors.grey.shade800),
                                  decoration: InputDecoration(
                                    filled: true,
                                    counter: const Offstage(),
                                    isDense: true,
                                    hintText: "Search City / Location",
                                    hintStyle: textTheme.displayMedium?.copyWith(
                                      color: Colors.grey.shade500,
                                      fontWeight: FontWeight.w400,
                                      letterSpacing: 0.2,
                                      overflow: TextOverflow.ellipsis,
                                      fontSize: 14.0,
                                    ),
                                    contentPadding: const EdgeInsets.only(
                                        top: 10.0,
                                        bottom: 10.0,
                                        left: 12.0,
                                        right: 12.0),
                                    focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(5.0),
                                        borderSide: BorderSide(
                                            color: Colors.yellow.shade600
                                                .withOpacity(0))),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(5.0),
                                      borderSide: BorderSide(
                                          color: Colors.grey.shade50
                                              .withOpacity(0.5)),
                                    ),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(5.0),
                                    ),
                                    errorText: state.searchError,
                                  ),
                                  onChanged: (value) {},
                                  keyboardType: TextInputType.text,
                                ),
                              ),
                              horizontalSpace(width: 8.0),
                              Expanded(
                                child: InkWell(
                                  onTap: (){
                                    state.onButtonPressed();
                                  },
                                  child: Container(
                                    margin:
                                        const EdgeInsets.symmetric(vertical: 2.0),
                                    padding: const EdgeInsets.all(10.0),
                                    decoration: BoxDecoration(
                                        color: primaryColor,
                                        borderRadius: BorderRadius.circular(8.0)),
                                    child: Center(
                                      child: Text(
                                        state.searchController.text.isEmpty ? 'Save'
                                        : "Update",
                                        style: textTheme.displayMedium?.copyWith(
                                            color: Colors.white,
                                            fontSize: 12.0,
                                            overflow: TextOverflow.ellipsis),
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        Text(
                          'Today\'s Weather,',
                          style: textTheme.headlineLarge?.copyWith(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey.shade800,
                          ),
                        ),
                        verticalSpace(height: 12.0),
                        Container(
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
                                "${state.locationDataModel.name} ${state.locationDataModel.country}",
                                style: textTheme.headlineLarge?.copyWith(
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
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
                        verticalSpace(height: 12.0),
                        Container(
                          margin: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    '${state.weatherDataModel.tempC} \u00B0',
                                    style: textTheme.bodySmall?.copyWith(
                                      fontSize: 35.0,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.grey.shade600,
                                    ),
                                  ),
                                  Text(
                                    state.weatherDataModel.condition!.text,
                                    style: textTheme.headlineLarge?.copyWith(
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.grey.shade600,
                                    ),
                                    softWrap: true,
                                  )
                                ],
                              ),
                              Image.network(
                                "http:${state.weatherDataModel.condition!.icon}",
                                height: 100.0,
                                width: 100.0,
                                errorBuilder: (context, url, error) => Container(
                                  padding: const EdgeInsets.all(6.0),
                                  height: 50.0,
                                  width: 50.0,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(4.0),
                                    image: DecorationImage(
                                        image: AssetImage(AssetsList.appIcon)),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        verticalSpace(height: 12.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Weather Detail',
                              style: textTheme.headlineMedium?.copyWith(
                                fontSize: 14.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.grey.shade800,
                              ),
                            ),
                            Switch.adaptive(
                              value: false,
                              onChanged: (value) {},
                            )
                          ],
                        ),
                        verticalSpace(height: 12.0),
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 12.0, vertical: 8.0),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(12.0),
                              border: Border.all(
                                  color: Colors.grey.shade300, width: 0.5)),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              RowItem(
                                rowTitle: 'Celsius',
                                rowData: '${state.weatherDataModel.tempC} \u2103',
                              ),
                              RowItem(
                                rowTitle: 'Fahrenheit',
                                rowData: '${state.weatherDataModel.tempF} \u2109',
                              ),
                              RowItem(
                                rowTitle: 'Condition',
                                rowData: state.weatherDataModel.condition!.text,
                              ),
                              RowItem(
                                rowTitle: 'Wind Speed',
                                rowData:
                                    "${state.weatherDataModel.windKph.toString()} Kmph",
                              ),
                              RowItem(
                                rowTitle: 'Wind Direction',
                                rowData:
                                    state.weatherDataModel.windDir.toString(),
                              ),
                              RowItem(
                                rowTitle: 'Humidity',
                                rowData:
                                    state.weatherDataModel.humidity.toString(),
                              ),
                              RowItem(
                                rowTitle: 'Feels Like in \u2103',
                                rowData:
                                    '${state.weatherDataModel.feelslikeC} \u2103',
                              ),
                              RowItem(
                                rowTitle: 'Feels Like in \u2109',
                                rowData:
                                    '${state.weatherDataModel.feelslikeF}  \u2109',
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          if (state.isLoading)
            SafeArea(
              child: Stack(
                children: [
                  Container(color: Colors.black.withAlpha(150)),
                  const LinearProgressIndicator(),
                ],
              ),
            )
        ],
      );
    });
  }
}
