import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/auth_controller.dart';

class GuestMiddleware extends GetMiddleware {
  final _authController = Get.put(AuthController());
  @override
  int? get priority => 1;

  @override
  RouteSettings? redirect(String? route) {
    if (_authController.isAuth) {
      return const RouteSettings(name: '/');
    }
    return null;
  }
}
