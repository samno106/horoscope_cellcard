import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:horoscope_cellcard/models/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import '../utils/api_endpoints.dart';

class UserController extends GetxController {
  var userModel = <UserModel>[].obs;
  RxBool isLoading = false.obs;
  RxBool isSuccess = false.obs;
  RxBool isAuth = false.obs;

  TextEditingController fullNameController = TextEditingController();
  TextEditingController dobController = TextEditingController();
  TextEditingController genderController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();

  @override
  void onInit() async {
    super.onInit();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    isAuth(prefs.getBool('isAuth') ?? false);
    fetchUserData();
    print(prefs.getBool('isAuth'));
  }

  Future<void> fetchUserData() async {
    try {
      isLoading(true);
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      String? token = "";
      token = prefs.getString('token');

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
          UserModel result = UserModel.fromJson(json['data']);

          userModel.add(
            UserModel(
                id: result.id,
                fullName: result.fullName,
                dob: result.dob,
                gender: result.gender,
                phoneNumber: result.phoneNumber,
                isActive: result.isActive,
                isSubscribe: result.isSubscribe,
                createdAt: result.createdAt),
          );

          fullNameController.text = userModel[0].fullName;
          dobController.text = userModel[0].dob;
          genderController.text = userModel[0].gender;
          phoneNumberController.text = userModel[0].phoneNumber;
          isLoading(false);
        }
      }
    } catch (e) {
      print(e);
      isLoading(false);
    } finally {
      isLoading(false);
    }
  }

  Future<void> updateUserData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = "";
    token = prefs.getString('token') ?? "";

    try {
      isLoading(true);
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
        UserModel result = UserModel.fromJson(json['data']);
        userModel.add(
          UserModel(
              id: result.id,
              fullName: result.fullName,
              dob: result.dob,
              gender: result.gender,
              phoneNumber: result.phoneNumber,
              isActive: result.isActive,
              isSubscribe: result.isSubscribe,
              createdAt: result.createdAt),
        );

        fullNameController.text = result.fullName;
        dobController.text = result.dob;
        genderController.text = result.gender;
        phoneNumberController.text = result.phoneNumber;

        fetchUserData();
        print(userModel[0].fullName);
        isSuccess(false);
        isLoading(false);
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
      // isLoading(false);
      // isSuccess(false);
    }
  }
}
