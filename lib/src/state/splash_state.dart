import 'package:flutter/material.dart';
import 'package:weather_app/src/service/route_helper/route_name.dart';

class SplashState with ChangeNotifier {
  SplashState();

  late BuildContext _context;
  late final NavigatorState navigator = Navigator.of(_context);

  BuildContext get context => _context;

  set getContext(BuildContext value) {
    _context = value;
    _startTimer();
  }

  /// SPLASH SCREEN SHOW TIME
  final int _splashTime = 5;

  int get splashTime => _splashTime;

  void _startTimer() async {
    Future.delayed(Duration(seconds: _splashTime), () async {
      await navigateUser();
    });
  }

  /// NAVIGATE FROM SPLASH TO Index SCREEN
  navigateUser() async {
    navigator.pushReplacementNamed(indexPath);
    notifyListeners();
  }
}
