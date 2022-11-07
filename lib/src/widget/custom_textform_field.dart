import 'package:flutter/material.dart';

class CustomFormField extends StatelessWidget {

  CustomFormField({
    Key? key,
    required this.controller,
    required this.hintText,
    required this.onChanged,
    this.maxLines,
    this.textStyle,
    this.hintStyle,
    this.contentPadding,
  }) : super(key: key);

  final TextEditingController controller;
  final String hintText;
  final Function(dynamic value) onChanged;
  int? maxLines;
  TextStyle? textStyle;
  TextStyle? hintStyle;
  EdgeInsetsGeometry? contentPadding;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return TextFormField(
      maxLines: maxLines ?? 1,
      controller: controller,
      validator: (value) {
        return null;
      },
      textInputAction: TextInputAction.done,
      style: textStyle ??
          textTheme.displayMedium
              ?.copyWith(fontSize: 16.0, color: Colors.grey.shade800),
      decoration: InputDecoration(
        filled: true,
        counter: const Offstage(),
        isDense: true,
        hintText: hintText,
        hintStyle: hintStyle ??
            textTheme.displayMedium?.copyWith(
              color: Colors.grey.shade500,
              fontWeight: FontWeight.w400,
              letterSpacing: 0.2,
              overflow: TextOverflow.ellipsis,
              fontSize: 14.0,
            ),
        contentPadding: contentPadding ?? const EdgeInsets.only(
            top: 10.0, bottom: 10.0, left: 12.0, right: 12.0),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5.0),
            borderSide:
                BorderSide(color: Colors.yellow.shade600.withOpacity(0))),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5.0),
          borderSide: BorderSide(color: Colors.grey.shade50.withOpacity(0.5)),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5.0),
        ),
        errorText: null,
      ),
      onChanged: onChanged,
      keyboardType: TextInputType.text,
    );
  }
}
