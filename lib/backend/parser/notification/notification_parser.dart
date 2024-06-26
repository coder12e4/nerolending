import 'package:get/get.dart';

import '../../../helper/shared_pref.dart';
import '../../api/api.dart';
import '../../api/api_end_points.dart';

class NotificationParser {
  final SharedPreferencesManager sharedPreferencesManager;
  final ApiService apiService;
  NotificationParser(
      {required this.sharedPreferencesManager, required this.apiService});

        Future<Response> getNotificationFun() async {
    final String? token = sharedPreferencesManager.getString("accessToken");
    var response = await apiService.getPrivate(
        ApiEndpoint.baseUrl + ApiEndpoint.getNotification, token!);
    return response;
  }

}