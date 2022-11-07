import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/src/constant/constant_list.dart';
import 'package:weather_app/src/service/route_helper/route_name.dart';
import 'package:weather_app/src/state/splash_state.dart';
import 'package:weather_app/src/widget/widget_space.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Provider.of<SplashState>(context, listen: false).getContext = context;
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      body: Consumer<SplashState>(builder: (context, state, child) {
        return SafeArea(
          child: Stack(
            children: [
              Container(
                alignment: Alignment.center,
                margin:
                    const EdgeInsets.symmetric(horizontal: 4.0, vertical: 4.0),
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(AssetsList.splashBorder),
                      fit: BoxFit.fill,
                      opacity: 0.5,
                      colorFilter: const ColorFilter.mode(
                          Colors.white, BlendMode.color)),
                ),
              ),
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  // crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      height: 100.0,
                      width: 100.0,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(AssetsList.appIcon),
                              fit: BoxFit.cover),
                          borderRadius: BorderRadius.circular(14.0),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey.shade700,
                                spreadRadius: -4,
                                blurRadius: 9.0,
                                offset: const Offset(2, 2))
                          ]),
                    ),
                    verticalSpace(height: 15.0),
                    Text(
                      "We Show Weather For You",
                      style: textTheme.bodyMedium?.copyWith(
                        fontSize: 16.0,
                        fontWeight: FontWeight.w600,
                        color: Colors.grey.shade800,
                        letterSpacing: 0.2,
                      ),
                    ),
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pushReplacementNamed(context, indexPath);
                },
                child: Container(
                  margin: const EdgeInsets.only(bottom: 40.0),
                  alignment: Alignment.center,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Icon(
                        Icons.arrow_circle_right_outlined,
                        color: iconColor,
                        size: 45.0,
                      ),
                      Text(
                        "Skip",
                        style: textTheme.displayMedium?.copyWith(
                          color: Colors.grey.shade700,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        );
      }),
    );
  }
}
