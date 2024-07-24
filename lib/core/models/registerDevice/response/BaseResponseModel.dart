// import '../../baseResponseErrorModel/ValidationErrorModel.dart';
// class BaseResponseModel {
//   String message = "";
//   int code = -1;
//   List<ValidationErrorModel>? validationFailures;
//
//   BaseResponseModel();
//
//   BaseResponseModel.fromJson({required Map<String, dynamic> data}) {
//     code = data[APIConstants.statusCode];
//     message = data[APIConstants.statusMessage];
//     validationFailures = data[APIConstants.validationFailures];
//   }
//
//   Map<String, dynamic> toJson() {
//     final errorData = <String, dynamic>{};
//     errorData[APIConstants.statusCode] = code;
//     errorData[APIConstants.statusMessage] = message;
//     errorData[APIConstants.validationFailures] = validationFailures;
//     return errorData;
//   }
// }
