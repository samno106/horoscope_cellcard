import 'package:get/get.dart';
import 'package:horoscope_cellcard/controllers/auth_controller.dart';
import 'package:horoscope_cellcard/controllers/login_controller.dart';
import 'package:horoscope_cellcard/controllers/register_controller.dart';

class ControllerBindings extends Bindings {
  @override
  void dependencies() {
    Get.put<RegisterController>(RegisterController());
    Get.put<LoginController>(LoginController());
    Get.put<AuthController>(AuthController());
  }
}