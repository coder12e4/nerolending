// // To parse this JSON data, do
// //
// //     final requestDetails = requestDetailsFromJson(jsonString);

// import 'dart:convert';

// RequestDetails requestDetailsFromJson(String str) =>
//     RequestDetails.fromJson(json.decode(str));

// String requestDetailsToJson(RequestDetails data) => json.encode(data.toJson());

// class RequestDetails {
//   bool status;
//   Data data;
//   String message;

//   RequestDetails({
//     required this.status,
//     required this.data,
//     required this.message,
//   });

//   factory RequestDetails.fromJson(Map<String, dynamic> json) => RequestDetails(
//         status: json["status"],
//         data: Data.fromJson(json["data"]),
//         message: json["message"],
//       );

//   Map<String, dynamic> toJson() => {
//         "status": status,
//         "data": data.toJson(),
//         "message": message,
//       };
// }

// class Data {
//   int id;
//   String category;
//   int requestNumber;
//   String worker;
//   AgentDetail agentDetail;
//   String status;
//   int statusId;
//   String wageMode;
//   String workerCount;
//   String workingHours;
//   String startTime;
//   String schedule;
//   num amount;
//   bool isRating;
//   dynamic totalRating;
//   bool isDispute;
//   dynamic disputeStatus;
//   dynamic dispute;
//   String paymentStatus;

//   Data({
//     required this.id,
//     required this.category,
//     required this.requestNumber,
//     required this.worker,
//     required this.agentDetail,
//     required this.status,
//     required this.statusId,
//     required this.wageMode,
//     required this.workerCount,
//     required this.workingHours,
//     required this.startTime,
//     required this.schedule,
//     required this.amount,
//     required this.isRating,
//     required this.totalRating,
//     required this.isDispute,
//     required this.disputeStatus,
//     required this.dispute,
//     required this.paymentStatus,
//   });

//   factory Data.fromJson(Map<String, dynamic> json) => Data(
//         id: json["id"],
//         category: json["category"],
//         requestNumber: json["request_number"],
//         worker: json["worker"],
//         agentDetail: AgentDetail.fromJson(json["agent_detail"]),
//         status: json["status"],
//         statusId: json["status_id"],
//         wageMode: json["wage_mode"],
//         workerCount: json["worker_count"],
//         workingHours: json["working_hours"],
//         startTime: json["start_time"],
//         schedule: json["schedule"],
//         amount: json["amount"],
//         isRating: json["is_rating"],
//         totalRating: json["total_rating"],
//         isDispute: json["is_dispute"],
//         disputeStatus: json["dispute_status"],
//         dispute: json["dispute"],
//         paymentStatus: json["payment_status"],
//       );

//   Map<String, dynamic> toJson() => {
//         "id": id,
//         "category": category,
//         "request_number": requestNumber,
//         "worker": worker,
//         "agent_detail": agentDetail.toJson(),
//         "status": status,
//         "status_id": statusId,
//         "wage_mode": wageMode,
//         "worker_count": workerCount,
//         "working_hours": workingHours,
//         "start_time": startTime,
//         "schedule": schedule,
//         "amount": amount,
//         "is_rating": isRating,
//         "total_rating": totalRating,
//         "is_dispute": isDispute,
//         "dispute_status": disputeStatus,
//         "dispute": dispute,
//         "payment_status": paymentStatus,
//       };
// }

// class AgentDetail {
//   int id;
//   String name;
//   String email;
//   String phone;
//   int statusId;
//   String image;
//   String location;
//   int starRating;
//   int totalRatings;

//   AgentDetail({
//     required this.id,
//     required this.name,
//     required this.email,
//     required this.phone,
//     required this.statusId,
//     required this.image,
//     required this.location,
//     required this.starRating,
//     required this.totalRatings,
//   });

