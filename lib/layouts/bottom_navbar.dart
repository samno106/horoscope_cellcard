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
    double barHeightWithNotch = 67;
    double arcHeightWithNotch = 67;

    if (size.height > 800) {
      barHeight = 80.0;
    } else {
      barHeight = size.height * 0.1;
    }

    if (viewPadding.bottom > 0) {
      barHeightWithNotch = (size.height * 0.07) + viewPadding.bottom;
      arcHeightWithNotch = (size.height * 0.75) + viewPadding.bottom;
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
          height: 80.0,
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
            itemTextOff: viewPadding.bottom > 0 ? 0 : 0.3,
            itemTextOn: viewPadding.bottom > 0 ? 0 : 0.3,
            circleOutline: 10.0,
            shadowAllowance: 0.0,
            circleSize: 45.0,
            blurShadowRadius: 45.0,
            circleColor: primaryColor,
            activeIconColor: Colors.white,
            inactiveIconColor: Colors.grey,
            tabs: getTabsData(),
            onTabChangedListener: controller.changeTabIndex,
          ),
        ),
        // bottomNavigationBar: Container(
        //   height: 120.00,
        //   decoration: const BoxDecoration(
        //     color: Colors.white,
        //     borderRadius: BorderRadius.only(
        //         topRight: Radius.circular(30.0),
        //         topLeft: Radius.circular(30.0)),
        //     boxShadow: [
        //       BoxShadow(color: Colors.black12, spreadRadius: 2, blurRadius: 5),
        //     ],
        //   ),
        //   child: ClipRRect(
        //     borderRadius: const BorderRadius.only(
        //       topLeft: Radius.circular(30.0),
        //       topRight: Radius.circular(30.0),
        //     ),
        //     child: BottomNavigationBar(
        //         backgroundColor: Colors.white,
        //         selectedItemColor: Colors.amber,
        //         selectedLabelStyle:
        //             const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
        //         unselectedLabelStyle:
        //             const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
        //         type: BottomNavigationBarType.fixed,
        //         currentIndex: controller.tapIndex,
        //         onTap: controller.changeTabIndex,
        //         items: [
        //           _bottomBarItem(CupertinoIcons.moon, "Horoscope", 0),
        //           _bottomBarItem(CupertinoIcons.home, "Home", 1),
        //           _bottomBarItem(CupertinoIcons.star, "Premium", 2)
        //         ]),
        //   ),
        // ),
      );
    });
  }

  // _bottomBarItem(IconData icon, String lable, int index) {
  //   return BottomNavigationBarItem(
  //       icon: index == controller.tapIndex
  //           ? Container(
  //               margin: const EdgeInsets.only(bottom: 10),
  //               decoration: const BoxDecoration(
  //                 color: Colors.amber,
  //                 shape: BoxShape.circle,
  //               ),
  //               height: 56,
  //               width: 56,
  //               child: Icon(
  //                 icon,
  //                 color: Colors.white,
  //                 size: 32,
  //               ),
  //             )
  //           : Padding(
  //               padding: const EdgeInsets.only(bottom: 10),
  //               child: Icon(
  //                 icon,
  //                 size: 22,
  //               ),
  //             ),
  //       label: lable);
  // }
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
