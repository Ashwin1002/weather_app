import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/src/constant/constant_list.dart';
import 'package:weather_app/src/screen/index/components/location_info_section.dart';
import 'package:weather_app/src/screen/index/components/search_city_section.dart';
import 'package:weather_app/src/screen/index/components/weather_detail_section.dart';
import 'package:weather_app/src/screen/index/components/weather_section.dart';
import 'package:weather_app/src/state/index_state.dart';
import 'package:weather_app/src/widget/no_data_widget.dart';
import 'package:weather_app/src/widget/widget_space.dart';

class IndexScreen extends StatefulWidget {
  const IndexScreen({Key? key}) : super(key: key);

  @override
  State<IndexScreen> createState() => _IndexScreenState();
}

class _IndexScreenState extends State<IndexScreen> {
  @override
  void initState() {
    super.initState();
    Provider.of<IndexState>(context, listen: false).getContext = context;
    Provider.of<IndexState>(context, listen: false).init();
  }

  @override
  void dispose() {
    super.dispose();
  }

  onBack() {
    SystemNavigator.pop(animated: true);
  }

  @override
  Widget build(BuildContext context) {

    final textTheme = Theme.of(context).textTheme;

    return Consumer<IndexState>(builder: (context, state, child) {
      return Stack(
        alignment: Alignment.topCenter,
        children: [
          Scaffold(
            appBar: AppBar(
              elevation: 0,
              backgroundColor: primaryColor,
              automaticallyImplyLeading: false,
              title: Text(
                'Simple Weather App',
                style: textTheme.headlineMedium?.copyWith(color: Colors.white),
              ),
              actions: [
                IconButton(
                  onPressed: () {
                    state.navigateUser();
                  },
                  icon: const Icon(
                    Icons.logout_outlined,
                    color: Colors.white,
                    size: 25.0,
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
                  child: ListView(
                    children: [
                      verticalSpace(height: 5.0),
                      const SearchCitySection(),
                      if (state.locationDataModel.name.isNotEmpty)
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const LocationInfoSection(),
                            verticalSpace(height: 12.0),
                            const WeatherSection(),
                            verticalSpace(height: 12.0),
                            const WeatherDetailSection()
                          ],
                        )
                      else
                        NoDataWidget(
                          message: state.isLoading
                              ? 'Please Wait...'
                              : 'Location Not Found',
                        ),
                    ],
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
