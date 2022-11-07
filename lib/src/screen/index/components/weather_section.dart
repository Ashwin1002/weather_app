import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../constant/constant_list.dart';
import '../../../state/index_state.dart';

class WeatherSection extends StatelessWidget {
  const WeatherSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final textTheme = Theme.of(context).textTheme;

    var state = context.watch<IndexState>();

    return Container(
      margin:
      const EdgeInsets.symmetric(horizontal: 8.0),
      child: Row(
        mainAxisAlignment:
        MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment:
            CrossAxisAlignment.start,
            children: [
              Text(
                '${state.weatherDataModel.tempC}\u2103',
                style: textTheme.bodySmall?.copyWith(
                  fontSize: 35.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey.shade600,
                ),
              ),
              Text(
                state
                    .weatherDataModel.condition!.text,
                style:
                textTheme.headlineLarge?.copyWith(
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
            errorBuilder: (context, url, error) =>
                Container(
                  padding: const EdgeInsets.all(6.0),
                  height: 50.0,
                  width: 50.0,
                  decoration: BoxDecoration(
                    borderRadius:
                    BorderRadius.circular(4.0),
                    image: DecorationImage(
                        image: AssetImage(
                            AssetsList.appIcon)),
                  ),
                ),
          )
        ],
      ),
    );
  }
}
