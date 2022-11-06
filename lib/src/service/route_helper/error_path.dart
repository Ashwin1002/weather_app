import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../constant/constant_list.dart';
import '../../widget/widget_space.dart';

class ErrorScreen extends StatelessWidget {
  const ErrorScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: Text(
          'On Process',
          // style: appTextStyle,
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Lottie.asset(AssetsList.onProgressImage,
                  animate: true, width: double.infinity, height: 200.0),
              verticalSpace(),
              Container(
                width: MediaQuery.of(context).size.width,
                alignment: Alignment.center,
                padding:
                const EdgeInsets.symmetric(horizontal: 0.0, vertical: 8.0),
                decoration: BoxDecoration(
                    color: Colors.grey.shade100,
                    borderRadius: BorderRadius.circular(6.0),
                    border: Border.all(color: iconColor, width: 0.5)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 10.0,
                      width: 10.0,
                      padding: const EdgeInsets.symmetric(
                          vertical: 8.0, horizontal: 4.0),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            image: Image.asset(AssetsList.appIcon).image),
                      ),
                    ),
                    horizontalSpace(),
                    Container(
                      alignment: Alignment.center,
                      child: Text(
                        'On Process...',
                        // style: labelTextStyle.copyWith(
                        //     fontSize: 12.sp, fontWeight: FontWeight.w500),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
