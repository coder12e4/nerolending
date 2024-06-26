import 'dart:developer';

import 'package:get/get.dart';

import '../../backend/model/my_request_model/my_request_model.dart';
import '../../backend/parser/my_request/my_request_parser.dart';
import '../../util/toast.dart';

class MyRequestController extends GetxController implements GetxService {
  final MyRequestParser parser;
  MyRequestController({required this.parser});
  @override
  void onInit() {
    getMyRequests();
    super.onInit();
  }

  bool loading = true;
  MyRequest? myRequest;
  String selectedRequest = "All Request";
  Future<void> getMyRequests({id}) async {
    final body = {
      "status": id,
    };
    Response response = await parser.getMyRequests(body);

    log('my request response ${response.body}');
    try {
      if (response.statusCode == 200) {
        loading = false;
        myRequest = MyRequest.fromJson(response.body);
        // if (response.body['status'] == true) {
        //   successToast(response.body['message']);
        // }
      } else {
        showToast('${response.body['data']['error'][0]}'.toString());
      }
    } catch (e, stackTrace) {
      log('book worker catch $e  ', error: e, stackTrace: stackTrace);
    }
    update();
  }
}
