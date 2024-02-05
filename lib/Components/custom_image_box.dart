import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class customImageBox extends StatelessWidget {
  final String imageName;

  const customImageBox({required this.imageName, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 35.h,
      width: 75.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(60),
        ),
        color: Color(0xffCDECFE),
      ),
      child: Image.asset(imageName),
    );
  }
}
