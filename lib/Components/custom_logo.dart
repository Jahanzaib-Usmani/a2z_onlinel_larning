import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CustomLogo extends StatelessWidget {
  final String logoName;
  final void Function() onTap;

  const CustomLogo({
    required this.logoName,
    required this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 6.h,
        width: 12.w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(20),
          ),
          color: Colors.transparent,
        ),
        child: Image.asset(logoName),
      ),
    );
  }
}
