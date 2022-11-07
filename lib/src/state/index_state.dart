import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:weather_app/src/model/weather_model.dart';
import 'package:weather_app/src/service/network_helper/weather_api.dart';

import '../utils/connectivity_check.dart';

class IndexState with ChangeNotifier {
  IndexState();

  late BuildContext _context;
  late final NavigatorState navigator = Navigator.of(_context);

  BuildContext get context => _context;

  set getContext(BuildContext value) {
    _context = value;
  }

  late CurrentDataModel _weatherDataModel = CurrentDataModel.fromJson({});

  CurrentDataModel get weatherDataModel => _weatherDataModel;

  late LocationDataModel _locationDataModel = LocationDataModel.fromJson({});

  LocationDataModel get locationDataModel => _locationDataModel;

  Timer? timer;

  late bool _isLoading = false;

  bool get isLoading => _isLoading;

  set getLoading(value) {
    _isLoading = value;
    notifyListeners();
  }

  set getCurrentData(value) {
    _weatherDataModel = value;
    notifyListeners();
  }

  set getLocationData(value) {
    _locationDataModel = value;
    notifyListeners();
  }

  init({required String latitude, required String longitude}) async {
    // await checkConnection(
    //     latitude: latitude, longitude: longitude);
    await getWeatherDataFromLatLongAPI(latitude: latitude, longitude: longitude);
  }

  checkConnection({required String latitude, required String longitude}) async {
    await ConnectivityCheck.check().then((value) async {
      if (value) {
        getLoading = true;
        await getWeatherDataFromLatLongAPI(latitude: latitude, longitude: longitude);
      } else {
        getLoading = false;
        log("No internet Connection");
      }
    });
    notifyListeners();
  }

  getWeatherDataFromLatLongAPI(
      {required String latitude, required String longitude}) async {
    try {
      WeatherModel weatherModel = await WeatherAPI.getWeatherAPIFromLatLong(
          lat: latitude, long: longitude);

      _locationDataModel = weatherModel.location!;
      _weatherDataModel = weatherModel.current!;

      getLoading = false;

      log("location details => ${jsonEncode(_locationDataModel)}");
      log("current weather details => ${jsonEncode(_weatherDataModel)}");

    } catch (e) {
      log("error => ${e.toString()}");
    }

    notifyListeners();
  }
}
