import 'dart:developer';

import 'package:get/get.dart';
import '../../../helper/router.dart';
import '../../../util/loading_widget.dart';
import '../../../util/toast.dart';

import '../../../backend/model/request_details_model/request_details_model.dart';
import '../../../backend/parser/my_request/request_deatils_parser/request_deatils.dart';
import '../../rating_screen/rating_screen_controller.dart';

class RequestDetailsController extends GetxController implements GetxService {
  final RequestDetailsParser parser;
  String disputeTitle = "";
  String disputeDes = "";
  String disputeAns = "";
  RequestDetailsController({required this.parser});
  @override
  void onInit() {
    var id = Get.arguments[0];
    if (Get.arguments[1] != null) {
      navigation = Get.arguments[1];
    }
    getRequestDetails(id);
    // parser.sharedPreferencesManager.putInt("booking_id", id);
    super.onInit();
  }

  String navigation = "";
  String token = "";
  bool loading = true;
  bool paymentSelected = false;
  RequestDetails? requestDetails;
  Future<void> getRequestDetails(id) async {
    Response response = await parser.getRequestDetails(id);
    loading = !loading;
    log("request Details response ${response.body}");
    try {
      if (response.statusCode == 200) {
        requestDetails = RequestDetails.fromJson(response.body);
        disputeTitle = requestDetails!.data.dispute?.title ?? "Not available";
        disputeDes =
            requestDetails!.data.dispute?.description ?? "Not available";
        disputeAns = requestDetails!.data.dispute?.answer ?? "";

        log("$disputeAns ,$disputeDes , $disputeTitle");
      } else {
        showToast(response.body["errors"][0]);
      }
    } catch (e, stackTrace) {
      log('request details response $e', error: e, stackTrace: stackTrace);
    }
    update();
  }

  void updatePaymentSelection() {
    paymentSelected = !paymentSelected;
    update();
  }

  Future<void> updatePayment() async {
    loadingWidget();
    final body = {
      "id": requestDetails?.data.id,
    };
    Response response = await parser.updatePayment(body);
    Get.back();
    log("payment update response ${response.body}");
    try {
      if (response.statusCode == 200) {
        Get.back();
        successToast(response.body["data"]["success"]);

        Get.delete<RatingScreenController>(force: true);
        Get.offNamed(AppRouter.getRatingScreenRoute(),
            arguments: [requestDetails?.data.requestNumber]);
      } else {
        showToast(response.body["data"]["error"][0]);
      }
    } catch (e, stackTrace) {
      log('payment update response $e', error: e, stackTrace: stackTrace);
    }
    update();
  }

  Future<void> deleteRequest() async {
    loadingWidget();
    final body = {
      "id": requestDetails?.data.id,
    };
    Response response = await parser.deleteRequest(body);
    Get.back();
    log("request Delete response ${response.body}");
    try {
      if (response.statusCode == 200) {
        successToast(response.body["data"]["success"]);
        Get.offAllNamed(AppRouter.getBottomNavRoute(), arguments: [1]);
      } else {
        showToast(response.body["data"]["error"][0]);
      }
    } catch (e, stackTrace) {
      log('request details response $e', error: e, stackTrace: stackTrace);
    }
    update();
  }
}
