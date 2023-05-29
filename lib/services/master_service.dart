import 'dart:convert';

import 'package:horoscope_cellcard/models/master_model.dart';
import 'package:http/http.dart' as http;

import '../utils/api_endpoints.dart';
import '../utils/shared_prefs.dart';

class MasterService {
  static Future<List<MasterModel>> fetchMasters() async {
    String token = await SharedPrefs().getAuth();
    String apiKey = await SharedPrefs().getApiKey();
    var header = {
      'Access-Control-Allow-Origin': '*',
      'Access-Control-Allow-Headers':
          'Origin, X-Requested-With, Content-Type, Accept',
      'Content-Type': 'application/json',
      'ApiKey': apiKey,
      'Authorization': 'Bearer $token',
    };
    var url =
        Uri.parse(BaseUrl.BASE_URL + ApiEndPoints.MASTERENDPOINTS.MASTER_ALL);

    http.Response response = await http.post(url, headers: header);

    if (response.statusCode == 200) {
      final jsonRes = jsonDecode(response.body);
      var json = jsonEncode(jsonRes['data']);

      print("My json" + jsonRes['data']);

      return masterModelFromJson(json.toString());
    }
    return [];
  }
}
