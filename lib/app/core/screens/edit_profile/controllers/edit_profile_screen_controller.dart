
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditProfileScreenController extends FullLifeCycleController with FullLifeCycleMixin {
  final TextEditingController userNameController = TextEditingController();
  final TextEditingController userPhoneNumberController = TextEditingController();
  final TextEditingController userAddressController = TextEditingController();

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
