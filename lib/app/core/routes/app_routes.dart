part of 'app_pages.dart';

abstract class Routes {
  Routes._();

  static const SPLASH = _Paths.SPLASH;
  static const LOGIN = _Paths.LOGIN;
  static const OTP_SCREEN = _Paths.OTP_SCREEN;
  static const HOME = _Paths.HOME;
  static const ADD_PAGE = _Paths.ADD_PAGE;
  static const CUSTOMERS_SCREEN = _Paths.CUSTOMERS_SCREEN;
  static const CUSTOMER_PROFILE_SCREEN = _Paths.CUSTOMER_PROFILE_SCREEN;
  static const ORDER_DETAILS_SCREEN = _Paths.ORDER_DETAILS_SCREEN;
  static const EDIT_PORFILE_SCREEN = _Paths.EDIT_PORFILE_SCREEN;
}

abstract class _Paths {
  _Paths._();

  static const SPLASH = '/splash';
  static const LOGIN = '/login';
  static const OTP_SCREEN = '/otp_screen';
  static const HOME = '/home';
  static const ADD_PAGE = '/add_page';
  static const CUSTOMERS_SCREEN = '/customers_screen';
  static const CUSTOMER_PROFILE_SCREEN = '/customer_profile_screen';
  static const ORDER_DETAILS_SCREEN = '/order_details_screen';
  static const EDIT_PORFILE_SCREEN = '/edit_profile_details';
}
