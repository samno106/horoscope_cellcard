import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/my_subscribe_model.dart';
import '../utils/api_endpoints.dart';
import '../utils/shared_prefs.dart';

class MySubscribeService {
  static Future<List<MySubscribeModel>> fetchData() async {
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
    var url = Uri.parse(
        BaseUrl.BASE_URL + ApiEndPoints.MYSUBSCRIBEENDPOINTS.GET_BY_SUBSCRIBER);

    http.Response response = await http.post(url, headers: header);

    if (response.statusCode == 200) {
      final jsonRes = jsonDecode(response.body);
      var json = jsonEncode(jsonRes['data']);
      return mySubscribeModelFromJson(json.toString());
    }
    return [];
  }
}
