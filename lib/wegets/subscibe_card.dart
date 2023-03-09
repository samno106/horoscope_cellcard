import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:get/get.dart';
import 'package:horoscope_cellcard/wegets/subscribe_modal_bottom.dart';
import 'package:intl/intl.dart';

class SubscribeCard extends StatelessWidget {
  const SubscribeCard(
      {Key? key, required this.img, required this.name, required this.price})
      : super(key: key);

  final String img, name;
  final double price;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 30.0),
      margin: const EdgeInsets.symmetric(vertical: 10.0),
      decoration: const BoxDecoration(
        color: Colors.white,
        border: Border(
            top: BorderSide(color: Color.fromARGB(255, 119, 210, 255)),
            bottom: BorderSide(color: Color.fromARGB(255, 119, 210, 255))),
        boxShadow: [
          BoxShadow(color: Colors.black12, spreadRadius: 2, blurRadius: 5),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(15), // Image border
            child: Image(
              fit: BoxFit.cover,
              width: 100.0,
              height: 100.0,
              image: NetworkImage(img),
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
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        name,
                        style: const TextStyle(
                          color: Color(0XFF2C3E50),
                          fontSize: 14.0,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        NumberFormat.simpleCurrency(
                                locale: 'en-US', decimalDigits: 2)
                            .format(price),
                        style: const TextStyle(
                          color: Color(0XFFD9328A),
                          fontSize: 18.0,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
                const Divider(
                  color: Color.fromARGB(255, 150, 220, 255),
                  thickness: 1,
                ),
                const SizedBox(
                  height: 15.0,
                ),
                Container(
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: const [
                                Icon(
                                  FeatherIcons.disc,
                                  size: 8.0,
                                  color: Color(0XFFF6A000),
                                ),
                                SizedBox(
                                  width: 10.0,
                                ),
                                Text(
                                  "Valid for 1 day",
                                  style: TextStyle(
                                    color: Color(0XFF2C3E50),
                                    fontSize: 12.0,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 10.0,
                            ),
                            Row(
                              children: const [
                                Icon(
                                  FeatherIcons.disc,
                                  size: 8.0,
                                  color: Color(0XFFF6A000),
                                ),
                                SizedBox(
                                  width: 10.0,
                                ),
                                Text(
                                  "Auto renewal",
                                  style: TextStyle(
                                    color: Color(0XFF2C3E50),
                                    fontSize: 12.0,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                primary: const Color(0XFF008DD4),
                                onPrimary: Colors.white,
                                shadowColor: const Color(0XFF008DD4),
                                elevation: 5,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(6.0)),
                                minimumSize: const Size(80.0, 35.0),
                              ),
                              onPressed: () => {
                                showModalBottomSheet(
                                    context: context,
                                    shape: const RoundedRectangleBorder(
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(20.0),
                                        topRight: Radius.circular(20.0),
                                      ),
                                    ),
                                    backgroundColor: Colors.white,
                                    builder: ((context) {
                                      return SubscribeModalBottom(
                                        img: img,
                                        name: name,
                                        price: price,
                                      );
                                    }))
                              },
                              child: const Text(
                                "Subscribe",
                                style: TextStyle(
                                  fontSize: 12.0,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ]),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}