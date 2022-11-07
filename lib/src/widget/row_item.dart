import 'package:flutter/material.dart';

class RowItem extends StatelessWidget {
  const RowItem({Key? key, required this.rowTitle, required this.rowData}) : super(key: key);

  final String rowTitle;
  final String rowData;

  @override
  Widget build(BuildContext context) {

    final textTheme = Theme.of(context).textTheme;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Expanded(
          flex: 2,
          child: Text(
            rowTitle,
            style: textTheme.headlineLarge?.copyWith(
              fontSize: 12.0,
              fontWeight: FontWeight.w500,
              color: Colors.grey.shade700,
            ),
          ),
        ),
        const Expanded(child: Text(" : ")),
        Expanded(
          child: Text(
            rowData,
            style: textTheme.headlineLarge?.copyWith(
              fontSize: 12.0,
              fontWeight: FontWeight.w500,
              color: Colors.grey.shade700,
            ),
          ),
        ),
      ],
    );
  }
}
