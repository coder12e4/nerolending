import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../../../backend/model/request_details_model/request_details_model.dart';
import '../../../util/loading_widget.dart';
import '../../../util/toast.dart';

import '../../backend/model/getnotification/get_notification_model.dart';
import '../../backend/model/rating/rating_questions_model.dart';
import '../../backend/parser/notification/notification_parser.dart';
import '../../backend/parser/rating_screen_parser/rating_screen_parser.dart';

class NotificationController extends GetxController implements GetxService {
  final NotificationParser parser;
  NotificationController({required this.parser});
  @override
  void onInit() {
    super.onInit();
    log('notification On Init');
    getnotificationDatails();
  }

  @override
  void onReady() {
    log('notification On Ready');
    getnotificationDatails();
    super.onReady();
  }

  String? id;

  GetNotification? notificationDatails;
  bool isRatted = false;
  bool isDisputeCreated = false;
  double? rating;
  bool loading = true;
  double totalrating = 0;
  RatingQuestions? ratingQuestions;
  String? bookingStatus;
  String body = "";

  Future<void> getnotificationDatails() async {
    Response response = await parser.getNotificationFun();
    log("request Details response ${response.body}");
    try {
      loading = false;
      if (response.statusCode == 200) {
        notificationDatails = GetNotification.fromJson(response.body);

        log("Notifications : ${notificationDatails!.data[0].data.body.toString()}");
      } else {
        showToast(response.body["errors"][0]);
      }
    } catch (e, stackTrace) {
      log('request details response $e', error: e, stackTrace: stackTrace);
    }
    update();
  }

  // Future<void> getRatingQuestions() async {
  //   Response response = await parser.getRatingQuestions();

  //   log("rating questions response ${response.body}");
  //   try {
  //     if (response.statusCode == 200) {
  //       ratingQuestions = RatingQuestions.fromJson(response.body);
  //     } else {
  //       showToast(response.body["errors"][0]);
  //     }
  //   } catch (e, stackTrace) {
  //     log('request details response $e', error: e, stackTrace: stackTrace);
  //   }
  //   update();
  // }

  // Future<void> addRating() async {
  //   loadingWidget();
  //   final body = {
  //     "agent_id": requestDetails?.data.agentDetail.id,
  //     "rating": rating,
  //     "comment": questionOneController.text +
  //         questionTwoController.text +
  //         questionThreeController.text,
  //     "booking_id": requestDetails!.data.id
  //   };
  //   Response response = await parser.addRating(body);
  //   log("add rating response ${response.body}");
  //   Get.back();
  //   try {
  //     if (response.statusCode == 200) {
  //       isRatted == false ? rate() : null;
  //       successToast(response.body["data"]["success"]);
  //       getRequestDetails(id);
  //     } else {
  //       showToast(response.body["data"]["error"][0]);
  //     }
  //   } catch (e, stackTrace) {
  //     log('add rating catch $e', error: e, stackTrace: stackTrace);
  //   }
  // }
}
