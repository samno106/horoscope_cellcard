import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:horoscope_cellcard/constants/language.dart';
import 'package:horoscope_cellcard/controllers/master_controller.dart';
import 'package:horoscope_cellcard/layouts/premium_navbar.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../../constants/colors.dart';
import '../../constants/profile_lists.dart';
import '../../wegets/curved_bottom_clipper.dart';
import '../../wegets/subscibe_card.dart';

class PremiumPage extends StatefulWidget {
  const PremiumPage({Key? key}) : super(key: key);

  @override
  State<PremiumPage> createState() => _PremiumPageState();
}

class _PremiumPageState extends State<PremiumPage> {
  final MasterController masterController = Get.put(MasterController());

  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
          backgroundColor: backgroundColor,
          body: SingleChildScrollView(
              child: SafeArea(
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
                    Positioned(
                      top: 0,
                      left: 0,
                      right: 0,
                      child: PremiumNavbar(title: languages[23].kh),
                    )
                  ],
                ),
              ),
              !masterController.isLoading.value
                  ? Container(
                      padding: const EdgeInsets.all(0.0),
                      height: MediaQuery.of(context).size.height,
                      width: double.infinity,
                      child: ListView.builder(
                          itemCount: masterController.masterList.length ?? 0,
                          physics: const NeverScrollableScrollPhysics(),
                          padding:
                              const EdgeInsets.only(top: 20.0, bottom: 120.0),
                          shrinkWrap: false,
                          itemBuilder: (context, index) {
                            return SubscribeCard(
                                img: masterController.masterList[index].profile,
                                name: masterController.masterList[index].khName,
                                price:
                                    masterController.masterList[index].feeUsd,
                                isSubscribed: masterController
                                    .masterList[index].isSubscribed);
                          }),
                    )
                  : Center(
                      child: Container(
                      margin: EdgeInsets.only(top: 180.0),
                      child: LoadingAnimationWidget.fallingDot(
                        color: primaryColor,
                        size: 70,
                      ),
                    )),
            ],
          ))),
        ));
  }
}
