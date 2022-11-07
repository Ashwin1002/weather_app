import 'package:flutter/material.dart';

class NoDataWidget extends StatelessWidget {
  const NoDataWidget({Key? key, required this.message}) : super(key: key);

  final String message;

  @override
  Widget build(BuildContext context) {

    final textTheme = Theme.of(context).textTheme;

    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.8,
      width: MediaQuery.of(context).size.width,
      child: Center(
        child: Text(
          message,
          style: textTheme.headlineMedium?.copyWith(
              fontSize: 20.0,
              color: Colors.grey.shade600),
        ),
      ),
    );
  }
}
