// To parse this JSON data, do
//
//     final ratingQuestions = ratingQuestionsFromJson(jsonString);

import 'dart:convert';

RatingQuestions ratingQuestionsFromJson(String str) =>
    RatingQuestions.fromJson(json.decode(str));

String ratingQuestionsToJson(RatingQuestions data) =>
    json.encode(data.toJson());

class RatingQuestions {
  bool status;
  List<String> data;
  String message;

  RatingQuestions({
    required this.status,
    required this.data,
    required this.message,
  });

  factory RatingQuestions.fromJson(Map<String, dynamic> json) =>
      RatingQuestions(
        status: json["status"],
        data: List<String>.from(json["data"].map((x) => x)),
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "data": List<dynamic>.from(data.map((x) => x)),
        "message": message,
      };
}
