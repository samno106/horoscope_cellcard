import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:horoscope_cellcard/utils/shared_prefs.dart';

import 'package:http/http.dart' as http;

import '../constants/language.dart';
import '../services/get_user_loged_service.dart';
import '../utils/api_endpoints.dart';
import '../wegets/snackbar_alert.dart';

class LoginController extends GetxController {
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController otpCodeController = TextEditingController();

  RxBool isLoading = false.obs;
  var message = languages[96].kh;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
    phoneNumberController.dispose();
    otpCodeController.dispose();
  }

  void loginSendOtp() async {
    isLoading(true);
    try {
      String apiKey = await SharedPrefs().getApiKey();

      var header = {
        'Content-Type': 'application/json',
        'Access-Control-Allow-Origin': '*',
        'Access-Control-Allow-Headers':
            'Origin, X-Requested-With, Content-Type, Accept',
        'ApiKey': apiKey
      };
      var url = Uri.parse(BaseUrl.BASE_URL + ApiEndPoints.AUTHENDPOINTS.LOGIN);

      Map body = {'phone_number': phoneNumberController.text};

      http.Response response =
          await http.post(url, body: jsonEncode(body), headers: header);

      if (response.statusCode == 200) {
        final json = jsonDecode(response.body);
        isLoading(false);
        var returncode = json['returncode'];
        if (returncode == "00") {
          Get.toNamed('confirm-otp-login');
        }
      } else {
        isLoading(false);
        final jsonData = jsonDecode(response.body);
        message = jsonData['message'];
        throw message;
      }
    } catch (e) {
      isLoading(false);
      SnackbarAlert().erorrAlert(message, languages[97].kh);
    }
  }

  void confirmOtp() async {
    var sigenedInUser = Get.put(GetUserLogedService());
    isLoading(true);
    try {
      String apiKey = await SharedPrefs().getApiKey();

      var header = {
        'Content-Type': 'application/json',
        'Access-Control-Allow-Origin': '*',
        'Access-Control-Allow-Headers':
            'Origin, X-Requested-With, Content-Type, Accept',
        'ApiKey': apiKey
      };
      var url = Uri.parse(
          BaseUrl.BASE_URL + ApiEndPoints.AUTHENDPOINTS.LOGIN_CONFIRM_OTP);

      Map body = {
        'phone_number': phoneNumberController.text,
        'otp_code': otpCodeController.text
      };

      http.Response response =
          await http.post(url, body: jsonEncode(body), headers: header);
      if (response.statusCode == 200) {
        final json = jsonDecode(response.body);

        await SharedPrefs().storeUser(jsonEncode(json['data']));
        sigenedInUser.isUserSignedIn();

        var redirect = await SharedPrefs().getloginRedirectRoute();

        phoneNumberController.clear();
        otpCodeController.clear();
        isLoading(false);
        if (redirect == 'home') {
          Get.offAllNamed('/');
        } else {
          Get.offAllNamed('/account');
        }

        await SnackbarAlert().successAlert(languages[91].kh, languages[92].kh);
      } else {
        isLoading(false);
        final jsonData = jsonDecode(response.body);
        // message = jsonData['message'];
        throw jsonData['message'] ?? 'Unknown Error Occured.';
      }
    } catch (e) {
      isLoading(false);
      SnackbarAlert().erorrAlert(message, languages[97].kh);
    }
  }
}
