import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:horoscope_cellcard/routes/routes.dart';

void main() {
  runApp(GetMaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: AppPage.getbottomNavbar(),
    getPages: AppPage.routes,
    title: 'Horoscope',
    theme: ThemeData(
        canvasColor: Color(0XFF2C3E50),
        primaryColor: Color(0XFFF6A000),
        accentColor: Color(0XFF00B087),
        fontFamily: 'Roboto'),
  ));
}
