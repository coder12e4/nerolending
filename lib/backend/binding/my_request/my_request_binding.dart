import 'package:get/get.dart';

import '../../../controller/my_request/my_request_controller.dart';

class MyRequestBinding extends Bindings {
  @override
  void dependencies() async {
    Get.lazyPut(
      () => MyRequestController(parser: Get.find()),
    );
  }
}
