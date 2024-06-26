import 'package:get/get.dart';
import '../../../../controller/my_request/request_details_controller/request_details_controller.dart';

class RequestDetailsBinding extends Bindings {
  @override
  void dependencies() async {
    Get.lazyPut(
      () => RequestDetailsController(parser: Get.find()),
    );
  }
}
