import 'package:flutter/material.dart';

import '../../../elements/custom_text.dart';


class ModeButton extends StatelessWidget {
  const ModeButton({Key? key, required this.btnLabel, required this.btnColor})
      : super(key: key);
  final String btnLabel;
  final Color btnColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 51,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        border: Border.all(color: btnColor, width: 1),
      ),
      child: Center(child: CustomText(text: btnLabel)),
    );
  }
}
