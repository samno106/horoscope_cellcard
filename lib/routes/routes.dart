import 'package:get/get.dart';
import 'package:horoscope_cellcard/layouts/bottom_navbar.dart';
import 'package:horoscope_cellcard/pages/auth/index.dart';
import 'package:horoscope_cellcard/pages/auth/signin.dart';
import 'package:horoscope_cellcard/pages/auth/signup.dart';
import 'package:horoscope_cellcard/pages/home/home.dart';
import 'package:horoscope_cellcard/pages/horoscope/horoscope.dart';
import 'package:horoscope_cellcard/pages/premium/premium.dart';

class AppPage {
  static List<GetPage> routes = [
    GetPage(name: bottomNavbar, page: () => BottomNavbar()),
    GetPage(name: horoscope, page: () => HoroscopePage()),
    GetPage(name: home, page: () => HomePage()),
    GetPage(name: premium, page: () => PremiumPage()),
    //auth
    GetPage(name: auth, page: () => AuthPage()),
    GetPage(name: signup, page: () => SignupPage()),
    GetPage(name: signin, page: () => SigninPage()),
  ];
  static getbottomNavbar() => bottomNavbar;
  static gethoroscope() => horoscope;
  static gethome() => home;
  static getpremium() => premium;
  //auth
  static getauth() => auth;
  static getsignup() => signup;
  static getsignin() => signin;

  static String bottomNavbar = "/";
  static String horoscope = "/horoscope";
  static String home = "/home";
  static String premium = "/premium";
  //auth
  static String auth = "/auth";
  static String signup = "/signup";
  static String signin = "/signin";
}
