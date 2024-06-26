import 'dart:developer';

import 'package:get/get.dart';

import '../../../helper/shared_pref.dart';
import '../../api/api.dart';
import '../../api/api_end_points.dart';

class DisputeParser {
  final SharedPreferencesManager sharedPreferencesManager;
  final ApiService apiService;
  DisputeParser(
      {required this.sharedPreferencesManager, required this.apiService});

  Future<Response> addDisputeFunction(body) async {
    log(ApiEndpoint.baseUrl + ApiEndpoint.addDispute);
    final String token = sharedPreferencesManager.getString("accessToken")!;
    log("accessToken : $token");
    log("add dispute body : $body");

    var response = await apiService.postPrivate(
        ApiEndpoint.baseUrl + ApiEndpoint.addDispute, body, token);
    return response;
  }
}
