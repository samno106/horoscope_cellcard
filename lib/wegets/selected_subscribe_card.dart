import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:horoscope_cellcard/constants/language.dart';
import 'package:intl/intl.dart';

import '../constants/colors.dart';

class SelectedSubscribeCard extends StatefulWidget {
  final String name, img, contents, route;
  final int id;
  final double price;
  final bool isSubscribed;

  const SelectedSubscribeCard(
      {required this.id,
      required this.name,
      required this.img,
      required this.price,
      required this.contents,
      required this.isSubscribed,
      required this.route,
      super.key});

  @override
  State<SelectedSubscribeCard> createState() => _SelectedSubscribeCardState();
}

class _SelectedSubscribeCardState extends State<SelectedSubscribeCard> {
  late RxBool iscolop = false.obs;
  late RxBool isOpen = true.obs;
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
                image: NetworkImage(widget.img),
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
                  widget.name,
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
                        child: Column(children: [
                          Visibility(
                              visible: isOpen.value,
                              maintainAnimation: true,
                              maintainState: true,
                              child: Text(
                                widget.contents.length > 100
                                    ? '${widget.contents.substring(0, 100)}...'
                                    : widget.contents,
                                style: const TextStyle(fontSize: 12.0),
                                textAlign: TextAlign.left,
                                softWrap: true,
                              )),
                          Visibility(
                              visible: iscolop.value,
                              maintainAnimation: true,
                              maintainState: true,
                              child: Text(
                                widget.contents,
                                style: const TextStyle(fontSize: 12.0),
                                textAlign: TextAlign.left,
                                softWrap: true,
                              ))
                        ]),
                      ),
                      IconButton(
                        onPressed: () {
                          setState(() {
                            iscolop.value = !iscolop.value;
                            isOpen.value = !isOpen.value;
                          });
                        },
                        icon: Icon(
                          iscolop.value == false
                              ? FeatherIcons.chevronDown
                              : FeatherIcons.chevronUp,
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
                    backgroundColor: widget.isSubscribed == false
                        ? buttonPrimaryColor
                        : primaryColor,
                    shadowColor: blueColor,
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6.0)),
                    minimumSize: const Size(100.0, 40.0),
                  ),
                  onPressed: () => {
                    if (widget.isSubscribed)
                      {
                        Navigator.of(context).pop(),
                        Get.toNamed(widget.route),
                      }
                    else
                      {
                        Navigator.of(context).pop(),
                        showDialog(
                          context: context,
                          builder: (context) => CustomDialogWidget(
                            name: widget.name,
                            price: widget.price,
                          ),
                        ),
                      }
                  },
                  child: Text(
                    !widget.isSubscribed ? languages[51].kh : languages[24].kh,
                    style: GoogleFonts.notoSansKhmer(
                        textStyle: const TextStyle(
                      fontSize: 12.0,
                      fontWeight: FontWeight.w500,
                    )),
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
  final bool isSuccess = false;

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
            Text(
              languages[93].kh,
              textAlign: TextAlign.center,
              style: GoogleFonts.notoSansKhmer(
                  textStyle: const TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.w600,
              )),
            ),
            const SizedBox(
              height: 5.0,
            ),
            Text(
              name,
              textAlign: TextAlign.center,
              style: GoogleFonts.notoSansKhmer(
                  textStyle: const TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.w600,
              )),
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
                    Text(
                      languages[88].kh,
                      textAlign: TextAlign.center,
                      style: GoogleFonts.notoSansKhmer(
                          textStyle: const TextStyle(
                        fontSize: 14.0,
                        fontWeight: FontWeight.w500,
                      )),
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
                    Text(
                      languages[54].kh,
                      textAlign: TextAlign.center,
                      style: GoogleFonts.notoSansKhmer(
                          textStyle: const TextStyle(
                        fontSize: 14.0,
                        fontWeight: FontWeight.w500,
                      )),
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
                            builder: (context) => ConfirmDialogWidget(
                              title: languages[94].kh,
                              content: languages[95].kh,
                            ),
                          ),
                        }
                      else
                        {Get.toNamed('/subscribe-completed')}
                    },
                    child: Text(
                      languages[51].kh,
                      style: GoogleFonts.notoSansKhmer(
                          textStyle: const TextStyle(
                        fontSize: 14.0,
                        fontWeight: FontWeight.w500,
                      )),
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
    return Dialog(
      elevation: 0,
      backgroundColor: const Color(0xffffffff),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15.0),
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          Padding(
            padding: const EdgeInsets.only(left: 35.0, right: 35.0, top: 20.0),
            child: Text(
              title,
              textAlign: TextAlign.center,
              style: GoogleFonts.notoSansKhmer(
                  textStyle: const TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.w600,
              )),
            ),
          ),
          const SizedBox(
            height: 15.0,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 35.0),
            child: Text(
              content,
              textAlign: TextAlign.center,
              style: GoogleFonts.notoSansKhmer(
                  textStyle: TextStyle(
                fontSize: 16.0,
                color: textDarkGreyColor,
                fontWeight: FontWeight.w500,
              )),
            ),
          ),
          const SizedBox(
            height: 35.0,
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Divider(color: blueColor),
          ),
          const SizedBox(
            height: 5.0,
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            child: TextButton(
              onPressed: () => {Navigator.of(context).pop()},
              child: Text(
                languages[20].kh,
                style: GoogleFonts.notoSansKhmer(
                  textStyle: const TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          )
        ]),
      ),
    );
  }
}
