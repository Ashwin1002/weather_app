import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:weather_app/src/model/weather_model.dart';

import '../../constant/constant_list.dart';

class WeatherAPI {
  static getWeatherAPIFromLatLong(
      {required String lat, required String long}) async {
    var uri = Uri.parse("$baseUrl/current.json?key=$apiKey&q=$lat,$long");
    log("API Check: $uri");
    http.Response response = await http.get(uri);
    if (response.statusCode == 200) {
      log("Success message for weather data from lat long: ${response.body}");
      return WeatherModel.fromJson(jsonDecode(response.body));
    } else {
      log("Status code=> ${response.statusCode}");
    }
  }

  static getWeatherAPIFromName({required String name}) async {
    var uri = Uri.parse("$baseUrl/current.json?key=$apiKey&q==$name&aqi=no");
    log("API Check: $uri");
    http.Response response = await http.get(uri);
    if (response.statusCode == 200) {
      log("Success message for weather data from name: ${response.body}");
      return WeatherModel.fromJson(jsonDecode(response.body));
    } else {
      log("Status code=> ${response.statusCode}");
      log("Error Body => ${jsonDecode(response.body)}");
    }
  }
}
