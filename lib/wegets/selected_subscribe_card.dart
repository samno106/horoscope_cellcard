import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../constants/colors.dart';

class SelectedSubscribeCard extends StatelessWidget {
  const SelectedSubscribeCard(
      {Key? key,
      required this.name,
      required this.img,
      required this.price,
      required this.contents,
      required this.isSubscribed,
      required this.route})
      : super(key: key);
  final String name, img, contents, route;
  final double price;
  final bool isSubscribed;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.all(15.0),
      margin: EdgeInsets.symmetric(vertical: 10.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.0),
        boxShadow: [
          BoxShadow(color: textBlackColor, spreadRadius: 2, blurRadius: 5),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8), // Image border
              child: Image(
                fit: BoxFit.cover,
                width: 68.0,
                height: 68.0,
                image: NetworkImage(this.img),
              ),
            ),
          ),
          SizedBox(
            width: 20.0,
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  this.name,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 14.0,
                    fontWeight: FontWeight.w600,
                    color: textDarkColor,
                  ),
                ),
                Divider(
                  color: lightBlueBorderColor,
                  thickness: 1,
                ),
                const SizedBox(
                  height: 5.0,
                ),
                SizedBox(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Flexible(
                        child: Text(
                          this.contents,
                          style: TextStyle(fontSize: 12.0),
                          textAlign: TextAlign.left,
                          softWrap: true,
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(
                          FeatherIcons.chevronsDown,
                          size: 18.0,
                          color: blueColor,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 15.0,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: this.isSubscribed == false
                        ? buttonPrimaryColor
                        : primaryColor,
                    onPrimary: Colors.white,
                    shadowColor: blueColor,
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6.0)),
                    minimumSize: const Size(100.0, 35.0),
                  ),
                  onPressed: () => {
                    if (this.isSubscribed)
                      {Get.toNamed(route)}
                    else
                      {
                        showDialog(
                            context: context,
                            builder: (context) => CustomDialogWidget(
                                  name: name,
                                  price: this.price,
                                ))
                      }
                  },
                  child: Text(
                    !this.isSubscribed ? "Subscribe" : "Read",
                    style: const TextStyle(
                      fontSize: 12.0,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class CustomDialogWidget extends StatelessWidget {
  const CustomDialogWidget(
      {super.key, required this.name, required this.price});

  final String name;
  final double price;

  @override
  Widget build(BuildContext context) {
    return CupertinoAlertDialog(
      title: Text(
        "Confirmation",
        style: TextStyle(
          fontSize: 14.0,
          fontWeight: FontWeight.w600,
        ),
      ),
      content: Padding(
        padding: const EdgeInsets.only(left: 5.0, right: 5.0, top: 10.0),
        child: Text(
          "You are subscribing to Horoscope by $name with ${NumberFormat.simpleCurrency(locale: 'en-US', decimalDigits: 2).format(price)} per day.",
          textAlign: TextAlign.center,
          style: TextStyle(
            color: textDarkGreyColor,
            fontSize: 14.0,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      actions: [
        CupertinoDialogAction(
          child: Text(
            "Ok",
            style: TextStyle(
              color: blueColor,
              fontSize: 14.0,
              fontWeight: FontWeight.w500,
            ),
          ),
        )
      ],
    );
  }
}
