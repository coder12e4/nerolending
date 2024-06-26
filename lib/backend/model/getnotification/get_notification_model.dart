// To parse this JSON data, do
//
//     final getNotification = getNotificationFromJson(jsonString);

import 'dart:convert';

GetNotification getNotificationFromJson(String str) => GetNotification.fromJson(json.decode(str));

String getNotificationToJson(GetNotification data) => json.encode(data.toJson());

class GetNotification {
    bool status;
    List<NotificationData> data;
    String message;

    GetNotification({
        required this.status,
        required this.data,
        required this.message,
    });

    factory GetNotification.fromJson(Map<String, dynamic> json) => GetNotification(
        status: json["status"],
        data: List<NotificationData>.from(json["data"].map((x) => NotificationData.fromJson(x))),
        message: json["message"],
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "message": message,
    };
}

class NotificationData {
    String id;
    String type;
    String notifiableType;
    int notifiableId;
    Data data;
    dynamic readAt;
    DateTime createdAt;
    DateTime updatedAt;

    NotificationData({
        required this.id,
        required this.type,
        required this.notifiableType,
        required this.notifiableId,
        required this.data,
        required this.readAt,
        required this.createdAt,
        required this.updatedAt,
    });

    factory NotificationData.fromJson(Map<String, dynamic> json) => NotificationData(
        id: json["id"],
        type: json["type"],
        notifiableType: json["notifiable_type"],
        notifiableId: json["notifiable_id"],
        data: Data.fromJson(json["data"]),
        readAt: json["read_at"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "type": type,
        "notifiable_type": notifiableType,
        "notifiable_id": notifiableId,
        "data": data.toJson(),
        "read_at": readAt,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
    };
}

class Data {
    int bookingId;
    String type;
    String title;
    String body;

    Data({
        required this.bookingId,
        required this.type,
        required this.title,
        required this.body,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        bookingId: json["booking_id"],
        type: json["type"],
        title: json["title"],
        body: json["body"],
    );

    Map<String, dynamic> toJson() => {
        "booking_id": bookingId,
        "type": type,
        "title": title,
        "body": body,
    };
}
