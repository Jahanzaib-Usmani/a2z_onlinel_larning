// ignore_for_file: unused_field

import 'package:a2z_online_learning/CustomProvider/custom_theme_provider.dart';
import 'package:a2z_online_learning/CustomWidgets/custom_card.dart';
import 'package:a2z_online_learning/CustomWidgets/custom_text_card.dart';
import 'package:a2z_online_learning/Utils/AppColors.dart';
import 'package:a2z_online_learning/Utils/AppConstant.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:toggle_switch/toggle_switch.dart';

class HomeScreenView extends StatefulWidget {
  const HomeScreenView({super.key});

  @override
  State<HomeScreenView> createState() => _HomeScreenViewState();
}

class _HomeScreenViewState extends State<HomeScreenView> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 25.h,
            color: AppColors.blueColor,
            child: Padding(
              padding: EdgeInsets.only(top: 5.h, left: 5.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Column(
                    children: [
                      SizedBox(
                        height: 6.h,
                      ),
                      Text(
                        'Hi, Usmani ',
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      Text(
                        'Let\'s start learning',
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                    ],
                  ),
                  SizedBox(
                    width: 33.w,
                  ),
                  Column(
                    children: [
                      ChangeNotifierProvider<CustomThemeProvider>(
                        create: (context) => CustomThemeProvider(),
                        child: ToggleSwitch(
                          minWidth: 10.w,
                          minHeight: 3.h,
                          cornerRadius: 30.0,
                          activeBgColor: const [
                            Color.fromARGB(255, 44, 32, 32)
                          ],
                          activeFgColor: AppColors.blackTextColor,
                          inactiveBgColor: Colors.grey,
                          initialLabelIndex:
                              Provider.of<CustomThemeProvider>(context)
                                  .toggleSwitchIndex,
                          totalSwitches: 2,
                          labels: const ['Light', 'Dark'],
                          icons: const [Icons.sunny, Icons.dark_mode],
                          changeOnTap: true,
                          onToggle: (index) {
                            Provider.of<CustomThemeProvider>(context,
                                    listen: false)
                                .toggleTheme();
                          },
                        ),
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      Center(
                        child: CircleAvatar(
                          radius: 5.h,
                          backgroundImage:
                              NetworkImage(_auth.currentUser?.photoURL ?? ''),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 4.h,
          ),
          Padding(
            padding: EdgeInsets.only(left: 6.w),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  CustomCard(
                    imageName: '${AppConstants.assetsImages}getStarted1.png',
                    headingText: "What do you want to learn today?",
                    buttonWidget: ElevatedButton(
                      style: Theme.of(context).elevatedButtonTheme.style,
                      onPressed: () {},
                      child: const Text('Get Started'),
                    ),
                  ),
                  SizedBox(
                    width: 2.w,
                  ),
                  CustomCard(
                    imageName: '${AppConstants.assetsImages}getStarted2.png',
                    headingText: "Start from where you left.",
                    buttonWidget: ElevatedButton(
                      style: Theme.of(context).elevatedButtonTheme.style,
                      onPressed: () {
                        // Add your button onPressed logic here
                      },
                      child: const Text('Resume'),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 3.h,
          ),
          Padding(
            padding: EdgeInsets.only(left: 6.w, right: 6.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Learning Plan',
                    style: Theme.of(context).textTheme.titleMedium),
                const CustomTextCard(
                  iconPaths: [
                    '${AppConstants.assetsSvg}progress.svg',
                    '${AppConstants.assetsSvg}progress.svg',
                    '${AppConstants.assetsSvg}progress.svg',
                    '${AppConstants.assetsSvg}progress.svg',
                    '${AppConstants.assetsSvg}progress.svg',
                  ],
                  texts: [
                    'Flutter Course',
                    'DevOps',
                    'RPA',
                    'Cloud Computing',
                    'Python'
                  ],
                  digitNumbers: ['10/40', '20/50', '10/50', '10/40', '05/50'],
                ),
              ],
            ),
          ),
          SizedBox(height: 2.h),
          Expanded(
            child: Container(
              margin: EdgeInsets.only(left: 6.w, right: 6.w),
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(12),
                      topRight: Radius.circular(12)),
                  color: AppColors.lighGreyBackground),
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 6.w, top: 1.h),
                        child: Text('Meetup',
                            style: Theme.of(context).textTheme.titleMedium),
                      ),
                      Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: 6.w),
                            child: Container(
                              width: 65.w,
                              child: Text(
                                'off-line exchange of learning experience',
                                softWrap: true,
                                style: Theme.of(context).textTheme.titleSmall,
                              ),
                            ),
                          ),
                          Image.asset(
                            '${AppConstants.assetsImages}meetup.png',
                            height: 10.h,
                            width: 12.w,
                          )
                        ],
                      )
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
