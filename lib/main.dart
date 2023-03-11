import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:horoscope_cellcard/constants/colors.dart';
import 'package:horoscope_cellcard/routes/routes.dart';

void main() {
  runApp(GetMaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: AppPage.getbottomNavbar(),
    getPages: AppPage.routes,
    title: 'Horoscope',
    theme: ThemeData(primaryColor: primaryColor, fontFamily: 'Roboto'),
  ));
}
