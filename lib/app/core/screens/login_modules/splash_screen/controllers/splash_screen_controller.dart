import 'dart:async';
import 'package:get/get.dart';
import '../../../../routes/app_pages.dart';
class SplashController extends FullLifeCycleController with FullLifeCycleMixin {

  @override
  Future<void> onInit() async {
    super.onInit();
    await Future.delayed(const Duration(seconds: 5), () {
      loadingScreen();
    });
  }

  Future<void> loadingScreen() async {
    Get.offNamed(Routes.LOGIN);
  }

  @override
  void onDetached() {
    // TODO: implement onDetached
  }

  @override
  void onHidden() {
    // TODO: implement onHidden
  }

  @override
  void onInactive() {
    // TODO: implement onInactive
  }

  @override
  void onPaused() {
    // TODO: implement onPaused
  }

  @override
  void onResumed() {
    // TODO: implement onResumed
  }
}