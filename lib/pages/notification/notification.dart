import 'package:flutter/material.dart';
import 'package:horoscope_cellcard/constants/profile_lists.dart';
import 'package:horoscope_cellcard/layouts/notifi_navbar.dart';
import 'package:horoscope_cellcard/wegets/notification_card.dart';

import '../../constants/colors.dart';
import '../../constants/language.dart';
import '../../wegets/curved_bottom_clipper.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({super.key});

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(0.0),
              height: 190.0,
              child: Stack(
                children: [
                  ClipPath(
                      clipper: CurvedBottomClipper(),
                      child: Container(
                        color: primaryColor,
                        height: 160.0,
                        width: MediaQuery.of(context).size.width,
                        child: null,
                      )),
                  Positioned(
                    top: 0,
                    left: 0,
                    right: 0,
                    child: NotifiNavbar(title: languages[58].kh),
                  ),
                  Positioned(
                      top: 90.0,
                      left: MediaQuery.of(context).size.width * 0.37,
                      child: Container(
                        padding: const EdgeInsets.all(0.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(100.0),
                          child: Image.asset(
                            "/images/profile/base_profile.png",
                            height: 100.0,
                            width: 100.0,
                            fit: BoxFit.cover,
                          ),
                        ),
                      )),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.all(0.0),
              height: MediaQuery.of(context).size.height,
              width: double.infinity,
              child: ListView(
                physics: const NeverScrollableScrollPhysics(),
                padding: const EdgeInsets.only(top: 20.0, bottom: 120.0),
                shrinkWrap: false,
                children: [
                  NotificationCard(
                    img: profiles[0],
                    title: 'Daily Horoscope',
                    desc: 'jhuisdgregeherhrhr',
                    isRead: true,
                  ),
                  NotificationCard(
                    img: profiles[0],
                    title: 'Daily Horoscope',
                    desc: 'jhuisdgregeherhrhr',
                    isRead: false,
                  ),
                  NotificationCard(
                    img: profiles[0],
                    title: 'Daily Horoscope',
                    desc: 'jhuisdgregeherhrhr',
                    isRead: false,
                  )
                ],
              ),
            ),
          ],
        ),
      )),
    );
  }
}
