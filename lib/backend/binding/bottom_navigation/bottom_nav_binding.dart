import 'package:get/get.dart';

import '../../../controller/bottom_navigation/bottom_nav_controller.dart';
import '../../../controller/home/home_controller.dart';
import '../../../controller/my_request/my_request_controller.dart';
import '../../../controller/profile_controller/profile_controller.dart';

class BottomNavBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => BottomNavController());
    Get.lazyPut(() => HomeController(parser: Get.find()));
    Get.lazyPut(() => MyRequestController(parser: Get.find()));
    Get.lazyPut(() => ProfileController(parser: Get.find()));
  }
}
