import 'package:a2z_online_learning/Components/custom_heading.dart';
import 'package:a2z_online_learning/Components/custom_image_box.dart';
import 'package:a2z_online_learning/Components/custom_navigtion_bar.dart';
import 'package:a2z_online_learning/Components/custom_text_field.dart';
import 'package:a2z_online_learning/Utils/AppConstant.dart';
import 'package:a2z_online_learning/screens/Home/home_screen.dart';
import 'package:a2z_online_learning/screens/Log%20_In/login_screen.dart';
import 'package:a2z_online_learning/screens/Sign_Up/signup_screen.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../Components/custom_skip_button.dart';

class OnboardingPage3 extends StatelessWidget {
  const OnboardingPage3({super.key});

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
                MaterialPageRoute(builder: (context) => HomeScreen()),
              );
            },
          ),
          customImageBox(
              imageName: '${AppConstants.assetsImages}onboarding03.png'),
          SizedBox(
            height: 5.h,
          ),
          CustomHeading(headingText: 'Create your study plan'),
          SizedBox(
            height: 1.h,
          ),
          CustomTextField(
              fieldText:
                  'Study according to the study plan, make study more motivated'),
          SizedBox(
            height: 4.h,
          ),
          CustomNavigationBar(
            width1: 3.0,
            width2: 3.0,
            width3: 7.0,
            color1: Color(0xff858597),
            color2: Color(0xff858597),
            color3: Color(0xff3D5CFF),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SignUpScreen()));
                    },
                    style: ElevatedButton.styleFrom(
                      fixedSize: Size(40.w, 7.h),
                      foregroundColor: Colors.amber,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(07),
                        ),
                      ),
                      primary: Colors.blue,
                    ),
                    child: Text(
                      "Sign Up",
                      style: TextStyle(color: Colors.white, fontSize: 15.0),
                    )),
                SizedBox(
                  width: 3.w,
                ),
                ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => LoginScreen()));
                    },
                    style: ElevatedButton.styleFrom(
                        fixedSize: Size(40.w, 7.h),
                        foregroundColor: Colors.amber,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(07),
                          ),
                        ),
                        side: const BorderSide(
                          width: 0.5,
                          color: Colors.grey,
                        ),
                        primary: Colors.white),
                    child: Text(
                      "Log in",
                      style: TextStyle(color: Colors.blue, fontSize: 15.0),
                    )),
              ],
            ),
          )
        ],
      ),
    );
  }
}
