import 'package:curved_carousel/curved_carousel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../constants/carousel_property.dart';
import '../../constants/colors.dart';
import '../../constants/language.dart';
import '../../controllers/user_controller.dart';
import '../../layouts/top_navbar.dart';
import '../../wegets/curved_bottom_clipper.dart';
import '../../wegets/path_painter.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final userController = Get.find<UserController>();
  int selectedYearName = 0;
  int selectedYearContent = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: SafeArea(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(0.0),
              height: 190.0,
              child: Stack(
                children: <Widget>[
                  ClipPath(
                      clipper: CurvedBottomClipper(),
                      child: Container(
                        color: primaryColor,
                        height: 160.0,
                        width: MediaQuery.of(context).size.width,
                      )),
                  const Positioned(
                    top: 0.0,
                    left: 0,
                    right: 0,
                    child: TopNavbar(),
                  ),
                  Positioned(
                    top: 50.0,
                    left: 0,
                    right: 0,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          listYearName[selectedYearName],
                          style: GoogleFonts.notoSansKhmer(
                              textStyle: TextStyle(
                            color: textDarkColor,
                            fontSize: 22.0,
                            fontWeight: FontWeight.bold,
                          )),
                        )
                      ],
                    ),
                  ),
                  Positioned(
                      top: 130,
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
                        itemCount: 12,
                        middleItemScaleRatio: 2,
                        disableInfiniteScrolling: false,
                        curveScale: 10,
                        onChangeEnd: ((index, automatic) {
                          setState(() {
                            selectedYearName = index;
                            selectedYearContent = index;
                          });
                        }),
                      )),
                  Positioned(
                    top: 70.0,
                    child: CustomPaint(
                      painter: PathPainter(drawPath()),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.all(0.0),
              height: 50,
              child: Stack(children: [
                Positioned(
                  top: 30,
                  left: MediaQuery.of(context).size.width / 2.05,
                  child: const SizedBox(
                    height: 17.0,
                    width: 21.0,
                    child:
                        Image(image: AssetImage('/images/vector/vector.png')),
                  ),
                ),
              ]),
            ),
            Container(
              margin: const EdgeInsets.only(top: 5.0),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      languages[12].kh,
                      style: GoogleFonts.notoSansKhmer(
                          textStyle: TextStyle(
                        color: textDarkColor,
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      )),
                    ),
                    const Image(image: AssetImage('/images/vector/line1.png'))
                  ],
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 5.0),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 10.0, horizontal: 35.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      listYearContent[selectedYearContent],
                      style: GoogleFonts.notoSansKhmer(
                          textStyle: TextStyle(
                        height: 2.0,
                        color: textDarkGreyColor,
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                      )),
                    ),
                    const SizedBox(
                      height: 40.0,
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.white,
                        backgroundColor: buttonPrimaryColor,
                        shadowColor: buttonPrimaryColor,
                        elevation: 5,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(6.0)),
                        minimumSize:
                            Size(MediaQuery.of(context).size.width, 50),
                      ),
                      onPressed: () {
                        Get.toNamed('auth');
                      },
                      child: Text(
                        languages[13].kh,
                        style: GoogleFonts.notoSansKhmer(
                            textStyle: const TextStyle(
                          fontSize: 14,
                        )),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 50.0,
            )
          ],
        ),
      ),
    ));
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
