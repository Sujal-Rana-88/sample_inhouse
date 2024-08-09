import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../routes/app_pages.dart';
import '../../otp_screen/controllers/otp_screen_controller.dart';

class PhoneAuth extends StatelessWidget {
  final OtpScreenController controller = Get.put(OtpScreenController());
  final RxBool isLoading = false.obs;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16.0),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: TextField(
              controller: controller.phoneController,
              keyboardType: TextInputType.number,
              maxLength: 10,
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(

                hintText: 'Enter your phone number',
                hintStyle: TextStyle(color: Colors.white),
                suffixIcon: Icon(Icons.phone, color: Colors.white),
                border: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.white, width: 2),
                  borderRadius: BorderRadius.circular(12),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.white, width: 2),
                  borderRadius: BorderRadius.circular(12),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.white, width: 2),
                  borderRadius: BorderRadius.circular(12),
                ),
                counterText: "", // Hide the counter text
              ),
            ),
          ),

          SizedBox(height: 30),
          Obx(() => GestureDetector(
            onTap: controller.isButtonEnabled.value && !isLoading.value
                ? () async {
              isLoading.value = true;
              String phoneNumber = '+91${controller.phoneController.text.toString()}';
              try {
                await FirebaseAuth.instance.verifyPhoneNumber(
                  verificationCompleted: (PhoneAuthCredential credential) {},
                  verificationFailed: (FirebaseAuthException ex) {},
                  codeSent: (String verificationId, int? resendToken) {
                    // Navigate to OTP screen
                    Get.toNamed(Routes.OTP_SCREEN, arguments: verificationId);
                    isLoading.value = false;
                  },
                  codeAutoRetrievalTimeout: (String verificationId) {
                    isLoading.value = false;
                  },
                  phoneNumber: phoneNumber,
                );
              } catch (ex) {
                print("Failed to verify phone number: $ex");
                // Handle error, show message, etc.
                isLoading.value = false;
              }
            }
                : null,
            child: Padding(
              padding: const EdgeInsets.only(left: 18.0, right: 18),
              child: Material(
                borderRadius: BorderRadius.circular(10),
                color: controller.isButtonEnabled.value && !isLoading.value
                    ? Colors.greenAccent[700]
                    : Colors.grey,
                child: SizedBox(
                  width: 400.0,
                  height: 50,
                  child: Center(
                    child: isLoading.value
                        ? CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                    )
                        : Text(
                      'next',
                      style: const TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 22,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          )),
        ],
      ),
    );
  }
}
