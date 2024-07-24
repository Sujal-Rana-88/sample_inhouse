import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'app/core/routes/app_pages.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'l10n/l10n.dart';
import 'app/core/screens/login_modules/login_screen/controllers/login_controller.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Initialize Firebase SDK
  await Firebase.initializeApp();

  // Initialize the LoginController
  LoginController localeController = Get.put(LoginController());

  // Run the application.
  runApp(
    Sizer(
      builder: (context, orientation, deviceType) {
        return Obx(() {
          return GetMaterialApp(
            debugShowCheckedModeBanner: false,
            supportedLocales: L10n.all,
            locale: Locale(localeController.currentLang[0]),
            localizationsDelegates: const [
              AppLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            initialRoute: AppPages.INITIAL,
            getPages: AppPages.routes,
          );
        });
      },
    ),
  );
}
