import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../utils/shared_prefs.dart';

class GuestMiddleware extends GetMiddleware {
  @override
  int? get priority => 1;

  @override
  RouteSettings? redirect(String? route) {
    if (getAuthToken() != null) {
      return const RouteSettings(name: '/');
    }
  }

  Future<void> getAuthToken() async {
    var token = await SharedPrefs().getAuth();

    return token;
  }
}
