//
// import 'BaseResponseModel.dart';
//
// class RefreshTokenResponseModel extends BaseResponseModel {
//   AccessToken? access;
//   RefreshToken? refresh;
//
//   RefreshTokenResponseModel.fromError({required Map<String, dynamic> errorData})
//       : super.fromJson(data: errorData);
//
//
//   RefreshTokenResponseModel.fromJson(Map<String, dynamic> json) {
//     access = (json['access'] != null ? AccessToken.fromJson(json['access']) : null);
//     refresh = (json['refresh'] != null ? RefreshToken.fromJson(json['refresh']) : null);
//   }
// }
//
// class ErrorModel {
//   String statusCode;
//   String statusMessage;
//
//   ErrorModel({
//     required this.statusCode,
//     required this.statusMessage,
//   });
//   factory ErrorModel.fromJson(Map<String, dynamic> json) {
//     return ErrorModel(
//       statusMessage: json['statusMessage'],
//       statusCode: json['statusCode'],
//     );
//   }
// }
//
//
// class RefreshToken {
//   String token;
//   String expires;
//
//   RefreshToken({
//     required this.token,
//     required this.expires,
//   });
//
//   factory RefreshToken.fromJson(Map<String, dynamic> json) {
//     return RefreshToken(
//       token: json['token'],
//       expires: json['expires'],
//     );
//   }
// }
//
// class AccessToken {
//   String token;
//   String expires;
//
//   AccessToken({
//     required this.token,
//     required this.expires,
//   });
//
//   factory AccessToken.fromJson(Map<String, dynamic> json) {
//     return AccessToken(
//       token: json['token'],
//       expires: json['expires'],
//     );
//   }
// }
//
// class Token {
//   AccessToken access;
//   RefreshToken refresh;
//
//   Token({
//     required this.access,
//     required this.refresh,
//   });
//
//   factory Token.fromJson(Map<String, dynamic> json) {
//     return Token(
//       access: AccessToken.fromJson(json['access']),
//       refresh: RefreshToken.fromJson(json['refresh']),
//     );
//   }
// }
