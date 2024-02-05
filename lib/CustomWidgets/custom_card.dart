import 'package:a2z_online_learning/Utils/AppColors.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CustomCard extends StatelessWidget {
  final String imageName;
  final String headingText;
  final Widget? buttonWidget; // Make the button widget nullable

  const CustomCard({
    required this.imageName,
    required this.headingText,
    this.buttonWidget,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      color: AppColors.cardLightBlue,
      child: Stack(
        children: [
          Container(
            height: 20.h,
            width: 65.w,
            alignment: Alignment.bottomRight,
            child: Image.asset(
              imageName,
              height: 17.h,
            ),
          ),
          Positioned(
            top: 02.h,
            child: Padding(
              padding: EdgeInsets.only(left: 3.w),
              child: Container(
                width: 64.w,
                child: Text(
                  headingText,
                  softWrap: true,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Align(
              alignment: Alignment.bottomLeft,
              child: Container(
                width: 34.w,
                child: buttonWidget ?? SizedBox(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
