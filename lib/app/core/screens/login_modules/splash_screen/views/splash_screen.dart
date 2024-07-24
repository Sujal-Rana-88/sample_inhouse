import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../constants/app_colors.dart';
import '../controllers/splash_screen_controller.dart';

class SplashScreen extends GetView<SplashController> {
  final splashController = Get.find<SplashController>();

  SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return SafeArea(
        child: Scaffold(
          backgroundColor: CustomColor.white,
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: Image.asset(
                  'assets/images/logo.png',
                ),
              ),
            ],
          ),
        ));
  }
}
