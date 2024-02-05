import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CustomTextField extends StatelessWidget {
  final String fieldText;
  const CustomTextField({
    required this.fieldText,
    Key? key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: 8.h,
      width: 48.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(30),
        ),
        //color: Color(0xffCDECFE),
      ),
      child: Text(
        fieldText,
        style: TextStyle(
            fontSize: 16,
            color: Colors.grey,
            fontFamily: 'assests/fonts/PoppingsBold.ttf',
            fontWeight: FontWeight.w600),
        textAlign: TextAlign.center,
        softWrap: true,
      ),
    );
  }
}
