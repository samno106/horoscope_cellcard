import 'dart:convert';

import 'package:horoscope_cellcard/models/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefs {
  storeUser(user) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("auth", user);
  }

  getUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var auth = prefs.getString("auth");

    return auth;
  }

  getAuth() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var auth = prefs.getString("auth");
    var token;
    if (auth != null) {
      var result = jsonDecode(auth!);
      token = result['accessToken'];
    }

    return token;
  }

  removeUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.remove("auth");
  }
}
