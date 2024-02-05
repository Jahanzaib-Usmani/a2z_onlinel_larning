import 'package:a2z_online_learning/Utils/AppColors.dart';
import 'package:a2z_online_learning/Utils/AppConstant.dart';
import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final TextEditingController controller;
  final TextInputType? keyboardType;
  final bool? isObscureText;
  final String? obscureCharacter;
  final String hintText;
  final Widget? sufixIcon;
  final String titleText;
  final String? Function(String?)? validator;

  const CustomTextFormField({
    super.key,
    required this.controller,
    this.keyboardType = TextInputType.text,
    this.isObscureText = false,
    this.obscureCharacter = '*',
    required this.hintText,
    this.sufixIcon,
    required this.titleText,
    this.validator,
  });
  @override
  Widget build(BuildContext context) {
    double heigth = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          titleText,
          style: const TextStyle(
            fontFamily: AppConstants.textFont,
            fontSize: 14,
            color: AppColors.lightGreyTextColor,
          ),
        ),
        TextFormField(
          controller: controller,
          keyboardType: keyboardType,
          obscureText: isObscureText!,
          obscuringCharacter: obscureCharacter!,
          style: const TextStyle(
            color: AppColors.whiteBackgroundColor,
            fontFamily: AppConstants.textFont,
            fontSize: 14.0,
          ),
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.only(top: 10.0),
            constraints: BoxConstraints(
              maxHeight: heigth * 0.065,
              maxWidth: width,
            ),
            filled: true,
            fillColor: AppColors.formFilledColor,
            hintText: hintText,
            hintStyle: const TextStyle(
              color: AppColors.whiteBackgroundColor,
              fontFamily: AppConstants.textFont,
              fontSize: 14.0,
            ),
            suffixIcon: sufixIcon,
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(
                  color: AppColors.lightGreyTextColor,
                  width: 1.0,
                )),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(
                color: AppColors.lightGreyTextColor,
                width: 1.0,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: const BorderSide(
                color: AppColors.lightGreyTextColor,
                width: 1.0,
              ),
            ),
          ),
          validator: validator,
        ),
      ],
    );
  }
}
