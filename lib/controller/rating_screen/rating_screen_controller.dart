import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../../../backend/model/request_details_model/request_details_model.dart';
import '../../../util/loading_widget.dart';
import '../../../util/toast.dart';

import '../../backend/model/rating/rating_questions_model.dart';
import '../../backend/parser/rating_screen_parser/rating_screen_parser.dart';

class RatingScreenController extends GetxController implements GetxService {
  final RatingScreenParser parser;
  RatingScreenController({required this.parser});
  @override
  void onInit() {
    id = Get.arguments[0].toString();
    getRatingQuestions();
    getRequestDetails(id);
    super.onInit();
  }

  String? id;
  TextEditingController questionOneController = TextEditingController();
  TextEditingController questionTwoController = TextEditingController();
  TextEditingController questionThreeController = TextEditingController();
  RequestDetails? requestDetails;
  bool isRatted = false;
  bool isDisputeCreated = false;
  double? rating;
  bool loading = true;
  double totalrating = 0;
  RatingQuestions? ratingQuestions;
  void rate() {
    isRatted = !isRatted;
    update();
  }

  void createDispute() {
    isDisputeCreated = !isDisputeCreated;
    update();
  }

  Future<void> getRequestDetails(id) async {
    Response response = await parser.getRequestDetails(id);
    loading = false;
    log("request Details response ${response.body}");
    try {
      if (response.statusCode == 200) {
        requestDetails = RequestDetails.fromJson(response.body);
        totalrating = requestDetails!.data.totalRating as double;
        log("feedback totalRating : ${totalrating.toString()}");
      } else {
        showToast(response.body["errors"][0]);
      }
    } catch (e, stackTrace) {
      log('request details response $e', error: e, stackTrace: stackTrace);
    }
    update();
  }

  Future<void> getRatingQuestions() async {
    Response response = await parser.getRatingQuestions();

    log("rating questions response ${response.body}");
    try {
      if (response.statusCode == 200) {
        ratingQuestions = RatingQuestions.fromJson(response.body);
      } else {
        showToast(response.body["errors"][0]);
      }
    } catch (e, stackTrace) {
      log('request details response $e', error: e, stackTrace: stackTrace);
    }
    update();
  }

  Future<void> addRating() async {
    loadingWidget();
    final body = {
      "agent_id": requestDetails?.data.agentDetail.id,
      "rating": rating,
      "comment": questionOneController.text +
          questionTwoController.text +
          questionThreeController.text,
      "booking_id": requestDetails!.data.id
    };
    Response response = await parser.addRating(body);
    log("add rating response ${response.body}");
    Get.back();
    try {
      if (response.statusCode == 200) {
        isRatted == false ? rate() : null;
        successToast(response.body["data"]["success"]);
        getRequestDetails(id);
      } else {
        showToast(response.body["data"]["error"][0]);
      }
    } catch (e, stackTrace) {
      log('add rating catch $e', error: e, stackTrace: stackTrace);
    }
  }
}
