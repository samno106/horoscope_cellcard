import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../constants/colors.dart';
import '../constants/navbar_property.dart';

class TopNavbar extends StatefulWidget {
  const TopNavbar({super.key});

  @override
  State<TopNavbar> createState() => _TopNavbarState();
}

class _TopNavbarState extends State<TopNavbar> {
  @override
  Widget build(BuildContext context) {
    bool auth = false;

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
                      onTap: () => {Get.toNamed('auth')},
                      child: auth
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
                    auth
                        ? Text(
                            'Jonh Dio',
                            style: TextStyle(
                              fontSize: 14.0,
                              color: canvasColor,
                              fontWeight: FontWeight.bold,
                            ),
                          )
                        : Text("")
                  ],
                ),
              ),
              Stack(
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
            ],
          )),
    );
  }
}
