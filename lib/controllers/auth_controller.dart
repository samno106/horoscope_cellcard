import 'dart:convert';

import 'package:get/get.dart';
import 'package:horoscope_cellcard/models/auth_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import '../utils/api_endpoints.dart';

class AuthController extends GetxController {
  var profile = <AuthModel>[].obs;
  var isLoading = true.obs;
  bool isAuth = false;

  @override
  void onInit() {
    super.onInit();
    fetchAuthProfile();
  }

  Future<void> fetchAuthProfile() async {
    try {
      isLoading(true);
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      String token = "";
      token = prefs.getString('token') ?? "";

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
          final json = jsonDecode(response.body);
          AuthModel authModel = AuthModel.fromJson(json['data']);
          profile.add(AuthModel(
            id: authModel.id,
            fullName: authModel.fullName,
            dob: authModel.dob,
            gender: authModel.gender,
            phoneNumber: authModel.phoneNumber,
            isActive: authModel.isActive,
            isSubscribe: authModel.isSubscribe,
            createdAt: authModel.createdAt,
          ));
          isAuth = true;
        }
      }
    } catch (e) {
      print('Error while getting data is $e');
    } finally {
      isLoading(false);
    }
  }
}
