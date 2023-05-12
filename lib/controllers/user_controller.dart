import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:get/get.dart';
import 'package:horoscope_cellcard/models/user_model.dart';
import 'package:http/http.dart' as http;
import '../utils/api_endpoints.dart';
import '../utils/shared_prefs.dart';

class UserController extends GetxController {
  var userModel = <UserModel>[].obs;
  RxBool isLoading = false.obs;
  RxBool isSuccess = false.obs;

  late TextEditingController fullNameController,
      dobController,
      genderController,
      phoneNumberController;

  late String message = "";

  @override
  void onInit() async {
    super.onInit();
    fetchUserData();
    fullNameController = TextEditingController();
    dobController = TextEditingController();
    genderController = TextEditingController();
    phoneNumberController = TextEditingController();
  }

  @override
  void onClose() {
    super.onClose();
    phoneNumberController.dispose();
    dobController.dispose();
    genderController.dispose();
    phoneNumberController.dispose();
  }

  fetchUserData() async {
    try {
      String token = await SharedPrefs().getAuth();

      isLoading(true);
      var header = {
        'Access-Control-Allow-Origin': '*',
        'Access-Control-Allow-Headers':
            'Origin, X-Requested-With, Content-Type, Accept',
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token'
      };
      var url = Uri.parse(
          ApiEndPoints.BASE_URL + ApiEndPoints.PROFILEENDPOINTS.PROFILE);

      http.Response response = await http.post(url, headers: header);

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
            createdAt: result.createdAt,
          ),
        );

        fullNameController.text = userModel[0].fullName;
        dobController.text = userModel[0].dob;
        genderController.text = userModel[0].gender;
        phoneNumberController.text = userModel[0].phoneNumber;

        isLoading(false);
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
      isLoading(false);
    }
  }

  updateUserData() async {
    try {
      isLoading(true);

      String token = await SharedPrefs().getAuth();

      var header = {
        'Access-Control-Allow-Origin': '*',
        'Access-Control-Allow-Headers':
            'Origin, X-Requested-With, Content-Type, Accept',
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token'
      };
      var url = Uri.parse(
          ApiEndPoints.BASE_URL + ApiEndPoints.PROFILEENDPOINTS.UPDATE_PROFILE);

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
        message = json['message'];
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
            createdAt: result.createdAt,
          ),
        );

        print(json['data']);

        ever(userModel, (callback) => fetchUserData());

        fullNameController.text = result.fullName;
        dobController.text = result.dob;
        genderController.text = result.gender;
        phoneNumberController.text = result.phoneNumber;

        isSuccess(false);
        isLoading(false);
        Get.snackbar(
          "Success",
          message,
          icon: const Icon(
            FeatherIcons.checkCircle,
            color: Colors.white,
            size: 26.0,
          ),
          snackPosition: SnackPosition.TOP,
          backgroundColor: Color.fromARGB(255, 0, 201, 124),
          borderRadius: 8.0,
          snackStyle: SnackStyle.FLOATING,
          colorText: Colors.white,
          margin: const EdgeInsets.all(15),
          isDismissible: true,
          forwardAnimationCurve: Curves.easeOutBack,
          boxShadows: null,
        );
      } else {
        final jsonData = jsonDecode(response.body);
        message = jsonData['message'];
        throw jsonDecode(response.body)['message'] ?? 'Unknown Error Occured.';
      }
    } catch (e) {
      isSuccess(false);
      isLoading(false);
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
