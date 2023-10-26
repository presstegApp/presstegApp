import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../../configuration/frontend_configs.dart';
class HomeField extends StatelessWidget {
  HomeField(
      {Key? key,
      required this.svg,
      required this.hint,
      required this.controller,
      required this.inputType})
      : super(key: key);
  final String svg;
  final String hint;
  TextInputType inputType;
  TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 49,
      child: TextFormField(
        keyboardType: inputType,
        controller: controller,
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: TextStyle(
              color: FrontendConfigs.kIconColor,
              fontSize: 14,
              letterSpacing: 1.5,
              fontWeight: FontWeight.w400),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: BorderSide.none),
          fillColor: FrontendConfigs.kAuthColor,
          filled: true,
          suffixIcon: Padding(
            padding: const EdgeInsets.all(15.0),
            child: SvgPicture.asset(svg),
          ),
        ),
      ),
    );
  }
}
