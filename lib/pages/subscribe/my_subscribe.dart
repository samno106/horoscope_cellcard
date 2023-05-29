import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:horoscope_cellcard/controllers/master_controller.dart';
import 'package:horoscope_cellcard/layouts/my_profile_navbar.dart';
import 'package:horoscope_cellcard/wegets/subscibe_card.dart';

import '../../constants/colors.dart';
import '../../constants/language.dart';
import '../../wegets/curved_bottom_clipper.dart';

class MySubscribePage extends StatefulWidget {
  const MySubscribePage({super.key});

  @override
  State<MySubscribePage> createState() => _MySubscribePageState();
}

class _MySubscribePageState extends State<MySubscribePage> {
  final MasterController masterController = Get.put(MasterController());

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
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
                    children: <Widget>[
                      ClipPath(
                          clipper: CurvedBottomClipper(),
                          child: Container(
                            color: primaryColor,
                            height: 160.0,
                            width: MediaQuery.of(context).size.width,
                            child: null,
                          )),
                      Positioned(
                          top: 90,
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
                      Positioned(
                        top: 0,
                        left: 0,
                        right: 0,
                        child: MyProfileNavbar(title: languages[80].kh),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Center(
                  child: Text(
                    masterController.masterList[0].isSubscribed == true
                        ? languages[99].kh
                        : languages[82].kh,
                    style: GoogleFonts.notoSansKhmer(
                        textStyle: TextStyle(
                      color: textDarkColor,
                      fontSize: 16.0,
                      fontWeight: FontWeight.w500,
                    )),
                  ),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                masterController.masterList[0].isSubscribed == false
                    ? Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 50.0),
                        child: Center(
                          child: Text(
                            textAlign: TextAlign.center,
                            languages[83].kh,
                            style: GoogleFonts.notoSansKhmer(
                                textStyle: TextStyle(
                                    color: textDarkColor,
                                    fontSize: 12.0,
                                    fontWeight: FontWeight.w500,
                                    height: 1.5)),
                          ),
                        ),
                      )
                    : const SizedBox(
                        height: 5.0,
                      ),
                const SizedBox(
                  height: 40.0,
                ),
                Container(
                  padding: const EdgeInsets.all(0.0),
                  height: MediaQuery.of(context).size.height * 0.7,
                  width: double.infinity,
                  child: ListView.builder(
                    itemCount: masterController.masterList.length ?? 0,
                    itemBuilder: (context, index) {
                      return SubscribeCard(
                        img: masterController.masterList[index].profile ?? '',
                        name: masterController.masterList[index].khName ?? '',
                        price: masterController.masterList[index].feeUsd ?? 0.0,
                        isSubscribed:
                            masterController.masterList[index].isSubscribed ??
                                false,
                      );
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
