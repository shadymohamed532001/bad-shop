import 'data.dart';

class BagAuthModel {
  bool? status;
  String? message;
  Data? data;

  BagAuthModel({this.status, this.message, this.data});

  factory BagAuthModel.fromJson(Map<String, dynamic> json) => BagAuthModel(
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
