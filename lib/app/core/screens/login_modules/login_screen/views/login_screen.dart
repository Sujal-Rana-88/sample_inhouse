import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sample_inhouse/app/core/screens/login_modules/login_screen/views/phone_auth.dart';
import '../controllers/login_controller.dart';

class LoginScreen extends GetView<LoginController> {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    double myColTopPadding = screenHeight * 0.2;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xFF1B1B1B),
        resizeToAvoidBottomInset: false,
        body: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(
                  left: screenWidth * 0.03,
                  right: screenWidth * 0.03,
                  top: myColTopPadding),
              child: Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(right: screenWidth * 0.04),
                      child: Center(
                        child: Column(
                          children: [
                            Text(
                              'Join us via phone number',
                              textAlign: TextAlign.center,
                              style:const TextStyle(
                                color: Colors.white,
                                fontSize: 24,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  left: screenWidth * 0.03, right: screenWidth * 0.03),
              child: Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(right: screenWidth * 0.04),
                      child: Center(
                        child: Column(
                          children: [
                            Text(
                              "we'll text a code to verify your phone number",
                              textAlign: TextAlign.center,
                              style:const TextStyle(
                                color: Colors.grey,
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            PhoneAuth(),

            Padding(
              padding: EdgeInsets.only(
                  left: screenWidth * 0.03,
                  top: screenHeight * 0.03,
                  right: screenWidth * 0.03),
              child: Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(right: screenWidth * 0.04),
                      child: Center(
                        child: Column(
                          children: [
                            Text(
                              'Joining our app means you agree with our Terms of use and Privacy Policy',
                              textAlign: TextAlign.center,
                              style:const TextStyle(
                                color: Colors.grey,
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
