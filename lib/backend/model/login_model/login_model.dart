// To parse this JSON data, do
//
//     final logindata = logindataFromJson(jsonString);

import 'dart:convert';

LoginData logindataFromJson(String str) => LoginData.fromJson(json.decode(str));

String logindataToJson(LoginData data) => json.encode(data.toJson());

class LoginData {
  bool? success;
  Data data;
  String message;

  LoginData({
    required this.success,
    required this.data,
    required this.message,
  });

  factory LoginData.fromJson(Map<String, dynamic> json) => LoginData(
        success: json["success"],
        data: Data.fromJson(json["data"]),
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "data": data.toJson(),
        "message": message,
      };
}

class Data {
  String token;
  String name;

  Data({
    required this.token,
    required this.name,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        token: json["token"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "token": token,
        "name": name,
      };
}
