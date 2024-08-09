import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';
import '../../../../constants/app_colors.dart';
import '../../../../constants/app_constants.dart';
import '../../../../routes/app_pages.dart';

class CheckOtp extends StatefulWidget {
  final String? verificationId;

    CheckOtp({Key? key, required this.verificationId}) : super(key: key);

  @override
  _CheckOtpState createState() => _CheckOtpState();
}

class _CheckOtpState extends State<CheckOtp> {
  TextEditingController phoneController = TextEditingController();
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {

    return Column(
      children: [

        SizedBox(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Pinput(
              length: 6,

              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              defaultPinTheme: PinTheme(
                height: 50,
                width: 50,
                textStyle: APPConstants.titlebodyStyle20,
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(12.0),
                  // Adjust the radius as needed
                  color: CustomColor.bordercolor,
                  border: Border.all(
                    color: CustomColor.textfieldcolor,
                    // Set the color of the border
                    width: 2.0, // Set the width of the border
                  ),
                ),
              ),
              focusedPinTheme: PinTheme(
                height: 50,
                width: 50,
                textStyle: APPConstants.titlebodyStyle20,
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(12.0),
                  // Adjust the radius as needed
                  color: CustomColor.bordercolor,
                  border: Border.all(
                    color: CustomColor.black.withOpacity(0.7),
                    // Set the color of the border
                    width: 2.0, // Set the width of the border
                  ),
                ),
              ),
              controller: phoneController,
            ),
          ),
        ),

        SizedBox(height: 30),
        GestureDetector(
          onTap: () async {
            setState(() {
              isLoading = true;
            });

            try {
              PhoneAuthCredential credential = PhoneAuthProvider.credential(
                verificationId: widget.verificationId!,
                smsCode: phoneController.text.toString(),
              );
              await FirebaseAuth.instance.signInWithCredential(credential);
              Get.offAllNamed(Routes.HOME);
            } catch (ex) {
              print("Failed to verify OTP: $ex");
              // Handle error, show message, etc.
              setState(() {
                isLoading = false;
              });
            }
          },
          child: Padding(
            padding: const EdgeInsets.only(left: 18.0, right: 18),
            child: Material(
              borderRadius: BorderRadius.circular(10),
              color: Colors.greenAccent[700],
              child: SizedBox(
                width: 400.0,
                height: 50,
                child: Center(
                  child: isLoading
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
        ),
      ],
    );
  }
}
