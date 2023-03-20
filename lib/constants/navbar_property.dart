import 'package:circle_bottom_navigation_bar/widgets/tab_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:horoscope_cellcard/constants/language.dart';
import 'horo_icon.dart';

List<TabData> getTabsData() {
  return [
    TabData(
      icon: HoroIcon.horoscope,
      iconSize: 25.0,
      title: languages[21].kh,
      fontSize: 12,
      fontWeight: FontWeight.bold,
    ),
    TabData(
      icon: HoroIcon.home,
      iconSize: 25,
      title: languages[22].kh,
      fontSize: 12,
      fontWeight: FontWeight.bold,
    ),
    TabData(
      icon: HoroIcon.crown,
      iconSize: 25,
      title: languages[23].kh,
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

const List<String> iconHeader = <String>[
  '/images/icons/avatar.svg',
  '/images/icons/notify.svg',
];
