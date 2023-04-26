import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:horoscope_cellcard/utils/shared_prefs.dart';

class AuthMiddleware extends GetMiddleware {
  @override
  int? get priority => 2;

  @override
  RouteSettings? redirect(String? route) {
    if (getAuthToken() == null) {
      return const RouteSettings(name: 'auth');
    }
  }

  Future<void> getAuthToken() async {
    var token = await SharedPrefs().getAuth();

    return token;
  }
}
