import 'package:a2z_online_learning/Utils/AppColors.dart';
import 'package:a2z_online_learning/Utils/AppConstant.dart';
import 'package:flutter/material.dart';

import 'package:responsive_sizer/responsive_sizer.dart';

class AppThemes {
  static final lightTheme = ThemeData(
    scaffoldBackgroundColor: AppColors.whiteBackgroundColor,
    fontFamily: AppConstants.textFont,
    textTheme: TextTheme(
      titleLarge: TextStyle(
          color: Color(0xff1F1F39),
          fontSize: 22.sp,
          fontWeight: FontWeight.w900),
      titleMedium: TextStyle(
          color: Color(0xff1F1F39),
          fontSize: 18.sp,
          fontWeight: FontWeight.w700),
      titleSmall: TextStyle(
          color: Color(0xff1F1F39),
          fontSize: 16.sp,
          fontWeight: FontWeight.w500),
    ),
  );

  // static final DarkTheme = ThemeData(
  //   brightness: Brightness.dark,
  //   scaffoldBackgroundColor: AppColors.blackTextColor,
  //   textTheme: const TextTheme().copyWith(
  //     bodySmall: const TextStyle(color: AppColors.whiteBackgroundColor),
  //     bodyMedium: const TextStyle(color: AppColors.whiteBackgroundColor),
  //     bodyLarge: const TextStyle(color: AppColors.whiteBackgroundColor),
  //     labelSmall: const TextStyle(color: AppColors.whiteBackgroundColor),
  //     labelMedium: const TextStyle(color: AppColors.whiteBackgroundColor),
  //     labelLarge: const TextStyle(color: AppColors.whiteBackgroundColor),
  //     displaySmall: const TextStyle(color: AppColors.whiteBackgroundColor),
  //     displayMedium: const TextStyle(color: AppColors.whiteBackgroundColor),
  //     displayLarge: TextStyle(
  //       fontFamily: AppConstants.textFont,
  //       fontSize: 16.sp,
  //       color: AppColors.whiteBackgroundColor,
  //       fontWeight: FontWeight.w700,
  //     ),
  //   ),
  // );

