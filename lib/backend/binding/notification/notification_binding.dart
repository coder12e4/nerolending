import 'package:get/get.dart';
import '../../../controller/notification/notification_controller.dart';

class NotificationBinding extends Bindings {
  @override
  void dependencies() async {
    Get.lazyPut(
      () => NotificationController(parser: Get.find()),
    );
  }
}
