//
// import 'package:sample_inhouse/core/app_prefrences/share_prefrences_key.dart';
//
// import '../../app/GlobalApplicationController.dart';
// import '../models/registerDevice/response/RefreshTokenResponseModel.dart';
//
// class PreferenceHandler {
//   PreferenceHandler._privateConstructor();
//
//   static final PreferenceHandler _instance =
//   PreferenceHandler._privateConstructor();
//
//   factory PreferenceHandler() {
//     return _instance;
//   }
//
//   static int getIntValue(String preferenceName) {
//     return GlobalApplicationController.prefs!.getInt(preferenceName) ?? -1;
//   }
//
//   static Future<void> setIntValue(String preferenceName, int? intValue) async {
//     await GlobalApplicationController.prefs!.setInt(preferenceName, intValue!);
//   }
//
//   static bool getBoolValue(String preferenceName) {
//     return GlobalApplicationController.prefs!.getBool(preferenceName) ?? false;
//   }
//
//   static Future<void> setBoolValue(
//       String preferenceName, bool? boolValue) async {
//     await GlobalApplicationController.prefs!
//         .setBool(preferenceName, boolValue!);
//   }
//
//   static Future<void> setPrefBoolValue(
//       String preferenceName, bool boolValue) async {
//     await GlobalApplicationController.prefs!.setBool(preferenceName, boolValue);
//   }
//
//   static bool getPrefBoolValue(String preferenceName) {
//     return GlobalApplicationController.prefs!.getBool(preferenceName) ?? false;
//   }
//
//   static Future<String> getAsyncStringValue(String preferenceName) async {
//     return GlobalApplicationController.prefs!.getString(preferenceName) ?? "";
//   }
//
//   static Future<void> setAsyncStringValue(
//       String preferenceName, String? stringValue) async {
//     await GlobalApplicationController.prefs!
//         .setString(preferenceName, stringValue!);
//   }
//
//   static String getStringValue(String preferenceName) {
//     return GlobalApplicationController.prefs!.getString(preferenceName) ?? "";
//   }
//
//   static Future<void> setStringValue(
//       String preferenceName, String? stringValue) async {
//     await GlobalApplicationController.prefs!
//         .setString(preferenceName, stringValue!);
//   }
//
//   static List<String> getStringList(String preferenceName) {
//     return GlobalApplicationController.prefs!.getStringList(preferenceName) ??
//         [];
//   }
//
//   static Future<void> setStringList(
//       String preferenceName, List<String> list) async {
//     await GlobalApplicationController.prefs!
//         .setStringList(preferenceName, list);
//   }
//
//   static double getDoubleValue(String preferenceName) {
//     return GlobalApplicationController.prefs!.getDouble(preferenceName) ?? 0.0;
//   }
//
//   static Future<void> setDoubleValue(
//       String preferenceName, double doubleValue) async {
//     await GlobalApplicationController.prefs!
//         .setDouble(preferenceName, doubleValue);
//   }
//
//   static remove(String preferenceName) async {
//     await GlobalApplicationController.prefs!.remove(preferenceName);
//   }
//
//   static String getBaseUrl() {
//     return GlobalApplicationController.prefs!
//         .getString(SharedPreferencesKeys.baseUrl) ??
//         "";
//   }
//
//   static Future<void> setBaseUrl(String baseURL) async {
//     await GlobalApplicationController.prefs!
//         .setString(SharedPreferencesKeys.baseUrl, baseURL);
//   }
//
//   static String getToken() {
//     return GlobalApplicationController.prefs!
//         .getString(SharedPreferencesKeys.token) ??
//         "";
//   }
//
//   static Future<void> setAsyncToken(String token) async {
//     await GlobalApplicationController.prefs!
//         .setString(SharedPreferencesKeys.token, token);
//   }
//
//   static Future<void> clearPrefs() async {
//     await GlobalApplicationController.prefs!.clear();
//   }
//
//   static Future<String> getAccessToken({required int delay}) async {
//     var accessToken = PreferenceHandler. getStringValue(SharedPreferencesKeys.accessToken);
//     if(accessToken.isNotEmpty){
//       return accessToken;
//     }else{
//       await Future.delayed(Duration(seconds: delay));
//
//       return await getAccessToken(delay: delay);
//     }
//   }
//   static void storingEssentialTokenValue({required RefreshTokenResponseModel refreshTokenResponseModel}){
//     PreferenceHandler.setStringValue(SharedPreferencesKeys.accessToken,
//         refreshTokenResponseModel.access!.token);
//     PreferenceHandler.setStringValue(SharedPreferencesKeys.accessTokenExpires,
//         refreshTokenResponseModel.access!.expires);
//     PreferenceHandler.setStringValue(SharedPreferencesKeys.refreshToken,
//         refreshTokenResponseModel.refresh!.token);
//     PreferenceHandler.setStringValue(
//         SharedPreferencesKeys.refreshTokenExpires,
//         refreshTokenResponseModel.refresh!.expires);
//   }
//
// }
