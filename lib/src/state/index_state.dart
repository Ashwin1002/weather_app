import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather_app/src/model/weather_model.dart';
import 'package:weather_app/src/service/network_helper/weather_api.dart';
import 'package:weather_app/src/service/route_helper/route_name.dart';
import 'package:weather_app/src/utils/shared_preference.dart';

import '../utils/connectivity_check.dart';

class IndexState with ChangeNotifier {
  IndexState();

  late Position? position;
  double? lat;
  double? long;

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

  late String _latitude = "";

  String get latitude => _latitude;

  late String _longitude = "";

  String get longitude => _longitude;

  late TextEditingController _searchController =
      TextEditingController(text: '');

  TextEditingController get searchController => _searchController;

  String? _searchError;

  String? get searchError => _searchError;

  set getLatitude(String value) {
    _latitude = value;

    notifyListeners();
  }

  set getLongitude(String value) {
    _longitude = value;
    notifyListeners();
  }

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

  set getSearchController(value) {
    _searchController = value;
    notifyListeners();
  }

  init() async {
    searchController.text = await SharedPref.getSharedPreferenceData(
        key: 'Search', type: 'String', dValue: '');
    await checkConnection();
  }

  getLocationPermission() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();

    if (!serviceEnabled) {
      await Geolocator.openLocationSettings();
      return Future.error('Location services are disabled');
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    }
    if (permission == LocationPermission.denied) {
      return Future.error('Location permissions are denied');
    }
    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }
    position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    lat = position?.latitude;
    long = position?.longitude;
    getLatitude = lat.toString();
    getLongitude = long.toString();
    return position;
  }

  errorValueClear() {
    _searchError = null;
    notifyListeners();
  }

  bool ifValueContent() {
    if (searchController.text.isNotEmpty) {
      //debugPrint('Password: ${contactController.text}');
      notifyListeners();
      return true;
    }
    return false;
  }

  ifEmpty() {
    if (searchController.text == '' || searchController.text.isEmpty) {
      _searchError = "* Required";
      return false;
    } else {
      return true;
    }
    notifyListeners();
  }

  onButtonPressed() async {
    if (ifEmpty() && ifValueContent()) {
      checkConnection();
    }
    notifyListeners();
  }

  checkConnection() async {
    await ConnectivityCheck.check().then((value) async {
      if (value) {
        getLoading = true;
        Future.delayed(const Duration(seconds: 0), () async {
          if (searchController.text.isEmpty) {
            await getWeatherDataFromLatLongAPI();
          } else {
            SharedPref.setSharedPreferenceData(key: "Search", dValue: searchController.text.trim(), type: 'String');
            await getWeatherDataFromNameAPI();
          }
        });
      } else {
        getLoading = false;
        errorValueClear();
        log("No internet Connection");
      }
    });
    notifyListeners();
  }

  getWeatherDataFromLatLongAPI() async {
    try {
      WeatherModel weatherModel = await WeatherAPI.getWeatherAPIFromLatLong(
          lat: _latitude, long: _longitude);

      _locationDataModel = weatherModel.location!;
      _weatherDataModel = weatherModel.current!;
      getLoading = false;

      log("location details => ${jsonEncode(_locationDataModel)}");
      log("current weather details => ${jsonEncode(_weatherDataModel)}");
    } catch (e) {
      log("error => ${e.toString()}");
      getLoading = false;
    }
    notifyListeners();
  }

  getWeatherDataFromNameAPI() async {
    try {
      WeatherModel weatherModel = await WeatherAPI.getWeatherAPIFromName(
        name: _searchController.text.trim(),
      );

      errorValueClear();
      _locationDataModel = weatherModel.location!;
      _weatherDataModel = weatherModel.current!;
      getLoading = false;

      log("location details => ${jsonEncode(_locationDataModel)}");
      log("current weather details => ${jsonEncode(_weatherDataModel)}");
    } catch (e) {
      getLoading = false;
      log("error => ${e.toString()}");
    }
    notifyListeners();
  }

  navigateUser() async {
    Navigator.of(_context).pushNamed(splashPath);
    notifyListeners();
  }
}
