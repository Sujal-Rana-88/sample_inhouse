import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sample_inhouse/app/core/screens/login_modules/otp_screen/controllers/otp_screen_controller.dart';
import 'check_otp.dart';
class OtpScreen extends GetView<OtpScreenController> {
  final OtpScreenController otpController = Get.put(OtpScreenController());

  @override
  Widget build(BuildContext context) {
    final String? verificationId = Get.arguments;


    return Scaffold(
      appBar: AppBar(
        title: Text("OTP Screen"),
        centerTitle: true,
      ),
      body: CheckOtp(verificationId: verificationId),
    );
  }
}


