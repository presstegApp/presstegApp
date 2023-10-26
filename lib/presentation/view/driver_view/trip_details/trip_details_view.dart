import 'package:flutter/material.dart';
import '../../../master.dart';
import 'layout/body.dart';

class TripDetailsView extends StatelessWidget {
  const TripDetailsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context, showText: true, text: 'Trip Detail'),
      body: TripDetailsBody(),
    );
  }
}
