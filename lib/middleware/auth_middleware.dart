import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:horoscope_cellcard/services/get_user_loged_service.dart';

class AuthMiddleware extends GetMiddleware {
  final _sigenedInUser = Get.put(GetUserLogedService());

  @override
  int? get priority => 2;

  @override
  RouteSettings? redirect(String? route) {
    print(_sigenedInUser.isLoggedIn);
    if (_sigenedInUser.isLoggedIn == false) {
      return const RouteSettings(name: 'auth');
    }
    return null;
  }
}
