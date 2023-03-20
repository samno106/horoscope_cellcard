import 'package:circle_bottom_navigation_bar/circle_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:horoscope_cellcard/constants/colors.dart';

import 'package:horoscope_cellcard/controllers/controller.dart';
import 'package:get/get.dart';
import 'package:horoscope_cellcard/pages/home/home.dart';
import 'package:horoscope_cellcard/pages/horoscope/horoscope.dart';
import 'package:horoscope_cellcard/pages/premium/premium.dart';

import '../constants/navbar_property.dart';

class BottomNavbar extends StatefulWidget {
  const BottomNavbar({Key? key}) : super(key: key);

  @override
  State<BottomNavbar> createState() => _BottomNavbarState();
}

class _BottomNavbarState extends State<BottomNavbar> {
  final controller = Get.put(BottomNavbarController());
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final viewPadding = MediaQuery.of(context).viewPadding;
    double barHeight;
    double barHeightWithNotch = 77;
    double arcHeightWithNotch = 77;

    barHeight = 85.0;

    if (viewPadding.bottom > 0) {
      barHeightWithNotch = (size.height * 0.08) + viewPadding.bottom;
      arcHeightWithNotch = (size.height * 0.85) + viewPadding.bottom;
    }

    return GetBuilder<BottomNavbarController>(builder: (context) {
      return Scaffold(
        backgroundColor: Colors.white,
        body: IndexedStack(
          index: controller.tapIndex,
          children: const [HoroscopePage(), HomePage(), PremiumPage()],
        ),
        bottomNavigationBar: Container(
          height: 85.0,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: const BorderRadius.only(
                topRight: Radius.circular(24.0),
                topLeft: Radius.circular(24.0)),
            boxShadow: [
              BoxShadow(color: textBlackColor, spreadRadius: 2, blurRadius: 5),
            ],
          ),
          child: CircleBottomNavigationBar(
            initialSelection: controller.tapIndex,
            barBackgroundColor: Colors.white,
            barHeight: viewPadding.bottom > 0 ? barHeightWithNotch : barHeight,
            arcHeight: viewPadding.bottom > 0 ? arcHeightWithNotch : barHeight,
            arcWidth: viewPadding.bottom > 0 ? arcHeightWithNotch : barHeight,
            itemTextOff: viewPadding.bottom > 0 ? 0 : 0.3,
            itemTextOn: viewPadding.bottom > 0 ? 0 : 0.3,
            circleOutline: 10.0,
            shadowAllowance: 0.0,
            circleSize: 45.0,
            blurShadowRadius: 45.0,
            circleColor: primaryColor,
            activeIconColor: Colors.white,
            inactiveIconColor: textDarkGreyColor,
            textColor: textDarkGreyColor,
            tabs: getTabsData(),
            onTabChangedListener: controller.changeTabIndex,
          ),
        ),
      );
    });
  }
}
