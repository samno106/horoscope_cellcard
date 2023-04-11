import 'package:get/get.dart';

import 'auth_controller.dart';

class BottomNavbarController extends GetxController {
  final _authController = Get.put(AuthController());
  int tapIndex = 1;

  Future? changeTabIndex(int index) {
    if (index == 2 && !_authController.isAuth) {
      return Get.toNamed('auth');
    }
    tapIndex = index;
    update();
  }
}
