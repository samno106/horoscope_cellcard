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
      margin: const EdgeInsets.symmetric(vertical: 10.0),
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
              borderRadius: BorderRadius.circular(8),
              child: Image(
                fit: BoxFit.cover,
                width: 68.0,
                height: 68.0,
                image: NetworkImage(img),
              ),
            ),
          ),
          const SizedBox(
            width: 20.0,
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
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
                          contents,
                          style: const TextStyle(fontSize: 12.0),
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
                    foregroundColor: Colors.white,
                    backgroundColor: isSubscribed == false
                        ? buttonPrimaryColor
                        : primaryColor,
                    shadowColor: blueColor,
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6.0)),
                    minimumSize: const Size(100.0, 35.0),
                  ),
                  onPressed: () => {
                    if (isSubscribed)
                      {
                        Navigator.of(context).pop(),
                        Get.toNamed(route),
                      }
                    else
                      {
                        Navigator.of(context).pop(),
                        showDialog(
                          context: context,
                          builder: (context) => CustomDialogWidget(
                            name: name,
                            price: price,
                          ),
                        ),
                      }
                  },
                  child: Text(
                    !isSubscribed ? "Subscribe" : "Read",
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
  final bool isSuccess = true;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      elevation: 0,
      backgroundColor: const Color(0xffffffff),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              height: 25.0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GestureDetector(
                    onTap: () => Navigator.of(context).pop(),
                    child: Icon(
                      FeatherIcons.x,
                      size: 18.0,
                      color: textBlackColor,
                    ),
                  )
                ],
              ),
            ),
            const Text(
              "Subscribe to",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 14.0,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(
              height: 5.0,
            ),
            Text(
              name,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 14.0,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(
              height: 30.0,
            ),
            Flexible(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 50.0),
                child: Row(
                  children: [
                    Icon(
                      FeatherIcons.disc,
                      size: 8.0,
                      color: iconColor,
                    ),
                    const SizedBox(
                      width: 10.0,
                    ),
                    Text(
                      NumberFormat.simpleCurrency(
                              locale: 'en-US', decimalDigits: 2)
                          .format(price),
                      style: TextStyle(
                        color: iconColor,
                        fontSize: 16.0,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(
                      width: 10.0,
                    ),
                    const Text(
                      "per day",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 14.0,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 10.0,
            ),
            Flexible(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 50.0),
                child: Row(
                  children: [
                    Icon(
                      FeatherIcons.disc,
                      size: 8.0,
                      color: iconColor,
                    ),
                    const SizedBox(
                      width: 10.0,
                    ),
                    const Text(
                      "Auto renewal everyday",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 14.0,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Flexible(
              child: Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 15.0, vertical: 20.0),
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
                    onPressed: () => {
                      if (isSuccess == false)
                        {
                          Navigator.of(context).pop(),
                          showDialog(
                            context: context,
                            builder: (context) => const ConfirmDialogWidget(
                              title: "Inactive Account!",
                              content:
                                  "Your account is inactive. Please top-up to subscribe.",
                            ),
                          ),
                        }
                      else
                        {Get.toNamed('/subscribe-completed')}
                    },
                    child: const Text(
                      "Subscibe",
                      style: TextStyle(
                        fontSize: 14.0,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  )),
            )
          ],
        ),
      ),
    );
  }
}

class ConfirmDialogWidget extends StatelessWidget {
  const ConfirmDialogWidget(
      {super.key, required this.title, required this.content});

  final String title, content;

  @override
  Widget build(BuildContext context) {
    return CupertinoAlertDialog(
      title: Text(
        title,
        style: const TextStyle(
          fontSize: 14.0,
          fontWeight: FontWeight.w600,
        ),
      ),
      content: Padding(
        padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 15.0),
        child: Text(
          content,
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
          isDefaultAction: true,
          onPressed: () => {Navigator.of(context).pop()},
          child: Text(
            "Ok",
            style: TextStyle(
              color: blueColor,
              fontSize: 14.0,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ],
    );
  }
}