  static final dark = ThemeData(
    useMaterial3: true,
    canvasColor: Colors.transparent,
    scaffoldBackgroundColor: AppColors.blackTextColor,
    fontFamily: AppConstants.textFont,
    // highlightColor: AppColors.whiteBackgroundColor.withOpacity(0.1),
    // colorScheme: ColorScheme.fromSwatch(
    //   backgroundColor: AppColors.whiteBackgroundColor,
    //   errorColor: AppColors.orange,
    // ),
    // iconTheme: IconThemeData(
    //   color: AppColors.blackTextColor,
    //   size: 36.h,
    // ),
    appBarTheme: AppBarTheme(
      iconTheme: IconThemeData(
        fill: 0,
        color: AppColors.whiteBackgroundColor,
        size: 24.sp,
      ),
      //leadingIcon: IconThemeData(),
      titleTextStyle: TextStyle(
        fontSize: 22.sp,
        color: AppColors.whiteBackgroundColor,
        fontWeight: FontWeight.w700,
      ),
      actionsIconTheme: IconThemeData(
        color: AppColors.whiteBackgroundColor,
        size: 24.sp,
      ),
      backgroundColor: AppColors.blackTextColor,
      surfaceTintColor: Colors.transparent,
      titleSpacing: 8.w,
      centerTitle: false,
    ),
    progressIndicatorTheme: ProgressIndicatorThemeData(
      color: AppColors.whiteBackgroundColor,
      linearTrackColor: AppColors.whiteBackgroundColor.withOpacity(0.25),
    ),

    // chipTheme: ChipThemeData(
    //   disabledColor: Colors.transparent,
    //   selectedColor: AppColors.whiteBackgroundColor,
    //   shape: const StadiumBorder(
    //     side: BorderSide(
    //       color: Colors.grey,
    //     ),
    //   ),
    //   showCheckmark: false,
    //   labelStyle: TextStyle(
    //     fontSize: 14.sp,
    //     color: Colors.grey,
    //   ),
    // ),

    ///////////////////////
    /// Buttons' Themes ///
    ///////////////////////

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.resolveWith<Color>(
          (Set<MaterialState> states) {
            if (states.contains(MaterialState.disabled)) {
              return AppColors.whiteBackgroundColor.withOpacity(0);
            }
            return AppColors.whiteBackgroundColor;
          },
        ),
        foregroundColor: MaterialStateProperty.resolveWith<Color>(
          (Set<MaterialState> states) {
            if (states.contains(MaterialState.disabled)) {
              return AppColors.whiteBackgroundColor.withOpacity(0.25);
            }
            return AppColors.whiteBackgroundColor;
          },
        ),
        shape: const MaterialStatePropertyAll(StadiumBorder()),
        overlayColor: MaterialStatePropertyAll(
            AppColors.whiteBackgroundColor.withOpacity(0.1)),
        shadowColor: MaterialStatePropertyAll(
            AppColors.whiteBackgroundColor.withOpacity(0.1)),
        elevation: MaterialStateProperty.resolveWith<double>(
          (Set<MaterialState> states) {
            if (states.contains(MaterialState.disabled)) {
              return 0;
            }
            return 8.sp;
          },
        ),
        surfaceTintColor: const MaterialStatePropertyAll(Colors.transparent),
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: ButtonStyle(
        backgroundColor: const MaterialStatePropertyAll(Colors.transparent),
        foregroundColor:
            const MaterialStatePropertyAll(AppColors.whiteBackgroundColor),
        shape: const MaterialStatePropertyAll(StadiumBorder()),
        overlayColor: MaterialStatePropertyAll(
            AppColors.whiteBackgroundColor.withOpacity(0.1)),
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: ButtonStyle(
        foregroundColor:
            const MaterialStatePropertyAll(AppColors.whiteBackgroundColor),
        shape: const MaterialStatePropertyAll(StadiumBorder()),
        side: const MaterialStatePropertyAll(
          BorderSide(color: AppColors.whiteBackgroundColor),
        ),
        overlayColor: MaterialStatePropertyAll(
            AppColors.whiteBackgroundColor.withOpacity(0.1)),
        elevation: const MaterialStatePropertyAll(0),
      ),
    ),
    iconButtonTheme: IconButtonThemeData(
      style: ButtonStyle(
        iconSize: const MaterialStatePropertyAll(24),
        backgroundColor: const MaterialStatePropertyAll(Colors.transparent),
        foregroundColor:
            const MaterialStatePropertyAll(AppColors.whiteBackgroundColor),
        overlayColor: MaterialStatePropertyAll(
            AppColors.whiteBackgroundColor.withOpacity(0.1)),
        shape: MaterialStatePropertyAll(
          RoundedRectangleBorder(
            side: BorderSide(
              color: Colors.transparent,
              width: 0.8.h,
            ),
            borderRadius: BorderRadius.circular(13.h),
          ),
        ),
      ),
    ),

    ///////////////////////
    /// Other Themes ///
    ///////////////////////

    dividerTheme: DividerThemeData(
      color: Colors.grey,
      thickness: 0.5.h,
    ),
    cardTheme: CardTheme(
      color: Colors.grey,
      surfaceTintColor: Colors.transparent,
      shadowColor: Colors.grey.withOpacity(0.1),
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(32.h),
      ),
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: Colors.transparent,
      elevation: 0,
      splashColor: Colors.transparent,
      focusColor: Colors.transparent,
      focusElevation: 0,
    ),
    tabBarTheme: TabBarTheme(
      indicatorColor: AppColors.whiteBackgroundColor,
      indicatorSize: TabBarIndicatorSize.tab,
      indicator: BoxDecoration(
        color: AppColors.whiteBackgroundColor,
        borderRadius: BorderRadius.circular(8.h),
      ),
      overlayColor: const MaterialStatePropertyAll(Colors.transparent),
      labelColor: AppColors.whiteBackgroundColor,
      unselectedLabelColor: AppColors.whiteBackgroundColor,
      dividerColor: Colors.transparent,
      labelPadding: EdgeInsets.all(8.h),
    ),
    drawerTheme: const DrawerThemeData(
      backgroundColor: AppColors.blackTextColor,
      surfaceTintColor: Colors.transparent,
      //width: 200.w,
      //shape: const LinearBorder(),
    ),
    snackBarTheme: SnackBarThemeData(
      backgroundColor: AppColors.whiteBackgroundColor.withOpacity(0.3),
      contentTextStyle: const TextStyle(color: AppColors.whiteBackgroundColor),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.h),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      contentPadding: EdgeInsets.symmetric(horizontal: 24.w),
      filled: true,
      fillColor: Colors.grey.withOpacity(0.25),
      labelStyle: TextStyle(
        fontWeight: FontWeight.normal,
        fontSize: 14.sp,
        color: AppColors.whiteBackgroundColor,
      ),
      disabledBorder: OutlineInputBorder(
        borderSide: const BorderSide(
          color: Colors.transparent,
        ),
        borderRadius: BorderRadius.all(
          Radius.circular(30.h),
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: const BorderSide(
          color: Colors.transparent,
        ),
        borderRadius: BorderRadius.all(
          Radius.circular(30.h),
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: const BorderSide(
          color: Colors.transparent,
        ),
        borderRadius: BorderRadius.all(
          Radius.circular(30.h),
        ),
      ),
      errorBorder: OutlineInputBorder(
        borderSide: const BorderSide(
          color: Colors.red,
        ),
        borderRadius: BorderRadius.all(
          Radius.circular(10.h),
        ),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderSide: const BorderSide(
          color: Colors.red,
        ),
        borderRadius: BorderRadius.all(
          Radius.circular(10.h),
        ),
      ),
      hintStyle: TextStyle(
        fontWeight: FontWeight.normal,
        fontSize: 14.sp,
        color: AppColors.whiteBackgroundColor,
      ),
    ),
    textSelectionTheme: TextSelectionThemeData(
      cursorColor: AppColors.whiteBackgroundColor,
      selectionHandleColor: AppColors.whiteBackgroundColor,
      selectionColor: AppColors.whiteBackgroundColor.withOpacity(0.1),
    ),

    ///////////////////////
    /// Text Themes ///////
    ///////////////////////

    textTheme: TextTheme(
      /// Display Styles
      displayLarge: TextStyle(
        color: AppColors.whiteBackgroundColor,
        fontSize: 23.sp,
        fontWeight: FontWeight.w600,
        height: 1.5,
      ),
      displaySmall: TextStyle(
        color: AppColors.whiteBackgroundColor,
        fontSize: 12.sp,
        fontWeight: FontWeight.w100,
        height: 1.75,
      ),

      /// Label Styles
      labelLarge: TextStyle(
        color: AppColors.whiteBackgroundColor,
        fontSize: 16.sp,
        fontWeight: FontWeight.w600,
      ),
      labelMedium: TextStyle(
        color: AppColors.whiteBackgroundColor,
        fontSize: 18.sp,
        fontWeight: FontWeight.w600,
      ),
      labelSmall: TextStyle(
        color: AppColors.whiteBackgroundColor,
        fontSize: 14.sp,
        fontWeight: FontWeight.w400,
      ),

      bodyLarge: TextStyle(
        color: AppColors.whiteBackgroundColor,
        fontSize: 16.sp,
        fontWeight: FontWeight.w500,
      ),
      bodyMedium: TextStyle(
        color: AppColors.whiteBackgroundColor,
        fontSize: 14.sp,
      ),

      ////////////////////////////////////////////////
      displayMedium: TextStyle(
        color: AppColors.whiteBackgroundColor,
        fontSize: 32.sp,
      ),

      // Body Styles
      bodySmall: TextStyle(
        color: AppColors.whiteBackgroundColor,
        fontSize: 14.sp,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.1,
      ),

      // Headline Styles
      headlineMedium: TextStyle(
        color: AppColors.whiteBackgroundColor,
        fontSize: 14.sp,
      ),
      headlineSmall: TextStyle(
        color: AppColors.whiteBackgroundColor,
        fontSize: 12.sp,
      ),
    ),
  );
}
