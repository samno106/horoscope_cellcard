import 'dart:convert';

import 'package:get/state_manager.dart';
import 'package:horoscope_cellcard/models/master_model.dart';
import 'package:horoscope_cellcard/services/master_service.dart';

import '../constants/language.dart';
import '../utils/api_endpoints.dart';
import 'package:http/http.dart' as http;

import '../wegets/snackbar_alert.dart';

class MasterController extends GetxController {
  var masterList = <MasterModel>[].obs;
  RxBool isLoading = false.obs;
  late String message = "";

  @override
  void onInit() async {
    getAll();
    super.onInit();
  }

  void getAll() async {
    try {
      isLoading(true);
      var masters = await MasterService.fetchMasters();
      if (masters != null) {
        masterList.value = masters;
      } else {
        message = languages[97].kh;
        throw languages[96].kh ?? 'Unknown Error Occured.';
      }
    } catch (e) {
      isLoading(false);
      SnackbarAlert().erorrAlert(e.toString(), languages[97].kh);
    } finally {
      isLoading(false);
    }
  }
}
