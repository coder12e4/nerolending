// To parse this JSON data, do
//
//     final user = userFromJson(jsonString);

import 'dart:convert';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {
    Data data;

    User({
        required this.data,
    });

    factory User.fromJson(Map<String, dynamic> json) => User(
        data: Data.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "data": data.toJson(),
    };
}

class Data {
    int id;
    String name;
    String email;
    String phone;
    int statusId;
    DateTime createdAt;
    String image;

    Data({
        required this.id,
        required this.name,
        required this.email,
        required this.phone,
        required this.statusId,
        required this.createdAt,
        required this.image,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        phone: json["phone"],
        statusId: json["status_id"],
        createdAt: DateTime.parse(json["created_at"]),
        image: json["image"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
        "phone": phone,
        "status_id": statusId,
        "created_at": createdAt.toIso8601String(),
        "image": image,
    };
}
