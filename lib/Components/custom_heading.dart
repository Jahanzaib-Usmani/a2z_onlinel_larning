import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CustomHeading extends StatelessWidget {
  final String headingText;
  const CustomHeading({
    required this.headingText,
    Key? key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: 10.h,
      width: 55.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(30),
        ),
        //color: Color(0xffCDECFE),
        // boxShadow: <BoxShadow>[
        //   Shadow(
        //     offset: Offset(0.0, 1.0),
        //   )
        // ]
      ),
      child: Text(
        headingText,
        style: TextStyle(
            shadows: <Shadow>[
              Shadow(
                offset: Offset(1.0, 0.0),
                blurRadius: 3.0,
                color: Color.fromARGB(255, 180, 179, 179),
              )
            ],
            fontSize: 30,
            fontFamily: 'assests/fonts/PoppingsBold.ttf',
            fontWeight: FontWeight.w800),
        textAlign: TextAlign.center,
        softWrap: true,
      ),
    );
  }
}
