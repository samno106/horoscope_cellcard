import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
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

  getUserLoged() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var auth = prefs.getString("auth");
    if (auth == null) {
      return false;
    }
    return true;
  }

  getAuth() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var auth = prefs.getString("auth");
    var token;
    if (auth != null) {
      var result = jsonDecode(auth);
      token = result['accessToken'];
    }

    return token;
  }

  removeUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.remove("auth");
  }

  setloginRedirectRoute(route) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("redirectRoute", route ?? 'account');
  }

  getloginRedirectRoute() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var res = prefs.getString("redirectRoute");
    return res;
  }

  getApiKey() async {
    await dotenv.load();
    var apiKey = dotenv.get('API_KEY');
    return apiKey;
  }
}
