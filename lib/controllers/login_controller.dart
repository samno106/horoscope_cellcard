import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:http/http.dart' as http;

import '../utils/api_endpoints.dart';

class LoginController extends GetxController {
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController otpCodeController = TextEditingController();
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  Future<void> login() async {
    try {
      var header = {
        'Content-Type': 'application/json',
        'Access-Control-Allow-Origin': '*',
        'Access-Control-Allow-Headers':
            'Origin, X-Requested-With, Content-Type, Accept',
      };
      var url =
          Uri.parse(ApiEndPoints.BASE_URL + ApiEndPoints.AUTHENDPOINTS.LOGIN);

      Map body = {
        'code': otpCodeController.text,
        'phone_number': phoneNumberController.text
      };
      http.Response response =
          await http.post(url, body: jsonEncode(body), headers: header);
      if (response.statusCode == 200) {
        final json = jsonDecode(response.body);
        var token = json['data']['token'];
        final SharedPreferences? prefs = await _prefs;

        await prefs?.setString('token', token);
        phoneNumberController.clear();
        otpCodeController.clear();

        Get.toNamed('/');
      } else {
        throw jsonDecode(response.body)['message'] ?? 'Unknown Error Occured.';
      }
    } catch (e) {
      showDialog(
          context: Get.context!,
          builder: (context) {
            return SimpleDialog(
              title: const Text("Error"),
              contentPadding: const EdgeInsets.all(20.0),
              children: [Text(e.toString())],
            );
          });
    }
  }
}
