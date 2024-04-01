import 'package:get/get.dart';

class SplashController extends GetxController {
  Future<void> splashHandle() async {
    Future.delayed(const Duration(seconds: 2), () {
      Get.offAllNamed("/home-screen");
    });
  }

  @override
  void onInit() {
    splashHandle();
    super.onInit();
  }
}
