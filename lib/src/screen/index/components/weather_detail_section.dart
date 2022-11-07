import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../state/index_state.dart';
import '../../../widget/row_item.dart';
import '../../../widget/widget_space.dart';

class WeatherDetailSection extends StatelessWidget {
  const WeatherDetailSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    var state = context.watch<IndexState>();

    return Column(
      children: [
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
              value: state.isNotHidden,
              onChanged: (value) {
                state.changeSwitchState();
              },
            )
          ],
        ),
        verticalSpace(height: 12.0),
        state.isNotHidden == true
            ? Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12.0),
                    border:
                        Border.all(color: Colors.grey.shade300, width: 0.5)),
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
                      rowData: state.weatherDataModel.windDir.toString(),
                    ),
                    RowItem(
                      rowTitle: 'Humidity',
                      rowData: state.weatherDataModel.humidity.toString(),
                    ),
                    RowItem(
                      rowTitle: 'Feels Like in \u2103',
                      rowData: '${state.weatherDataModel.feelslikeC} \u2103',
                    ),
                    RowItem(
                      rowTitle: 'Feels Like in \u2109',
                      rowData: '${state.weatherDataModel.feelslikeF}  \u2109',
                    ),
                  ],
                ),
              )
            : const SizedBox()
      ],
    );
  }
}
