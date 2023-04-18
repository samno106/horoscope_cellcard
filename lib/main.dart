import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/route_manager.dart';
import 'package:horoscope_cellcard/constants/colors.dart';
import 'package:horoscope_cellcard/controllers/controller_bindings.dart';
import 'package:horoscope_cellcard/routes/routes.dart';
import 'package:url_strategy/url_strategy.dart';

void main() {
  setPathUrlStrategy();
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
  ));
}
