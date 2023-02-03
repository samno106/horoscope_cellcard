import 'dart:math';

import 'package:curved_carousel/curved_carousel.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../layouts/top_navbar.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedYearName = 2;
  @override
  Widget build(BuildContext context) {
    Color primaryColor = Theme.of(context).primaryColor;
    Color canvasColor = Theme.of(context).canvasColor;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: Column(
        children: [
          const TopNavbar(),
          Container(
            height: 130.0,
            child: Stack(
              children: <Widget>[
                ClipPath(
                    clipper: CurvedBottomClipper(),
                    child: Container(
                      color: primaryColor,
                      height: 100.0,
                      width: MediaQuery.of(context).size.width,
                      child: Column(children: [
                        Text(
                          listYearName[selectedYearName],
                          style: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ]),
                    )),
                Positioned(
                    top: 80,
                    left: 0,
                    right: 0,
                    child: CurvedCarousel(
                      itemBuilder: (_, i) {
                        return SizedBox(
                          height: 50.0,
                          width: 50.0,
                          child: Image(image: AssetImage(carouselList[i])),
                        );
                      },
                      itemCount: 11,
                      middleItemScaleRatio: 2,
                      disableInfiniteScrolling: false,
                      curveScale: 10,
                    ))
              ],
            ),
          ),
        ],
      )),
    );
  }
}

class CurvedBottomClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final roundingHeight = size.height * 3 / 4;

    final filledRectangle =
        Rect.fromLTRB(0, 0, size.width, size.height - roundingHeight);

    final roundingRectangle = Rect.fromLTRB(
        -4, size.height - roundingHeight * 2, size.width + 4, size.height);

    final path = Path();
    path.addRect(filledRectangle);

    path.arcTo(roundingRectangle, pi, -pi, true);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}

const List<String> carouselList = <String>[
  '/images/carousel/snake.png',
  '/images/carousel/horse.png',
  '/images/carousel/pig.png',
  '/images/carousel/rat.png',
  '/images/carousel/cow.png',
  '/images/carousel/monkey.png',
  '/images/carousel/dragon.png',
  '/images/carousel/chicken.png',
  '/images/carousel/goat.png',
  '/images/carousel/rabbit.png',
  '/images/carousel/tiger.png',
  '/images/carousel/dog.png',
];

const List<String> listYearName = <String>[
  'snake',
  'horse',
  'pig',
  'rat',
  'cow',
  'monkey',
  'dragon',
  'chicken',
  'goat',
  'rabbit',
  'tiger',
  'dog',
];
