import 'dart:async';

import 'package:flutter/material.dart';
import '../../onboarding/onboarding_view.dart';

class SplashBody extends StatefulWidget {
  const SplashBody({Key? key}) : super(key: key);

  @override
  State<SplashBody> createState() => _SplashBodyState();
}

class _SplashBodyState extends State<SplashBody> {
  @override
  void initState() {
    Timer(
        const Duration(seconds: 3),
        () => Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const OnBoardingView())));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            "assets/images/logo.png",
            height: 200,
            width: 200,
          ),
          const SizedBox(
            height: 16,
          ),
          // RichText(
          //     text: const TextSpan(
          //         text: "Be your own ",
          //         style: TextStyle(
          //             color:Color(0xff2F2E41),
          //             fontWeight: FontWeight.w400,
          //             letterSpacing:2,
          //             fontSize: 16),children: [
          //         TextSpan(
          //         text: "Concierge.",
          //         style: TextStyle(
          //             color: Colors.red,
          //             fontWeight: FontWeight.w600,
          //             letterSpacing:2,
          //             fontSize: 16),)
          //     ]))
        ],
      ),
    );
  }
}
