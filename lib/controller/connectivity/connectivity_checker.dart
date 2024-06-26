import 'dart:developer';

import 'package:connectivity/connectivity.dart';
import 'package:get/get.dart';

class ConnectivityService extends GetxService {
  var isInternetOn = true.obs;

  @override
  void onInit() {
    super.onInit();
    log('connectivity init called');

    _checkInternetConnection();

    Connectivity().onConnectivityChanged.listen((ConnectivityResult result) {
      _checkInternetConnection();
    });
  }

  void _checkInternetConnection() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      isInternetOn.value = false;
    } else {
      isInternetOn.value = true;
    }
    log("connectivity ${isInternetOn.value}");
  }
}
