import 'dart:convert';
import 'dart:js';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:horoscope_cellcard/pages/auth/account_created.dart';
import 'package:horoscope_cellcard/utils/api_endpoints.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class RegisterController extends GetxController {
  TextEditingController fullNameController = TextEditingController();
  TextEditingController dobController = TextEditingController();
  TextEditingController genderController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController isProcessing = TextEditingController(text: "false");
  final Future<SharedPreferences> prefs = SharedPreferences.getInstance();

  Future<void> register() async {
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
        'phone_number': phoneNumberController.text
      };

      http.Response response =
          await http.post(url, body: jsonEncode(body), headers: header);

      if (response.statusCode == 200) {
        final json = jsonDecode(response.body);

        fullNameController.clear();
        dobController.clear();
        genderController.clear();
        phoneNumberController.clear();
        isProcessing.clear();
        Get.toNamed('account-created');
      } else {
        throw jsonDecode(response.body)['message'] ?? 'Unknown Error Occured.';
      }
    } catch (e) {
      Get.back();
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
