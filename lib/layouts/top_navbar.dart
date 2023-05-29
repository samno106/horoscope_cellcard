import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:horoscope_cellcard/utils/shared_prefs.dart';
import '../constants/colors.dart';
import '../constants/navbar_property.dart';

class TopNavbar extends StatefulWidget {
  const TopNavbar({super.key});

  @override
  State<TopNavbar> createState() => _TopNavbarState();
}

class _TopNavbarState extends State<TopNavbar> {
  String? fullName;
  String? token;
  bool isLoged = false;

  @override
  void initState() {
    super.initState();
    getProfile();
    getAuthToken();
  }

  Future<void> getProfile() async {
    var user = await SharedPrefs().getUser();

    if (user != null) {
      var result = jsonDecode(user!);
      setState(() {
        fullName = result['full_name'];
        token = result['accessToken'];
      });
    }
  }

  getAuthToken() async {
    var setLoged = await SharedPrefs().getUserLoged();
    setState(() {
      isLoged = setLoged;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        color: primaryColor,
        child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 15.0,
              vertical: 20.0,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 1.0, right: 1.0),
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: () => {Get.toNamed('account')},
                        child: isLoged == false
                            ? CircleAvatar(
                                radius: 16,
                                backgroundColor: canvasColor,
                                child: CircleAvatar(
                                  backgroundColor: primaryColor,
                                  radius: 15,
                                  child: Icon(
                                    CupertinoIcons.person_fill,
                                    color: canvasColor,
                                  ),
                                ),
                              )
                            : SvgPicture.asset(iconHeader[0]),
                      ),
                      const SizedBox(width: 10.0),
                      isLoged == true
                          ? Text(
                              fullName.toString(),
                              style: TextStyle(
                                fontSize: 14.0,
                                color: canvasColor,
                                fontWeight: FontWeight.bold,
                              ),
                            )
                          : const Text("")
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Get.toNamed('notification');
                  },
                  child: Stack(
                    children: <Widget>[
                      SvgPicture.asset(iconHeader[1]),
                      Positioned(
                        left: 3,
                        child: Container(
                          padding: const EdgeInsets.all(1),
                          decoration: BoxDecoration(
                            color: iconColor,
                            borderRadius: BorderRadius.circular(6),
                          ),
                          constraints: const BoxConstraints(
                            minWidth: 11,
                            minHeight: 11,
                          ),
                          child: const Text(
                            '5',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 7,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            )));
  }
}
