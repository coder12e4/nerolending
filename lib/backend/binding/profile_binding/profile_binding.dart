import 'package:get/get.dart';
import '../../../controller/profile_controller/profile_controller.dart';

class ProfileBinding extends Bindings {
  @override
  void dependencies() async {
    Get.lazyPut(
      () => ProfileController(parser: Get.find()),
    );
  }
}
