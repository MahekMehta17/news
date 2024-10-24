import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import 'app_colors.dart';

class CustomWidgets {
  static List<BoxShadow>? boxShadow = [
    BoxShadow(
      color: Colors.black.withOpacity(0.2),
      spreadRadius: 0,
      blurRadius: 3,
      offset: const Offset(0, 1.5),
    ),
  ];

  static OutlineInputBorder customBorder = OutlineInputBorder(borderRadius: BorderRadius.circular(25));

  static toastValidation({required String msg, Duration duration = const Duration(seconds: 2)}) {
    return Get.snackbar(
      'Attention',
      msg,
      snackPosition: SnackPosition.BOTTOM,
      icon: const Icon(Icons.error),
      margin: const EdgeInsets.symmetric(vertical: 60, horizontal: 25),
      backgroundColor: AppColors.lightGreen,
      snackStyle: SnackStyle.FLOATING,
      isDismissible: true,
      duration: duration,
    );
  }

  static Widget loader = Center(child: LoadingAnimationWidget.threeArchedCircle(color: AppColors.primaryColor, size: 40));
}
