import 'data.dart';

class BagLoginModel {
  bool? status;
  String? message;
  Data? data;

  BagLoginModel({this.status, this.message, this.data});

  factory BagLoginModel.fromJson(Map<String, dynamic> json) => BagLoginModel(
        status: json['status'] as bool?,
        message: json['message'] as String?,
        data: json['data'] == null
            ? null
            : Data.fromJson(json['data'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'status': status,
        'message': message,
        'data': data?.toJson(),
      };
}
