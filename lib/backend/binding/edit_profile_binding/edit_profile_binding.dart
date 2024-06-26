import 'package:get/get.dart';

import '../../../controller/edit_profile/edit_profile_controller.dart';

class EditProfileBinding extends Bindings {
  @override
  void dependencies() async {
    Get.lazyPut(
      () => EditProfileController(parser: Get.find()),
    );
  }
}
