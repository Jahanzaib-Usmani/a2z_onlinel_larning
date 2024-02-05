import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CustomTextCard extends StatelessWidget {
  final List<String> iconPaths;
  final List<String> texts;
  final List<String> digitNumbers;

  const CustomTextCard({
    required this.iconPaths,
    required this.texts,
    required this.digitNumbers,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 20.h,
      child: Card(
        elevation: 5,
        // shadowColor: Colors.amber,
        color: Theme.of(context).scaffoldBackgroundColor,
        child: ListView.builder(
          itemCount: iconPaths.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.only(left: 4.w, right: 2.w, bottom: 2.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    child: SvgPicture.asset(
                      iconPaths[index],
                      height: 3.h,
                      width: 2.w,
                    ),
                  ),
                  SizedBox(width: 2),
                  Text(
                    texts[index],
                  ),
                  SizedBox(width: 15),
                  Text(
                    digitNumbers[index].toString(),
                    style: TextStyle(fontSize: 16),
                    textAlign: TextAlign.right,
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
