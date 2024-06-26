import 'package:get/get.dart';
import '../../../controller/rating_screen/rating_screen_controller.dart';

class RatingScreenBinding extends Bindings {
  @override
  void dependencies() async {
    Get.lazyPut(
      () => RatingScreenController(parser: Get.find()),
    );
  }
}
