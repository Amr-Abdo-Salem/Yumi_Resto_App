import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomTextFormField extends TextFormField {
  String defaultFontFamily = 'Roboto-Light.ttf';
  double defaultFontSize = 14;
  double defaultIconSize = 17;
  final Icon prefixIcon;
  final String labelText;

  CustomTextFormField({
    Key? key,
    required this.prefixIcon,
    required this.labelText,
    InputDecoration? decoration,
    FormFieldValidator<String>? validator,
    FormFieldSetter<String>? onSaved,
    bool? enabled,
    TextEditingController? controller,
    TextInputType? keyboardType,
    TextInputAction? textInputAction,
  }) : super(
          key: key,
          decoration: decoration ??
              InputDecoration(
                border: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  borderSide: BorderSide(
                    width: 0,
                    style: BorderStyle.solid,
                  ),
                ),
                filled: true,
                prefixIconColor: Color(0xFF666666),
                fillColor: Color(0xFFF2F3F5),
                hintStyle: TextStyle(
                  color: Color(0xFF666666),
                  fontFamily: 'Roboto-Light.ttf',
                  fontSize: 17,
                ),
                labelText: labelText,
                prefixIcon: prefixIcon,
              ),
          validator: validator,
          onSaved: onSaved,
          enabled: enabled,
          controller: controller,
          keyboardType: keyboardType,
          textInputAction: textInputAction,
        );
}
