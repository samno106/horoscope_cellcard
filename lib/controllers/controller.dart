import 'package:get/get.dart';
import '../utils/shared_prefs.dart';

class BottomNavbarController extends GetxController {
  int tapIndex = 1;

  changeTabIndex(int index) async {
    var user = await SharedPrefs().getUser();
    if (index == 0 && user == null || index == 2 && user == null) {
      return Get.toNamed('auth');
    }
    tapIndex = index;
    update();
  }
}
