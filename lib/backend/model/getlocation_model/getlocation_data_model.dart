// To parse this JSON data, do
//
//     final getLocation = getLocationFromJson(jsonString);

import 'dart:convert';

GetLocation getLocationFromJson(String str) => GetLocation.fromJson(json.decode(str));

String getLocationToJson(GetLocation data) => json.encode(data.toJson());

class GetLocation {
    bool success;
    List<LocationData> data;
    String message;

    GetLocation({
        required this.success,
        required this.data,
        required this.message,
    });

    factory GetLocation.fromJson(Map<String, dynamic> json) => GetLocation(
        success: json["success"],
        data: List<LocationData>.from(json["data"].map((x) => LocationData.fromJson(x))),
        message: json["message"],
    );

    Map<String, dynamic> toJson() => {
        "success": success,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "message": message,
    };
}

class LocationData {
    int id;
    String name;
    String country;
    String latitude;
    String longitude;
    String radius;
    String statusId;
    dynamic createdAt;
    dynamic updatedAt;

    LocationData({
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

    factory LocationData.fromJson(Map<String, dynamic> json) => LocationData(
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
