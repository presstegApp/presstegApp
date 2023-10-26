import 'package:flutter/material.dart';

import '../../../../elements/app_button.dart';
import '../../../../elements/custom_appbar.dart';
import '../number_verification/number_verification_view.dart';
import 'layout/body.dart';

class CarRegistrationView extends StatelessWidget {
  const CarRegistrationView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context),
      body: CarRegistrationBody(),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(right: 18, left: 18, bottom: 10),
        child: AppButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const NumberVerificationView()));
            },
            btnLabel: 'Continue'),
      ),
    );
  }
}
