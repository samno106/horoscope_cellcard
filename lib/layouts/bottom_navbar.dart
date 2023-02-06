import 'package:circle_bottom_navigation_bar/circle_bottom_navigation_bar.dart';
import 'package:circle_bottom_navigation_bar/widgets/tab_data.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:horoscope_cellcard/controllers/controller.dart';
import 'package:get/get.dart';
import 'package:horoscope_cellcard/pages/home/home.dart';
import 'package:horoscope_cellcard/pages/horoscope/horoscope.dart';
import 'package:horoscope_cellcard/pages/premium/premium.dart';

class BottomNavbar extends StatefulWidget {
  BottomNavbar({Key? key}) : super(key: key);

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

    Color primaryColor = Theme.of(context).primaryColor;

    return GetBuilder<BottomNavbarController>(builder: (context) {
      return Scaffold(
        backgroundColor: Colors.white,
        body: IndexedStack(
          index: controller.tapIndex,
          children: [HoroscopePage(), HomePage(), PremiumPage()],
        ),
        bottomNavigationBar: Container(
          height: 85.0,
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(24.0),
                topLeft: Radius.circular(24.0)),
            boxShadow: [
              BoxShadow(color: Colors.black12, spreadRadius: 2, blurRadius: 5),
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
            inactiveIconColor: Color(0XFF606060),
            textColor: Color(0XFF606060),
            tabs: getTabsData(),
            onTabChangedListener: controller.changeTabIndex,
          ),
        ),
      );
    });
  }
}

List<TabData> getTabsData() {
  return [
    TabData(
      icon: CupertinoIcons.moon,
      iconSize: 25.0,
      title: 'Horoscope',
      fontSize: 12,
      fontWeight: FontWeight.bold,
    ),
    TabData(
      icon: CupertinoIcons.home,
      iconSize: 25,
      title: 'Home',
      fontSize: 12,
      fontWeight: FontWeight.bold,
    ),
    TabData(
      icon: CupertinoIcons.star,
      iconSize: 25,
      title: 'Premium',
      fontSize: 12,
      fontWeight: FontWeight.bold,
    ),
  ];
}

const List<String> iconMenu = <String>[
  '/images/icons/horoscope.svg',
  '/images/icons/home.svg',
  '/images/icons/crown.svg',
];
