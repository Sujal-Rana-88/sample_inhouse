import 'dart:async';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart'; // Import Firebase Authentication
import '../../../../routes/app_pages.dart';

class SplashController extends FullLifeCycleController with FullLifeCycleMixin {
  final FirebaseAuth _auth = FirebaseAuth.instance; // Instance of FirebaseAuth

  @override
  Future<void> onInit() async {
    super.onInit();
    await Future.delayed(const Duration(seconds: 5), () {
      loadingScreen();
    });
  }

  Future<void> loadingScreen() async {
    User? user = _auth.currentUser;

    if (user == null) {
      //! User is not logged in, navigate to the login screen
      Get.offNamed(Routes.LOGIN);
    } else {
      //! User is logged in, navigate to the home screen
      Get.offNamed(Routes.HOME);
    }
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
