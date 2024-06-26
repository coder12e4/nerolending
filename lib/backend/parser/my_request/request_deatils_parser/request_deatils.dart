import 'dart:developer';

import 'package:get/get.dart';

import '../../../../helper/shared_pref.dart';
import '../../../api/api.dart';
import '../../../api/api_end_points.dart';

class RequestDetailsParser {
  final SharedPreferencesManager sharedPreferencesManager;
  final ApiService apiService;
  RequestDetailsParser(
      {required this.sharedPreferencesManager, required this.apiService});
  Future<Response> getRequestDetails(id) async {
    String accessToken =
        sharedPreferencesManager.getString("accessToken") ?? "";
    log(accessToken);
    log("order id${id.toString()}");
    var response = await apiService.getPrivate(
        "${ApiEndpoint.baseUrl + ApiEndpoint.bookingDetails}$id", accessToken);
    return response;
  }

  Future<Response> deleteRequest(body) async {
    String accessToken =
        sharedPreferencesManager.getString("accessToken") ?? "";
    var response = await apiService.postPrivate(
        ApiEndpoint.baseUrl + ApiEndpoint.deleteBooking, body, accessToken);
    return response;
  }

  Future<Response> updatePayment(body) async {
    String accessToken =
        sharedPreferencesManager.getString("accessToken") ?? "";
    var response = await apiService.postPrivate(
        ApiEndpoint.baseUrl + ApiEndpoint.updatePayment, body, accessToken);
    return response;
  }
}
