import 'package:get/get.dart';

import '../constants/language.dart';
import '../models/my_subscribe_model.dart';
import '../services/my_subscribe_service.dart';
import '../wegets/snackbar_alert.dart';

class MySubscriberController extends GetxController {
  var mySubscriberLists = <MySubscribeModel>[].obs;
  RxBool isLoading = false.obs;
  late String message = "";

  @override
  void onInit() async {
    super.onInit();
    getAll();
  }

  void getAll() async {
    try {
      isLoading(true);
      var mySubscribes = await MySubscribeService.fetchData();
      if (mySubscribes != null) {
        mySubscriberLists.value = mySubscribes;
        print(mySubscriberLists.length ?? 0);
        isLoading(false);
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
