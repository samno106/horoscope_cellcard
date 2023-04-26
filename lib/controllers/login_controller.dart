import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:get/get.dart';
import 'package:horoscope_cellcard/models/user_model.dart';
import 'package:horoscope_cellcard/utils/shared_prefs.dart';

import 'package:http/http.dart' as http;

import '../utils/api_endpoints.dart';

class LoginController extends GetxController {
  late TextEditingController phoneNumberController, otpCodeController;

  late String message = "";

  @override
  void onInit() {
    super.onInit();
    phoneNumberController = TextEditingController();
    otpCodeController = TextEditingController();
  }

  @override
  void onClose() {
    super.onClose();
    phoneNumberController.dispose();
    otpCodeController.dispose();
  }

  login() async {
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

        await SharedPrefs().storeUser(jsonEncode(json['data']));
        Get.toNamed('/');
      } else {
        final jsonData = jsonDecode(response.body);
        message = jsonData['message'];
        throw jsonData['data']['error'] ?? 'Unknown Error Occured.';
      }
    } catch (e) {
      Get.snackbar(
        message,
        e.toString(),
        icon: const Icon(
          FeatherIcons.alertTriangle,
          color: Colors.white,
          size: 26.0,
        ),
        snackPosition: SnackPosition.TOP,
        backgroundColor: const Color(0XFFC72C41),
        borderRadius: 8.0,
        snackStyle: SnackStyle.FLOATING,
        colorText: Colors.white,
        margin: const EdgeInsets.all(15),
        isDismissible: true,
        forwardAnimationCurve: Curves.easeOutBack,
        boxShadows: null,
      );
    }
  }
}
