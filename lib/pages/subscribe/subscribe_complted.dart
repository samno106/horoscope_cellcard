import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../constants/colors.dart';

class SubscribeCompletedPage extends StatefulWidget {
  const SubscribeCompletedPage({super.key});

  @override
  State<SubscribeCompletedPage> createState() => _SubscribeCompletedPageState();
}

class _SubscribeCompletedPageState extends State<SubscribeCompletedPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 0.0),
          height: MediaQuery.of(context).size.height,
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.3),
                child: Column(children: [
                  Container(
                    padding: const EdgeInsets.all(0.0),
                    child: const Image(
                        image: AssetImage("/images/icons/checked.png")),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  Container(
                    padding: const EdgeInsets.all(0.0),
                    child: Center(
                      child: Text(
                        "Subscribed Successfully!",
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            color: textDarkColor),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 50.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "You have successfully subscribed to ",
                            style: TextStyle(
                              color: textDarkGreyColor,
                              fontSize: 16.0,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const SizedBox(
                            height: 5.0,
                          ),
                          Text(
                            "Horoscope by Master. Long Bora ",
                            style: TextStyle(
                              color: textDarkGreyColor,
                              fontSize: 16.0,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const SizedBox(
                            height: 5.0,
                          ),
                          SizedBox(
                              child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                "with",
                                style: TextStyle(
                                  color: textDarkGreyColor,
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              const SizedBox(
                                width: 5.0,
                              ),
                              Text(
                                NumberFormat.simpleCurrency(
                                        locale: 'en-US', decimalDigits: 2)
                                    .format(0.15),
                                style: TextStyle(
                                  color: iconColor,
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              const SizedBox(
                                width: 5.0,
                              ),
                              Text(
                                " per day.",
                                style: TextStyle(
                                  color: textDarkGreyColor,
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ))
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 50.0,
                  ),
                ]),
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 30.0),
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: buttonPrimaryColor,
                    shadowColor: blueColor,
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6.0)),
                    minimumSize: Size(MediaQuery.of(context).size.width, 45),
                  ),
                  onPressed: () => {Get.toNamed('home')},
                  child: const Text(
                    "Ok",
                    style: TextStyle(
                      fontSize: 14.0,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              )
            ],
          )),
    );
  }
}
