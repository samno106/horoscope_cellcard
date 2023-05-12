import 'package:get/get.dart';

import '../utils/shared_prefs.dart';

class GetUserLogedService extends GetxController {
  bool isLoggedIn = false;

  @override
  void onInit() {
    super.onInit();
    isUserSignedIn();
  }

  isUserSignedIn() async {
    var auth = await SharedPrefs().getUserLoged();
    print('auth====> $auth');
    isLoggedIn = auth;
    return isLoggedIn;
  }
}
