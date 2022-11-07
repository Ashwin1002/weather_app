import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/src/constant/constant_list.dart';
import 'package:weather_app/src/service/route_helper/route_helper.dart';
import 'package:weather_app/src/service/route_helper/route_name.dart';
import 'package:weather_app/src/utils/theme/theme_config.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: stateList,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Weather App',
        theme: lightTheme,
        initialRoute: splashPath,
        onGenerateRoute: RouteGenerator.generateRoute,
        // home: const MyHomePage(title: 'Flutter Demo Home Page'),
      ),
    );
  }
}

