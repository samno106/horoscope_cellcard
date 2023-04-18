import 'package:get/get.dart';
import 'package:horoscope_cellcard/controllers/user_controller.dart';

class BottomNavbarController extends GetxController {
  final userController = Get.put(UserController());
  int tapIndex = 1;

  Future? changeTabIndex(int index) {
    print(userController.isAuth);
    if (index == 2 && !userController.isAuth) {
      return Get.toNamed('auth');
    }
    tapIndex = index;
    update();
  }
}
