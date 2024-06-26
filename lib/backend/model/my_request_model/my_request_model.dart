// To parse this JSON data, do
//
//     final myRequest = myRequestFromJson(jsonString);

import 'dart:convert';

MyRequest myRequestFromJson(String str) => MyRequest.fromJson(json.decode(str));

String myRequestToJson(MyRequest data) => json.encode(data.toJson());

class MyRequest {
  bool status;
  List<AllData> data;
  String message;

  MyRequest({
    required this.status,
    required this.data,
    required this.message,
  });

  factory MyRequest.fromJson(Map<String, dynamic> json) => MyRequest(
        status: json["status"],
        data: List<AllData>.from(json["data"].map((x) => AllData.fromJson(x))),
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "message": message,
      };
}

class AllData {
  int id;
  String category;
  int requestNumber;
  String worker;
  AgentDetail agentDetail;
  String status;

  AllData({
    required this.id,
    required this.category,
    required this.requestNumber,
    required this.worker,
    required this.agentDetail,
    required this.status,
  });

  factory AllData.fromJson(Map<String, dynamic> json) => AllData(
        id: json["id"],
        category: json["category"],
        requestNumber: json["request_number"],
        worker: json["worker"],
        agentDetail: AgentDetail.fromJson(json["agent_detail"]),
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "category": category,
        "request_number": requestNumber,
        "worker": worker,
        "agent_detail": agentDetail.toJson(),
        "status": status,
      };
}

class AgentDetail {
  int id;
  String name;
  String email;
  String phone;
  int statusId;
  String image;
  String location;

  num starRating;
  num totalRatings;

  AgentDetail({
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

  factory AgentDetail.fromJson(Map<String, dynamic> json) => AgentDetail(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        phone: json["phone"],
        statusId: json["status_id"],
        image: json["image"],
        location: json["location"],
        starRating: json["star_rating "],
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
