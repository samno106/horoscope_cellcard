import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:get/get.dart';
import 'package:horoscope_cellcard/utils/api_endpoints.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

import '../utils/shared_prefs.dart';

class RegisterController extends GetxController {
  late TextEditingController fullNameController,
      dobController,
      genderController,
      phoneNumberController,
      otpCodeController,
      isProcessing;

  final Future<SharedPreferences> prefs = SharedPreferences.getInstance();
  var message = 'Unknown Error Occured.';

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
      Get.snackbar(
        "Oh snap!",
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
      Get.snackbar(
        "Oh snap!",
        message,
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
