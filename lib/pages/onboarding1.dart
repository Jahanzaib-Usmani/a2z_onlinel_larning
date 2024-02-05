//import 'dart:ui';
import 'package:a2z_online_learning/Components/custom_heading.dart';
import 'package:a2z_online_learning/Components/custom_image_box.dart';
import 'package:a2z_online_learning/Components/custom_navigtion_bar.dart';
import 'package:a2z_online_learning/Components/custom_skip_button.dart';
import 'package:a2z_online_learning/Components/custom_text_field.dart';
import 'package:a2z_online_learning/Utils/AppConstant.dart';
import 'package:a2z_online_learning/pages/onboarding2.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class OnboardingPage1 extends StatelessWidget {
  const OnboardingPage1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          CustomSkipButton(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => OnboardingPage2()),
              );
            },
          ),
          customImageBox(
              imageName: '${AppConstants.assetsImages}onboarding01.png'),
          SizedBox(
            height: 5.h,
          ),
          CustomHeading(headingText: 'Numerous free trial courses'),
          SizedBox(
            height: 1.h,
          ),
          CustomTextField(
              fieldText: 'Free courses for you to find your way to learning'),
          SizedBox(
            height: 4.h,
          ),
          CustomNavigationBar(
              width1: 7.0,
              width2: 3.0,
              width3: 3.0,
              color1: Color(0xff3D5CFF),
              color2: Color(0xff858597),
              color3: Color(0xff858597))
        ],
      ),
    );
  }
}
