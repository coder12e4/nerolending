import 'package:get/get.dart';
import '../../../controller/dispute_screen/dispute_controller.dart';

class DisputeBinding extends Bindings {
  @override
  void dependencies() async {
    Get.lazyPut(
      () => DisputeController(parser: Get.find()),
    );
  }
}
