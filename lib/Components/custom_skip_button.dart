import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CustomSkipButton extends StatelessWidget {
  final void Function() onTap;

  const CustomSkipButton({Key? key, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: EdgeInsets.only(left: 83.w, top: 8.h, bottom: 3.h),
          child: GestureDetector(
            onTap: onTap,
            child: Container(
              alignment: Alignment.center,
              height: 4.h,
              width: 12.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(40),
                color: const Color.fromRGBO(242, 244, 245, 0.808),
              ),
              child: const Text("Skip"),
            ),
          ),
        ),
      ],
    );
  }
}
