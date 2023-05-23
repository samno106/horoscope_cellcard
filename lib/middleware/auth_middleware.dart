import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:horoscope_cellcard/services/get_user_loged_service.dart';
import 'package:horoscope_cellcard/utils/shared_prefs.dart';

class AuthMiddleware extends GetMiddleware {
  var _sigenedInUser = Get.put(GetUserLogedService());

  @override
  int? get priority => 2;

  @override
  RouteSettings? redirect(String? route) {
    if (_sigenedInUser.isLoggedIn == false) {
      return const RouteSettings(name: 'auth');
    }
  }
}
