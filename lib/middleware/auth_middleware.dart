import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:horoscope_cellcard/controllers/auth_controller.dart';

class AuthMiddleware extends GetMiddleware {
  final _authController = Get.put(AuthController());
  @override
  int? get priority => 2;

  @override
  RouteSettings? redirect(String? route) {
    if (!_authController.isAuth) {
      return const RouteSettings(name: 'auth');
    }
    return null;
  }
}
