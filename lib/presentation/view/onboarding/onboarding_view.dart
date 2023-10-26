import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';

import '../../../configuration/frontend_configs.dart';
import '../../elements/app_button.dart';
import '../../elements/custom_text.dart';
import '../select_city/select_city_view.dart';
import 'layout/on_boarding_widget.dart';

class OnBoardingView extends StatefulWidget {
  const OnBoardingView({Key? key}) : super(key: key);

  @override
  State<OnBoardingView> createState() => _OnBoardingViewState();
}

class _OnBoardingViewState extends State<OnBoardingView> {
  final List<SliderPage> _pageList = [
    SliderPage(
      svg: 'assets/svg/onboarding_one.svg',
      body: 'We provide easy cab booking solutuin with ',
      title: 'Easy booking',
      subBody: ' reasonable price. ',
    ),
    SliderPage(
      svg: 'assets/svg/onboarding_two.svg',
      body: 'All of the drivers and their vehicles documents ',
      title: 'Verified Drivers',
      subBody: ' are verified by our system ',
    ),
    SliderPage(
      svg: 'assets/svg/onboarding_three.svg',
      body: 'Lets make your day great wth GILAR right now',
      title: 'Lets Get Started',
      subBody: '',
    )
  ];
  PageController controller = PageController();
  int pageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        toolbarHeight: 100,
        backgroundColor: Colors.white,
        elevation: 0,
        leading: pageIndex != 0
            ? IconButton(
                onPressed: () {
                  if (pageIndex == 2) {
                    controller.jumpToPage(1);
                  } else if (pageIndex == 1) {
                    controller.jumpToPage(0);
                  }
                  setState(() {});
                },
                icon: const Icon(
                  Icons.arrow_back,
                  color: Colors.black,
                ))
            : null,
        actions: [
          if (pageIndex == 0)
            TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const SelectCityView()),
                  );
                },
                child: CustomText(
                  text: "Skip",
                  color: FrontendConfigs.kPrimaryColor,
                  fontSize: 16,
                )),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18.0),
        child: Stack(
          children: [
            Positioned.fill(
              bottom: 100,
              child: PageView.builder(
                controller: controller,
                physics: const ScrollPhysics(),
                onPageChanged: (val) {
                  pageIndex = val;
                  setState(() {});
                },
                itemCount: _pageList.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (BuildContext context, i) {
                  return _pageList[i];
                },
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SizedBox(
                  // height: 60,
                  child: DotsIndicator(
                    dotsCount: 3,
                    position: int.parse(pageIndex.toString()),
                    decorator: DotsDecorator(
                      activeColor: const Color(0xFF2DBB54),
                      color: FrontendConfigs.kIconColor,
                      size: const Size.square(9.0),
                      activeSize: const Size(27.0, 8.0),
                      activeShape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0)),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                AppButton(
                  onPressed: () {
                    if (pageIndex == 0) {
                      controller.jumpToPage(1);
                    } else if (pageIndex == 1) {
                      controller.jumpToPage(2);
                    } else if (pageIndex == 2) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const SelectCityView()));
                    }
                    setState(() {});
                  },
                  btnLabel: pageIndex <= 1 ? 'Next' : 'Skip',
                ),
                const SizedBox(
                  height: 18,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
