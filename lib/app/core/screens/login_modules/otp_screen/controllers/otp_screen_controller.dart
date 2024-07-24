import 'package:get/get.dart';
import 'package:flutter/material.dart';

class OtpScreenController extends FullLifeCycleController with FullLifeCycleMixin {
  TextEditingController phoneController = TextEditingController();
  RxBool isButtonEnabled = false.obs;

  @override
  void onInit() {
    super.onInit();
    phoneController.addListener(_checkInputLength);
  }

  @override
  void onClose() {
    phoneController.removeListener(_checkInputLength);
    phoneController.dispose();
    super.onClose();
  }

  void _checkInputLength() {
    isButtonEnabled.value = phoneController.text.length == 10;
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
