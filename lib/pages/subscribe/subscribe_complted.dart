import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SubscribeCompletedPage extends StatefulWidget {
  const SubscribeCompletedPage({super.key});

  @override
  State<SubscribeCompletedPage> createState() => _SubscribeCompletedPageState();
}

class _SubscribeCompletedPageState extends State<SubscribeCompletedPage> {
  @override
  Widget build(BuildContext context) {
    Color primaryColor = Theme.of(context).primaryColor;
    Color canvasColor = Theme.of(context).canvasColor;
    Color bodyColor = Color(0XFFF5F6FB);
    Color textGrey = Color(0XFFABABAB);
    return Scaffold(
      backgroundColor: bodyColor,
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
                            color: Color(0XFF2C3E50)),
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
                            color: Color(0XFF2C3E50)),
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
                    primary: Color(0XFF008DD4),
                    onPrimary: Colors.white,
                    shadowColor: Color(0XFF008DD4),
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
