class ValidationErrorModel {
  late final String ValidationCode;
  late final String ValidationMessage;

  ValidationErrorModel(this.ValidationCode, this.ValidationMessage);

  ValidationErrorModel.fromJson(Map<String, dynamic> json) {
    ValidationCode = json['ValidationCode'];
    ValidationMessage = json['ValidationMessage'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['ValidationCode'] = ValidationCode;
    _data['ValidationMessage'] = ValidationMessage;
    return _data;
  }
}
