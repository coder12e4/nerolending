import 'package:get/get.dart';

import '../../../controller/connectivity/connectivity_checker.dart';

class ConnectivityBinding extends Bindings {
  @override
  void dependencies() async {
    Get.put(
      () => ConnectivityService(),
    );
  }
}
