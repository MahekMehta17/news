// splash_screen.dart
import 'package:breaking_news/utils/routes.dart';
import 'package:breaking_news/utils/strings_util.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 2), () => Get.offNamed(Routes.homeScreen));

    return Scaffold(
      body: Center(
        child: Lottie.asset(
          StringUtils.newsAnimation,
          repeat: true,
        ),
      ),
    );
  }
}
