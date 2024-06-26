import 'dart:convert';

Catogery catogeryFromJson(String str) => Catogery.fromJson(json.decode(str));

String catogeryToJson(Catogery data) => json.encode(data.toJson());

class Catogery {
  bool status;
  List<CatogoryData> data;
  String message;

  Catogery({
    required this.status,
    required this.data,
    required this.message,
  });

  factory Catogery.fromJson(Map<String, dynamic> json) => Catogery(
        status: json["status"],
        data: List<CatogoryData>.from(
            json["data"].map((x) => CatogoryData.fromJson(x))),
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "message": message,
      };
}

class CatogoryData {
  int id;
  String name;
  String? minWageDaily;
  String? maxWageHourly;
  String? minWageHourly;
  String? maxWageDaily;
  String statusId;
  DateTime? createdAt;
  String image;

  CatogoryData({
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

  factory CatogoryData.fromJson(Map<String, dynamic> json) => CatogoryData(
        id: json["id"],
        name: json["name"],
        minWageDaily: json["min_wage_daily"],
        maxWageHourly: json["max_wage_hourly"],
        minWageHourly: json["min_wage_hourly"],
        maxWageDaily: json["max_wage_daily"],
        statusId: json["status_id"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
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
        "created_at": createdAt?.toIso8601String(),
        "image": image,
      };
}
