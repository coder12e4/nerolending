import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../backend/parser/dispute_parser/dispute_parser.dart';
import '../../util/loading_widget.dart';
import '../../util/toast.dart';
import '../../view/my_request/dispute_created/dispute_created.dart';
import '../rating_screen/rating_screen_controller.dart';

class DisputeController extends GetxController implements GetxService {
  final DisputeParser parser;

  DisputeController({required this.parser});
  @override
  void onInit() {
    
    super.onInit();
    bookingId = parser.sharedPreferencesManager.getInt("booking_id")!;
  }

  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  String accessToken = "";
  int bookingId = 0;
  Future<void> addDispute() async {
    accessToken = parser.sharedPreferencesManager.getString("accessToken")!;
    log("Access Token : $accessToken");
    Map<String, dynamic> body = {
      'title': titleController.text,
      'description': descriptionController.text,
      "booking_id": bookingId
    };
    Response response = await parser.addDisputeFunction(body);
    loadingWidget();
    log("catogery check ${response.body}");

    try {
      if (response.statusCode == 200) {
        Get.back();

        log("add dispute : ${response.body}");
        successToast(response.body['data']["success"]);
        Get.find<RatingScreenController>().createDispute();
        Get.off(
          const DisputeCreatedScreen(),
        );
        titleController.clear();
        descriptionController.clear();
      } else {
        if (response.body['data']['error'][0] != null &&
            response.body['data']['error'][0] != "") {
          Get.back();
          showToast(response.body['data']['error'][0]);
        } else if (response.body['data']['error'][1] != null &&
            response.body['data']['error'][1] != "") {
          Get.back();
          showToast(response.body['data']['error'][1]);
        } else if (response.body['data']['error'][2] != null &&
            response.body['data']['error'][2] != "") {
          Get.back();
          showToast(response.body['data']['error'][2]);
        } else {
          showToast("Something went wrong");
        }
      }
    } catch (e, stackTrace) {
      log('Add Dispute catch $e  ', error: e, stackTrace: stackTrace);
    }
    update();
  }
}
