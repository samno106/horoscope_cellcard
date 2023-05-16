import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:get/get.dart';
import 'package:horoscope_cellcard/models/user_model.dart';
import 'package:horoscope_cellcard/utils/shared_prefs.dart';

import 'package:http/http.dart' as http;

import '../constants/language.dart';
import '../services/get_user_loged_service.dart';
import '../utils/api_endpoints.dart';
import '../wegets/snackbar_alert.dart';

class LoginController extends GetxController {
  late TextEditingController phoneNumberController, otpCodeController;

  var message = languages[96].kh;

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

  Future<void> loginSendOtp() async {
    try {
      var header = {
        'Content-Type': 'application/json',
        'Access-Control-Allow-Origin': '*',
        'Access-Control-Allow-Headers':
            'Origin, X-Requested-With, Content-Type, Accept',
      };
      var url =
          Uri.parse(ApiEndPoints.BASE_URL + ApiEndPoints.AUTHENDPOINTS.LOGIN);

      Map body = {'phone_number': phoneNumberController.text};

      http.Response response =
          await http.post(url, body: jsonEncode(body), headers: header);

      if (response.statusCode == 200) {
        final json = jsonDecode(response.body);

        var returncode = json['returncode'];
        if (returncode == "00") {
          Get.toNamed('confirm-otp-login');
        }
      } else {
        final jsonData = jsonDecode(response.body);
        message = jsonData['message'];
        throw message;
      }
    } catch (e) {
      SnackbarAlert().erorrAlert(message, languages[97].kh);
    }
  }

  Future<void> confirmOtp() async {
    var _sigenedInUser = Get.put(GetUserLogedService());

    try {
      var header = {
        'Content-Type': 'application/json',
        'Access-Control-Allow-Origin': '*',
        'Access-Control-Allow-Headers':
            'Origin, X-Requested-With, Content-Type, Accept',
      };
      var url = Uri.parse(
          ApiEndPoints.BASE_URL + ApiEndPoints.AUTHENDPOINTS.LOGIN_CONFIRM_OTP);

      Map body = {
        'phone_number': phoneNumberController.text,
        'otp_code': otpCodeController.text
      };

      http.Response response =
          await http.post(url, body: jsonEncode(body), headers: header);
      if (response.statusCode == 200) {
        final json = jsonDecode(response.body);

        await SharedPrefs().storeUser(jsonEncode(json['data']));
        _sigenedInUser.isUserSignedIn();

        var redirect = await SharedPrefs().getloginRedirectRoute();

        phoneNumberController.clear();
        otpCodeController.clear();

        if (redirect == 'home') {
          Get.toNamed('/');
        } else {
          Get.toNamed('/account');
        }

        await SnackbarAlert().successAlert(languages[91].kh, languages[92].kh);
      } else {
        final jsonData = jsonDecode(response.body);
        message = jsonData['message'];
        throw jsonData['data']['error'] ?? 'Unknown Error Occured.';
      }
    } catch (e) {
      SnackbarAlert().erorrAlert(message, languages[97].kh);
    }
  }
}
