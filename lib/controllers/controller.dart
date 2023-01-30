import 'package:get/get.dart';

class BottomNavbarController extends GetxController {
  int tapIndex = 1;

  void changeTabIndex(int index) {
    tapIndex = index;
    update();
  }
}
