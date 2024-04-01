import 'package:chatter_botique/controller/splash_controller.dart';
import 'package:chatter_botique/utils/exports.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final sz = MediaQuery.sizeOf(context);
    // ignore: unused_local_variable
    SplashController splashController = Get.put(
      SplashController(),
    );
    return Scaffold(
      body: Center(
        child: Image.asset(
          AppImages.logoImage,
          width: sz.width * .4,
          height: sz.height * .6,
        ),
      ),
    );
  }
}
