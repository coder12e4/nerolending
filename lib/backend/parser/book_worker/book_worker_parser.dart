import 'dart:developer';

import 'package:get/get.dart';

import '../../../helper/shared_pref.dart';
import '../../api/api.dart';
import '../../api/api_end_points.dart';

class BookWorkerParser {
  final SharedPreferencesManager sharedPreferencesManager;
  final ApiService apiService;
  BookWorkerParser(
      {required this.sharedPreferencesManager, required this.apiService});
  Future<Response> bookWorker(body) async {
    String accessToken =
        sharedPreferencesManager.getString("accessToken") ?? "";
    log("token : $accessToken");
    var response = await apiService.postPrivate(
        ApiEndpoint.baseUrl + ApiEndpoint.bookWorker, body, accessToken,);
    return response;
  }
}
