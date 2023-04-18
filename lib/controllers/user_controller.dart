import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:horoscope_cellcard/models/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import '../utils/api_endpoints.dart';

class UserController extends GetxController {
  UserModel? userModel;
  var isLoading = false.obs;
  var isSuccess = false.obs;
  bool isAuth = false;

  TextEditingController fullNameController = TextEditingController();
  TextEditingController dobController = TextEditingController();
  TextEditingController genderController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();

  fetchUserData() async {
    isLoading.value = true;
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      String token = "";
      token = prefs.getString('token') ?? "";
      isAuth = prefs.getBool('isAuth') ?? false;

      if (token != "") {
        var header = {
          'Access-Control-Allow-Origin': '*',
          'Access-Control-Allow-Headers':
              'Origin, X-Requested-With, Content-Type, Accept',
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token'
        };
        var url = Uri.parse(
            ApiEndPoints.BASE_URL + ApiEndPoints.AUTHENDPOINTS.PROFILE);
        http.Response response = await http.post(url, headers: header);

        if (response.statusCode == 200) {
          var json = jsonDecode(response.body);
          userModel = UserModel.fromJson(json['data']);
          fullNameController.text = userModel!.fullName;
          dobController.text = userModel!.dob;
          genderController.text = userModel!.gender;
          phoneNumberController.text = userModel!.phoneNumber;
          isLoading.value = false;
          print(userModel?.fullName);
        }
      }
    } catch (e) {
      print(e);
    } finally {
      isLoading.value = false;
    }
  }

  updateUserData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = "";
    token = prefs.getString('token') ?? "";
    isLoading.value = true;
    try {
      var header = {
        'Access-Control-Allow-Origin': '*',
        'Access-Control-Allow-Headers':
            'Origin, X-Requested-With, Content-Type, Accept',
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token'
      };
      var url = Uri.parse(
          ApiEndPoints.BASE_URL + ApiEndPoints.AUTHENDPOINTS.UPDATE_PROFILE);

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
        userModel = UserModel.fromJson(json['data']);
        fullNameController.text = userModel!.fullName;
        dobController.text = userModel!.dob;
        genderController.text = userModel!.gender;
        phoneNumberController.text = userModel!.phoneNumber;
        fetchUserData();
        isSuccess.value = false;
        isLoading.value = false;
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
    } finally {
      isLoading.value = false;
      isSuccess.value = false;
    }
  }
}
