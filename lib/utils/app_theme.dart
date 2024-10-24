import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_colors.dart';
import 'app_text_styles.dart';

class AppTheme {
  static ThemeData themeData = ThemeData(
    primaryColor: AppColors.primaryColor,
    useMaterial3: true,
    scaffoldBackgroundColor: AppColors.scaffoldColor,

    /// Text Button theme
    textButtonTheme: TextButtonThemeData(
      style: ButtonStyle(
        padding: WidgetStateProperty.all<EdgeInsetsGeometry>(const EdgeInsets.only(right: 6)),
        minimumSize: WidgetStateProperty.all<Size>(Size.zero),
        foregroundColor: WidgetStateProperty.all<Color>(Colors.black),
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        textStyle: WidgetStateProperty.resolveWith<TextStyle?>(
          (Set<WidgetState> states) {
            return GoogleFonts.montserrat(fontSize: 16);
          },
        ),
      ),
    ),

    /// Elevated Button theme
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        textStyle: WidgetStateProperty.resolveWith<TextStyle?>(
          (Set<WidgetState> states) {
            return const TextStyle(fontSize: 16, fontWeight: FontWeight.w500);
          },
        ),
        elevation: WidgetStateProperty.all(0.2),
        foregroundColor: WidgetStateProperty.all<Color>(AppColors.white),
        shape: WidgetStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(5))),
        backgroundColor: WidgetStateProperty.resolveWith<Color>(
          (Set<WidgetState> states) {
            if (states.contains(WidgetState.pressed)) {
              return AppColors.primaryColor;
            } else if (states.contains(WidgetState.disabled)) {
              return AppColors.grey;
            }
            return AppColors.primaryColor;
          },
        ),
      ),
    ),

    /// Cursor color
    textSelectionTheme: TextSelectionThemeData(
      cursorColor: AppColors.textFieldBorderColor,
      selectionColor: AppColors.primaryColor,
      selectionHandleColor: AppColors.primaryColor,
    ),

    /// TextBox theme
    inputDecorationTheme: InputDecorationTheme(
      hintStyle: AppTextStyle.montserrat14W500Grey,
      border: OutlineInputBorder(
        borderSide: BorderSide(color: AppColors.textFieldBorderColor),
        borderRadius: BorderRadius.circular(4),
      ),
      activeIndicatorBorder: BorderSide(color: AppColors.textFieldBorderColor, width: 1),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: AppColors.textFieldBorderColor, width: 1),
        borderRadius: BorderRadius.circular(4),
      ),
      outlineBorder: BorderSide(color: AppColors.textFieldBorderColor, width: 1),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: AppColors.textFieldBorderColor, width: 1),
        borderRadius: BorderRadius.circular(4),
      ),
      contentPadding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
    ),

    /// Radio button
    radioTheme: RadioThemeData(
      visualDensity: const VisualDensity(horizontal: VisualDensity.minimumDensity, vertical: VisualDensity.minimumDensity),
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      fillColor: WidgetStateProperty.all<Color>(AppColors.primaryColor),
    ),

    /// Divider
    dividerTheme: const DividerThemeData(
      thickness: 1.5,
      color: CupertinoColors.systemGrey5,
    ),

    /// Floating action button
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      backgroundColor: AppColors.primaryColor,
      elevation: 2,
      iconSize: 36,
    ),

    /// Progress indicator theme
    progressIndicatorTheme: ProgressIndicatorThemeData(
      circularTrackColor: AppColors.primaryColor,
      color: AppColors.primaryColor,
      refreshBackgroundColor: AppColors.primaryColor,
    ),

    /// Slider theme
    sliderTheme:
        SliderThemeData(thumbColor: AppColors.primaryColor, activeTrackColor: AppColors.primaryColor, inactiveTrackColor: AppColors.lightBorderColor),

    /// Dropdown theme
    dropdownMenuTheme: DropdownMenuThemeData(
      menuStyle: MenuStyle(
        padding: WidgetStateProperty.all(const EdgeInsets.symmetric(horizontal: 8)),
        shape: WidgetStateProperty.all(
            RoundedRectangleBorder(side: BorderSide(color: AppColors.textFieldBorderColor), borderRadius: BorderRadius.circular(8))),
        side: WidgetStateProperty.all(BorderSide(color: AppColors.textFieldBorderColor)),
      ),
      textStyle: AppTextStyle.montserrat13W600,
    ),

    ///AppBar theme
    appBarTheme: AppBarTheme(
      centerTitle: false,
      titleTextStyle: AppTextStyle.montserrat22W700.copyWith(color: Colors.black),
      surfaceTintColor: Colors.white,
      backgroundColor: Colors.transparent,

      /// In material3 , If we don't apple this , Appbar is getting transparent when scroll-up
    ),
  );
}
