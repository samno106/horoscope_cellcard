import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:get/get.dart';
import 'package:horoscope_cellcard/utils/api_endpoints.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

import '../constants/language.dart';
import '../utils/shared_prefs.dart';
import '../wegets/snackbar_alert.dart';

class RegisterController extends GetxController {
  late TextEditingController fullNameController,
      dobController,
      genderController,
      phoneNumberController,
      otpCodeController,
      isProcessing;

  final Future<SharedPreferences> prefs = SharedPreferences.getInstance();
  var message = languages[96].kh;

  @override
  void onInit() {
    super.onInit();
    fullNameController = TextEditingController();
    dobController = TextEditingController();
    genderController = TextEditingController();
    phoneNumberController = TextEditingController();
    otpCodeController = TextEditingController();
    isProcessing = TextEditingController(text: "false");
  }

  @override
  void onClose() {
    super.onClose();
    fullNameController.dispose();
    dobController.dispose();
    genderController.dispose();
    phoneNumberController.dispose();
    otpCodeController.dispose();
    isProcessing.dispose();
  }

  Future<void> registerSendOtp() async {
    try {
      var header = {
        'Access-Control-Allow-Origin': '*',
        'Access-Control-Allow-Headers':
            'Origin, X-Requested-With, Content-Type, Accept',
        'Content-Type': 'application/json',
      };
      var url = Uri.parse(
          ApiEndPoints.BASE_URL + ApiEndPoints.AUTHENDPOINTS.REGISTER);

      Map body = {
        'full_name': fullNameController.text,
        'dob': dobController.text,
        'gender': genderController.text,
        'phone_number': phoneNumberController.text,
        'otp_code': otpCodeController.text
      };

      http.Response response =
          await http.post(url, body: jsonEncode(body), headers: header);

      if (response.statusCode == 200) {
        final json = jsonDecode(response.body);

        var returncode = json['returncode'];
        if (returncode == "00") {
          Get.toNamed('confirm-otp');
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

  Future<void> registerConfirmOtp() async {
    try {
      var header = {
        'Content-Type': 'application/json',
        'Access-Control-Allow-Origin': '*',
        'Access-Control-Allow-Headers':
            'Origin, X-Requested-With, Content-Type, Accept',
      };
      var url = Uri.parse(ApiEndPoints.BASE_URL +
          ApiEndPoints.AUTHENDPOINTS.REGISTER_CONFIRM_OTP);

      Map body = {
        'full_name': fullNameController.text,
        'dob': dobController.text,
        'gender': genderController.text,
        'phone_number': phoneNumberController.text,
        'otp_code': otpCodeController.text
      };

      http.Response response =
          await http.post(url, body: jsonEncode(body), headers: header);

      if (response.statusCode == 200) {
        final json = jsonDecode(response.body);

        await SharedPrefs().storeUser(jsonEncode(json['data']));

        fullNameController.clear();
        dobController.clear();
        genderController.clear();
        phoneNumberController.clear();
        otpCodeController.clear();
        isProcessing.clear();
        Get.toNamed('account-created');
      } else {
        final jsonData = jsonDecode(response.body);
        message = jsonData['message'];
        throw message;
      }
    } catch (e) {
      SnackbarAlert().erorrAlert(message, languages[97].kh);
    }
  }
}
