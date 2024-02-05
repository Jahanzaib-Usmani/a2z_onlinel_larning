import 'package:a2z_online_learning/Components/custom_heading.dart';
import 'package:a2z_online_learning/Components/custom_image_box.dart';
import 'package:a2z_online_learning/Components/custom_navigtion_bar.dart';
import 'package:a2z_online_learning/Components/custom_text_field.dart';
import 'package:a2z_online_learning/Utils/AppConstant.dart';
import 'package:a2z_online_learning/pages/onboarding3.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../Components/custom_skip_button.dart';

class OnboardingPage2 extends StatelessWidget {
  const OnboardingPage2({super.key});

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
                MaterialPageRoute(builder: (context) => OnboardingPage3()),
              );
            },
          ),
          customImageBox(
              imageName: '${AppConstants.assetsImages}onboarding02.png'),
          SizedBox(
            height: 5.h,
          ),
          CustomHeading(headingText: 'Quick and easy learninig'),
          SizedBox(
            height: 1.h,
          ),
          CustomTextField(
              fieldText:
                  'Easy and fast learning at any time to help you improve various skills'),
          SizedBox(
            height: 4.h,
          ),
          CustomNavigationBar(
              width1: 3.0,
              width2: 7.0,
              width3: 3.0,
              color1: Color(0xff858597),
              color2: Color(0xff3D5CFF),
              color3: Color(0xff858597))
        ],
      ),
    );
  }
}