//   factory AgentDetail.fromJson(Map<String, dynamic> json) => AgentDetail(
//         id: json["id"],
//         name: json["name"],
//         email: json["email"],
//         phone: json["phone"],
//         statusId: json["status_id"],
//         image: json["image"],
//         location: json["location"],
//         starRating: json["star_rating "],
//         totalRatings: json["total_ratings"],
//       );

//   Map<String, dynamic> toJson() => {
//         "id": id,
//         "name": name,
//         "email": email,
//         "phone": phone,
//         "status_id": statusId,
//         "image": image,
//         "location": location,
//         "star_rating ": starRating,
//         "total_ratings": totalRatings,
//       };
// }

// To parse this JSON data, do
//
//     final requestDetails = requestDetailsFromJson(jsonString);

import 'dart:convert';

RequestDetails requestDetailsFromJson(String str) =>
    RequestDetails.fromJson(json.decode(str));

String requestDetailsToJson(RequestDetails data) => json.encode(data.toJson());

class RequestDetails {
  bool status;
  Data data;
  String message;

  RequestDetails({
    required this.status,
    required this.data,
    required this.message,
  });

  factory RequestDetails.fromJson(Map<String, dynamic> json) => RequestDetails(
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
  String category;
  int requestNumber;
  String worker;
  AgentDetail agentDetail;
  String status;
  int statusId;
  String wageMode;
  String workerCount;
  String workingHours;
  String startTime;
  String schedule;
  double amount;
  bool isRating;
  double totalRating;
  bool isDispute;
  dynamic disputeStatus;
  Dispute? dispute;
  String paymentStatus;

  Data({
    required this.id,
    required this.category,
    required this.requestNumber,
    required this.worker,
    required this.agentDetail,
    required this.status,
    required this.statusId,
    required this.wageMode,
    required this.workerCount,
    required this.workingHours,
    required this.startTime,
    required this.schedule,
    required this.amount,
    required this.isRating,
    required this.totalRating,
    required this.isDispute,
    required this.disputeStatus,
    required this.dispute,
    required this.paymentStatus,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        category: json["category"],
        requestNumber: json["request_number"],
        worker: json["worker"],
        agentDetail: AgentDetail.fromJson(json["agent_detail"]),
        status: json["status"],
        statusId: json["status_id"],
        wageMode: json["wage_mode"],
        workerCount: json["worker_count"],
        workingHours: json["working_hours"],
        startTime: json["start_time"],
        schedule: json["schedule"],
        amount: json["amount"]?.toDouble(),
        isRating: json["is_rating"],
        totalRating: json["total_rating"] is String
            ? double.tryParse(json["total_rating"]) ?? 0.0
            : (json["total_rating"] as num).toDouble(),
        isDispute: json["is_dispute"],
        disputeStatus: json["dispute_status"],
        dispute:
            json["dispute"] != null ? Dispute.fromJson(json["dispute"]) : null,
        paymentStatus: json["payment_status"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "category": category,
        "request_number": requestNumber,
        "worker": worker,
        "agent_detail": agentDetail.toJson(),
        "status": status,
        "status_id": statusId,
        "wage_mode": wageMode,
        "worker_count": workerCount,
        "working_hours": workingHours,
        "start_time": startTime,
        "schedule": schedule,
        "amount": amount,
        "is_rating": isRating,
        "total_rating": totalRating,
        "is_dispute": isDispute,
        "dispute_status": disputeStatus,
        "dispute": dispute?.toJson(),
        "payment_status": paymentStatus,
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
  int totalRatings;

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

class Dispute {
  int id;
  String title;
  String description;
  dynamic answer;
  int bookingId;
  DateTime createdAt;
  DateTime updatedAt;

  Dispute({
    required this.id,
    required this.title,
    required this.description,
    required this.answer,
    required this.bookingId,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Dispute.fromJson(Map<String, dynamic> json) => Dispute(
        id: json["id"],
        title: json["title"],
        description: json["description"],
        answer: json["answer"],
        bookingId: json["booking_id"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "description": description,
        "answer": answer,
        "booking_id": bookingId,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}
