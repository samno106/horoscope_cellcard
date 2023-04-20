import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/user_controller.dart';

class AuthMiddleware extends GetMiddleware {
  final userController = Get.put(UserController());

  @override
  int? get priority => 2;

  @override
  RouteSettings? redirect(String? route) {
    if (!userController.isAuth.value) {
      return const RouteSettings(name: 'auth');
    }
  }
}
