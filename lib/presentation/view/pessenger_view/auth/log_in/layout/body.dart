import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

import '../../../../../../configuration/frontend_configs.dart';
import '../../../../../elements/app_button.dart';
import '../../../../../elements/auth_field.dart';
import '../../../../../elements/custom_text.dart';
import '../../../../../elements/textfield.dart';
import '../../../bottom_nav_bar/bottom_nav_bar_view.dart';
import 'log_in_widget.dart';

class LogInBody extends StatelessWidget {
  LogInBody({Key? key}) : super(key: key);
  // final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    // var width = MediaQuery.of(context).size.width;

    return SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Wellcome",
                style: FrontendConfigs.kHeadingStyle,
              ),
              SizedBox(
                height: 40,
              ),
              Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/images/logo.png"))),
                child: Image.asset(
                  "assets/images/logo.png",
                  height: 140,
                  width: 140,
                ),
              ),
              SizedBox(
                height: height * 0.1,
              ),

              // CustomTextField(
              //     isSecure: false,
              //     controller: _emailController,
              //     icon: "assets/svg/phone.svg",
              //     text: 'Phone Number',
              //     onTap: () {},
              //     keyBoardType: TextInputType.phone),
              // CustomTextFormFieldWithCountryCode(
              //   decoration: InputDecoration(
              //     prefix: CountryCodePicker(),
              //     hintText: 'Enter your phone number',
              //   ),
              //   countryPicker: CountryCodePicker(),
              // ),

              IntlPhoneField(
                controller: _passwordController,
                decoration: InputDecoration(
                  labelText: 'Phone Number',
                  border: OutlineInputBorder(
                    borderSide: BorderSide(),
                  ),
                ),
                initialCountryCode: 'SD',
                onChanged: (phone) {
                  print(phone.completeNumber);
                },
              ),

              // const SizedBox(
              //   height: 18,
              // ),
              // CustomTextField(
              //   controller: _passwordController,
              //   icon: "assets/svg/lock_icon.svg",
              //   text: 'Password',
              //   onTap: () {},
              //   keyBoardType: TextInputType.text,
              //   isPassword: true,
              // ),
              // const SizedBox(
              //   height: 100,
              // ),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.end,
              //   children: [
              //     CustomText(
              //       text: 'Forgot Password?',
              //       fontSize: 16,
              //       fontWeight: FontWeight.w600,
              //     )
              //   ],
              // ),
              SizedBox(
                height: height * 0.19,
              ),
              AppButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const BottomNavBarView()));
                  },
                  btnLabel: "Log in"),
              // const SizedBox(
              //   height: 80,
              // ),
              // Row(
              //   children: [
              //     Expanded(
              //         child: Divider(
              //       color: FrontendConfigs.kIconColor,
              //     )),
              //     const SizedBox(
              //       width: 12,
              //     ),
              //     CustomText(
              //       text: "Or continue with",
              //       fontSize: 16,
              //     ),
              //     const SizedBox(
              //       width: 12,
              //     ),
              //     Expanded(
              //         child: Divider(
              //       color: FrontendConfigs.kIconColor,
              //     )),
              //   ],
              // ),
              // const SizedBox(
              //   height: 24,
              // ),
              // Padding(
              //   padding: const EdgeInsets.all(4.0),
              //   child: Row(
              //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //     children: const [
              //       LogInWidget(logo: "assets/images/facebook.png"),
              //       LogInWidget(logo: "assets/images/google.png"),
              //       LogInWidget(logo: "assets/images/iphone.png"),
              //     ],
              //   ),
              // )
            ],
          ),
        ),
      ),
    );
  }
}
