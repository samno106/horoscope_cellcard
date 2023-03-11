import 'dart:math';
import 'package:curved_carousel/curved_carousel.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../constants/carousel_property.dart';
import '../../constants/colors.dart';
import '../../constants/language.dart';
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
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
          child: SafeArea(
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
                          style: GoogleFonts.notoSerifKhmer(
                              textStyle: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          )),
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
                      onChangeEnd: ((index, automatic) {
                        setState(() {
                          selectedYearName = index;
                        });
                      }),
                    )),
                Positioned(
                  top: 15,
                  child: CustomPaint(
                    painter: PathPainter(drawPath()),
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: 55,
            child: Stack(children: [
              Positioned(
                top: 35,
                left: MediaQuery.of(context).size.width / 2.05,
                child: const SizedBox(
                  height: 17.0,
                  width: 21.0,
                  child: Image(image: AssetImage('/images/vector/vector.png')),
                ),
              ),
            ]),
          ),
          Container(
            margin: const EdgeInsets.only(top: 10.0),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    languages[12].kh,
                    style: GoogleFonts.notoSerifKhmer(
                        textStyle: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    )),
                  ),
                  Image(image: AssetImage('/images/vector/line1.png'))
                ],
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 10.0),
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 10.0, horizontal: 35.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    content,
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: textDarkColor,
                      height: 2,
                    ),
                  ),
                  SizedBox(
                    height: 40.0,
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: buttonPrimaryColor,
                      onPrimary: Colors.white,
                      shadowColor: buttonPrimaryColor,
                      elevation: 5,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6.0)),
                      minimumSize: Size(MediaQuery.of(context).size.width, 50),
                    ),
                    onPressed: () {},
                    child: Text(
                      languages[13].kh,
                      style: GoogleFonts.notoSerifKhmer(
                          textStyle: const TextStyle(
                        fontSize: 14,
                      )),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 50.0,
          )
        ],
      ))),
    );
  }

  Path drawPath() {
    Size size = Size(MediaQuery.of(context).size.width, 200);
    Path path = Path();
    path.moveTo(0, size.height / 2);
    path.quadraticBezierTo(
        size.width / 2, size.height, size.width, size.height / 2);
    return path;
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

class PathPainter extends CustomPainter {
  Path path;

  PathPainter(this.path);

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = blueColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3.0;

    canvas.drawPath(this.path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
