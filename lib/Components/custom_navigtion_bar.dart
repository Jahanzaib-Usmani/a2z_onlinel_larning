import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CustomNavigationBar extends StatelessWidget {
  final double width1;
  final double width2;
  final double width3;

  final Color? color1;
  final Color? color2;
  final Color? color3;
  const CustomNavigationBar({
    required this.width1,
    required this.width2,
    required this.width3,
    required this.color1,
    required this.color2,
    required this.color3,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          alignment: Alignment.center,
          height: 0.7.h,
          width: width1.w,
          decoration: BoxDecoration(
              color: color1, borderRadius: BorderRadius.circular(50)),
        ),
        SizedBox(
          height: 1.h,
          width: 2.w,
        ),
        Container(
          alignment: Alignment.center,
          height: 0.7.h,
          width: width2.w,
          decoration: BoxDecoration(
              color: color2, borderRadius: BorderRadius.circular(50)),
        ),
        SizedBox(
          height: 1.h,
          width: 2.w,
        ),
        Container(
          alignment: Alignment.center,
          height: 0.7.h,
          width: width3.w,
          decoration: BoxDecoration(
              color: color3, borderRadius: BorderRadius.circular(50)),
        ),
      ],
    );
  }
}
