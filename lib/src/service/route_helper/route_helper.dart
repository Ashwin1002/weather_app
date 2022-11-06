import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:weather_app/src/screen/index/index_screen.dart';
import 'package:weather_app/src/service/route_helper/error_path.dart';
import 'package:weather_app/src/service/route_helper/route_name.dart';

import '../../screen/splash/splash_screen.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splashPath:
        return PageTransition(
          type: PageTransitionType.rightToLeft,
          child: const SplashScreen(),
        );

      case indexPath:
        return PageTransition(
          type: PageTransitionType.rightToLeft,
          child: const IndexScreen(),
        );

      ///
      default:
        return PageTransition(
          type: PageTransitionType.rightToLeft,
          child: const ErrorScreen(),
        );
    }
  }
}
