
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../services/get_user_loged_service.dart';

class GuestMiddleware extends GetMiddleware {
  final _sigenedInUser = Get.put(GetUserLogedService());

  @override
  int? get priority => 1;

  @override
  RouteSettings? redirect(String? route) {
    if (_sigenedInUser.isLoggedIn == true) {
      return const RouteSettings(name: '/');
    }
    return null;
  }
}
