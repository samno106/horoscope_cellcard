import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/user_controller.dart';

class GuestMiddleware extends GetMiddleware {
  final userController = Get.put(UserController());
  @override
  int? get priority => 1;

  @override
  RouteSettings? redirect(String? route) {
    if (userController.isAuth.value) {
      return const RouteSettings(name: '/');
    }
  }
}
