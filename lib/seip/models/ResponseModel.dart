import 'Errors.dart';

class ResponseModel {
  late String success;
  late Errors errors;
  ResponseModel({
    required this.success,
    required this.errors,});

  ResponseModel.fromJson(dynamic json) {
    success = json['success'];
    errors = (json['errors'] != null ? Errors.fromJson(json['errors']) : null)!;
  }


  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['success'] = success;
    if (errors != null) {
      map['errors'] = errors.toJson();
    }
    return map;
  }

}