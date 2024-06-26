import 'dart:developer';

import 'package:get/get.dart';
import '../../../backend/api/api_end_points.dart';

import '../../../helper/shared_pref.dart';
import '../../api/api.dart';

class HomeParser {
  final SharedPreferencesManager sharedPreferencesManager;
  final ApiService apiService;
  HomeParser(
      {required this.sharedPreferencesManager, required this.apiService});
  Future<Response> getLocationFunction() async {
    var response = await apiService.postPublic(
        ApiEndpoint.baseUrl + ApiEndpoint.getLocationList, "");
    return response;
  }

  Future<Response> getCatogeryFunction() async {
    var response = await apiService.postPublic(
        ApiEndpoint.baseUrl + ApiEndpoint.getCategory, "");
    return response;
  }

  Future<Response> getAgentFunction(body) async {
    // log(ApiEndpoint.baseUrl + ApiEndpoint.getAgentList);
    var response = await apiService.postPublic(
        ApiEndpoint.baseUrl + ApiEndpoint.getAgentList, body ?? "");
    return response;
  }
}
