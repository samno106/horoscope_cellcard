import 'package:get/get.dart';
import '../utils/shared_prefs.dart';

class BottomNavbarController extends GetxController {
  int tapIndex = 1;

  changeTabIndex(int index) async {
    var user = await SharedPrefs().getUser();
    if (index == 2 && user == null) {
      return Get.offAllNamed('auth');
    }
    tapIndex = index;
    update();
  }
}
