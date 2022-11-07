import 'package:flutter/material.dart';
import 'package:provider/single_child_widget.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/src/state/index_state.dart';
import 'package:weather_app/src/state/splash_state.dart';

///provider list
List<SingleChildWidget> stateList = [
  ChangeNotifierProvider(create: (_) => SplashState()),
  ChangeNotifierProvider(create: (_) => IndexState()),
];

///assets list

class AssetsList {
  static String appIcon = "assets/logo/app_icon.png";
  static String splashBorder = "assets/logo/splash_border.png";
  static String onProgressImage = "assets/lottie_animations/onprogress.json";
}


/// api key
const apiKey = "5938696b04cd4d9fa9d134050220611";

///base Url
const baseUrl = "http://api.weatherapi.com/v1";

/// Primary Color
Color primaryColor = Colors.blue;

/// default Color
Color iconColor = Colors.grey.shade600;
