import 'dart:ui';
import 'package:get/get.dart';

class LoginController extends FullLifeCycleController with FullLifeCycleMixin {

  var currentLang = ['en'].obs;

  void changeLocale(String lang) {
    currentLang[0] = lang;
    Get.updateLocale(Locale(lang));
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