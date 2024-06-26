// To parse this JSON data, do
//
//     final agentList = agentListFromJson(jsonString);

import 'dart:convert';

AgentList agentListFromJson(String str) => AgentList.fromJson(json.decode(str));

String agentListToJson(AgentList data) => json.encode(data.toJson());

class AgentList {
  bool success;
  List<AgentListData> data;
  String message;

  AgentList({
    required this.success,
    required this.data,
    required this.message,
  });

  factory AgentList.fromJson(Map<String, dynamic> json) => AgentList(
        success: json["status"],
        data: List<AgentListData>.from(
            json["data"].map((x) => AgentListData.fromJson(x))),
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "message": message,
      };
}

class AgentListData {
  int id;
  String name;
  String email;
  String phone;
  int statusId;
  String image;
  String? location;
  num starRating;
  num totalRatings;
  AgentListData({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.statusId,
    required this.image,
    required this.location,
    required this.starRating,
    required this.totalRatings,
  });

  factory AgentListData.fromJson(Map<String, dynamic> json) => AgentListData(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        phone: json["phone"],
        statusId: json["status_id"],
        image: json["image"] ?? "",
        location: json["location"] ?? "",
        starRating: json["star_rating "] ?? 0,
        totalRatings: json["total_ratings"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
        "phone": phone,
        "status_id": statusId,
        "image": image,
        "location": location,
        "star_rating ": starRating,
        "total_ratings": totalRatings,
      };
}
