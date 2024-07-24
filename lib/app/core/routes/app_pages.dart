import 'package:get/get.dart';
import 'package:sample_inhouse/app/core/screens/add_page/bindings/add_page_binding.dart';
import 'package:sample_inhouse/app/core/screens/add_page/views/add_page.dart';
import 'package:sample_inhouse/app/core/screens/customers_screen/bindings/customers_screen_bindings.dart';
import 'package:sample_inhouse/app/core/screens/customers_screen/views/customers_screen.dart';
import 'package:sample_inhouse/app/core/screens/home_page/bindings/home_screen_binding.dart';
import 'package:sample_inhouse/app/core/screens/home_page/views/home_screen.dart';
import 'package:sample_inhouse/app/core/screens/login_modules/otp_screen/bindings/otp_screen_binding.dart';
import 'package:sample_inhouse/app/core/screens/login_modules/splash_screen/views/splash_screen.dart';
import 'package:sample_inhouse/app/core/screens/login_modules/login_screen/views/login_screen.dart';
import '../screens/customer_profile_screen/bindings/customer_profile_screen_binding.dart';
import '../screens/customer_profile_screen/views/customer_profile_screen.dart';
import '../screens/login_modules/login_screen/bindings/login_binding.dart';
import '../screens/login_modules/otp_screen/views/otp_screen.dart';
import '../screens/login_modules/splash_screen/bindings/splash_screen_bindings.dart';
part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASH;

  static final routes = [
    GetPage(
      name: _Paths.SPLASH,
      page: () => SplashScreen(),
      binding: SplashScreenBindings(),
    ),

    GetPage(
      name: _Paths.LOGIN,
      page: () => LoginScreen(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.OTP_SCREEN,
      page: () => OtpScreen(),
      binding: OtpScreenBinding(),
    ),
    GetPage(
      name: _Paths.HOME,
      page: () => HomeScreen(),
      binding: HomeScreenBinding(),
    ), GetPage(
      name: _Paths.ADD_PAGE,
      page: () => AddPage(),
      binding: AddPageBinding(),
    ),GetPage(
      name: _Paths.CUSTOMERS_SCREEN,
      page: () => CustomersScreen(),
      binding: CustomersScreenBindings(),
    ),GetPage(
      name: _Paths.CUSTOMER_PROFILE_SCREEN,
      page: () =>  CustomerProfileScreen(),
      binding: CustomerProfileScreenBinding(),
    ),
  ];
}
