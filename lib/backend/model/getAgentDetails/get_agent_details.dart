// To parse this JSON data, do
//
//     final getAgentDetails = getAgentDetailsFromJson(jsonString);

import 'dart:convert';

GetAgentDetails getAgentDetailsFromJson(String str) =>
    GetAgentDetails.fromJson(json.decode(str));

String getAgentDetailsToJson(GetAgentDetails data) =>
    json.encode(data.toJson());

class GetAgentDetails {
  bool status;
  Data data;
  String message;

  GetAgentDetails({
    required this.status,
    required this.data,
    required this.message,
  });

  factory GetAgentDetails.fromJson(Map<String, dynamic> json) =>
      GetAgentDetails(
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
  int id;
  String name;
  String email;
  String phone;
  int statusId;
  String image;
  String location;
  List<Location> locations;

  num starRating;
  num totalRatings;

  int isApproved;
  String reason;
  int commission;
  DateTime createdAt;
  int totalWorkers;
  List<Category> categories;

  Data({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.statusId,
    required this.image,
    required this.location,
    required this.locations,
    required this.starRating,
    required this.totalRatings,
    required this.isApproved,
    required this.reason,
    required this.commission,
    required this.createdAt,
    required this.totalWorkers,
    required this.categories,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        phone: json["phone"],
        statusId: json["status_id"] ?? 0,
        image: json["image"],
        location: json["location"] ?? "",
        locations: List<Location>.from(
            json["locations"].map((x) => Location.fromJson(x))),
        starRating: json["star_rating "],
        totalRatings: json["total_ratings"],
        isApproved: json["is_approved"] ?? 0,
        reason: json["reason"] ?? "",
        commission: json["commission"] ?? 0,
        createdAt: DateTime.parse(json["created_at"]),
        totalWorkers: json["total_workers"],
        categories: List<Category>.from(
            json["categories"].map((x) => Category.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
        "phone": phone,
        "status_id": statusId,
        "image": image,
        "location": location,
        "locations": List<dynamic>.from(locations.map((x) => x.toJson())),
        "star_rating ": starRating,
        "total_ratings": totalRatings,
        "is_approved": isApproved,
        "reason": reason,
        "commission": commission,
        "created_at": createdAt.toIso8601String(),
        "total_workers": totalWorkers,
        "categories": List<dynamic>.from(categories.map((x) => x.toJson())),
      };
}

class Category {
  int id;
  String name;
  String? minWageDaily;
  String? maxWageHourly;
  String? minWageHourly;
  String? maxWageDaily;
  String statusId;
  dynamic createdAt;
  String image;

  Category({
    required this.id,
    required this.name,
    required this.minWageDaily,
    required this.maxWageHourly,
    required this.minWageHourly,
    required this.maxWageDaily,
    required this.statusId,
    required this.createdAt,
    required this.image,
  });

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        id: json["id"],
        name: json["name"],
        minWageDaily: json["min_wage_daily"],
        maxWageHourly: json["max_wage_hourly"],
        minWageHourly: json["min_wage_hourly"],
        maxWageDaily: json["max_wage_daily"],
        statusId: json["status_id"],
        createdAt: json["created_at"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "min_wage_daily": minWageDaily,
        "max_wage_hourly": maxWageHourly,
        "min_wage_hourly": minWageHourly,
        "max_wage_daily": maxWageDaily,
        "status_id": statusId,
        "created_at": createdAt,
        "image": image,
      };
}

class Location {
  int id;
  String name;
  String country;
  String latitude;
  String longitude;
  String radius;
  String statusId;
  dynamic createdAt;
  dynamic updatedAt;

  Location({
    required this.id,
    required this.name,
    required this.country,
    required this.latitude,
    required this.longitude,
    required this.radius,
    required this.statusId,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Location.fromJson(Map<String, dynamic> json) => Location(
        id: json["id"],
        name: json["name"],
        country: json["country"],
        latitude: json["latitude"],
        longitude: json["longitude"],
        radius: json["radius"],
        statusId: json["status_id"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "country": country,
        "latitude": latitude,
        "longitude": longitude,
        "radius": radius,
        "status_id": statusId,
        "created_at": createdAt,
        "updated_at": updatedAt,
      };
}
