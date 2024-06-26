// To parse this JSON data, do
//
//     final registerData = registerDataFromJson(jsonString);

import 'dart:convert';

RegisterData registerDataFromJson(String str) =>
    RegisterData.fromJson(json.decode(str));

String registerDataToJson(RegisterData data) => json.encode(data.toJson());

class RegisterData {
  bool? status;
  Data data;
  String message;

  RegisterData({
    required this.status,
    required this.data,
    required this.message,
  });

  factory RegisterData.fromJson(Map<String, dynamic> json) => RegisterData(
        status: json["status"],
        data: Data.fromJson(json["data"]),
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "data": data.toJson(),
        "message": message,
      };
}

class Data {
  int otp;
  String email;

  Data({
    required this.otp,
    required this.email,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        otp: json["otp"],
        email: json["email"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "otp": otp,
        "email": email ?? "",
      };
}
