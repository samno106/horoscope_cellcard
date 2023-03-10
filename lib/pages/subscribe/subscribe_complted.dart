import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
                    child:
                        Image(image: AssetImage("/images/icons/checked.png")),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Container(
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
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.6,
                    child: Center(
                      child: Text(
                        "You have successfully subscribed to Horoscope by Master. Long Bora with 0.15 per day.",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: textDarkColor),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 50.0,
                  ),
                ]),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 30.0),
                padding: EdgeInsets.symmetric(horizontal: 30.0),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: buttonPrimaryColor,
                    onPrimary: Colors.white,
                    shadowColor: blueColor,
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6.0)),
                    minimumSize: Size(MediaQuery.of(context).size.width, 45),
                  ),
                  onPressed: () => {Get.toNamed('home')},
                  child: Text(
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
