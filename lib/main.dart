import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:horoscope_cellcard/constants/colors.dart';
import 'package:horoscope_cellcard/routes/routes.dart';
import 'package:url_strategy/url_strategy.dart';

import 'controllers/controller_bindings.dart';

void main() {
  setPathUrlStrategy();
  // Get.lazyPut(() => ControllerBindings());
  runApp(GetMaterialApp(
    debugShowCheckedModeBanner: false,
    initialBinding: ControllerBindings(),
    initialRoute: AppPage.getbottomNavbar(),
    defaultTransition: Transition.native,
    getPages: AppPage.routes,
    title: 'Horoscope',
    theme: ThemeData(
      primaryColor: primaryColor,
    ),
    builder: EasyLoading.init(),
  ));
}
