import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class SubscribeModalBottom extends StatelessWidget {
  const SubscribeModalBottom(
      {super.key, required this.img, required this.name, required this.price});

  final String img, name;
  final double price;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20.0),
      height: 400.0,
      child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15), // Image border
                child: Image(
                  fit: BoxFit.cover,
                  width: 100.0,
                  height: 100.0,
                  image: NetworkImage(img),
                ),
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            Center(
              child: Text(
                name,
                style: const TextStyle(
                  color: Color(0XFF2C3E50),
                  fontSize: 14.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            const SizedBox(
              height: 15.0,
            ),
            const Text(
              textAlign: TextAlign.left,
              "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Eget leo quam suspendisse tempor curabitur enim. Rhoncus, est dolor, massa elementum risus. Donec aenean non vitae diam et nisl vitae ementum risus. Donec aenean non vitae diam et nisl vitae ",
              style: TextStyle(
                  color: Color(0XFF2C3E50),
                  fontSize: 12.0,
                  fontWeight: FontWeight.w500,
                  height: 1.5),
            ),
            const SizedBox(
              height: 10.0,
            ),
            const Divider(
              color: Color.fromARGB(255, 150, 220, 255),
              thickness: 1,
            ),
            const SizedBox(
              height: 10.0,
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
                          children: [
                            const Icon(
                              FeatherIcons.disc,
                              size: 8.0,
                              color: Color(0XFFF6A000),
                            ),
                            const SizedBox(
                              width: 10.0,
                            ),
                            Text(
                              NumberFormat.simpleCurrency(
                                      locale: 'en-US', decimalDigits: 2)
                                  .format(price),
                              style: const TextStyle(
                                color: Color(0XFFD9328A),
                                fontSize: 16.0,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            const SizedBox(
                              width: 5.0,
                            ),
                            const Text(
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
                            minimumSize: const Size(110.0, 45.0),
                          ),
                          onPressed: () => {
                            showDialog(
                                context: context,
                                builder: (context) => CustomDialogWidget(
                                      name: name,
                                      price: price,
                                    ))
                          },
                          child: const Text(
                            "Subscribe",
                            style: TextStyle(
                              fontSize: 14.0,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ]),
            )
          ]),
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
    return Dialog(
      child: Container(
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.only(top: 20.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                "Confirmation",
                style: TextStyle(
                  fontSize: 14.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(
                height: 15.0,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                child: Text(
                  "You are subscribing to Horoscope by $name with ${NumberFormat.simpleCurrency(locale: 'en-US', decimalDigits: 2).format(price)} per day.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0XFF606060),
                    fontSize: 12.0,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              const Divider(
                color: Color.fromARGB(255, 150, 220, 255),
                thickness: 1,
              ),
              IntrinsicHeight(
                child: Row(
                  children: [
                    Expanded(
                        child: Padding(
                      padding: EdgeInsets.only(bottom: 8.0),
                      child: TextButton(
                        onPressed: () => {},
                        child: const Text(
                          'Cancel',
                          style: TextStyle(
                            fontSize: 14.0,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    )),
                    const VerticalDivider(
                      color: Color.fromARGB(255, 150, 220, 255),
                      thickness: 1,
                    ),
                    Expanded(
                        child: Padding(
                      padding: EdgeInsets.only(bottom: 8.0),
                      child: TextButton(
                        onPressed: () => {Get.toNamed('subscribe-completed')},
                        child: const Text(
                          'Confirm',
                          style: TextStyle(
                            fontSize: 14.0,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    )),
                  ],
                ),
              ),
            ]),
      ),
    );
  }
}
