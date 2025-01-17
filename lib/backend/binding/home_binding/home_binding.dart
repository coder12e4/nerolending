import 'package:get/get.dart';

import '../../../controller/home/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() async {
    Get.lazyPut(
      () => HomeController(parser: Get.find()),
    );
  }
}
