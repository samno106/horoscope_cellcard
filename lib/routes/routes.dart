import 'package:get/get.dart';
import 'package:horoscope_cellcard/layouts/bottom_navbar.dart';
import 'package:horoscope_cellcard/pages/account/account.dart';
import 'package:horoscope_cellcard/pages/auth/account_created.dart';
import 'package:horoscope_cellcard/pages/auth/index.dart';
import 'package:horoscope_cellcard/pages/auth/signin.dart';
import 'package:horoscope_cellcard/pages/auth/signup.dart';
import 'package:horoscope_cellcard/pages/home/home.dart';
import 'package:horoscope_cellcard/pages/horoscope/horoscope.dart';
import 'package:horoscope_cellcard/pages/premium/premium.dart';
import 'package:horoscope_cellcard/pages/account/profile.dart';
import 'package:horoscope_cellcard/pages/subscribe/my_subscribe.dart';
import 'package:horoscope_cellcard/pages/subscribe/subscribe_complted.dart';

import '../pages/auth/otp.dart';

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
    GetPage(name: confirmOtp, page: () => OtpPage()),
    GetPage(name: accountCreated, page: () => AccountCreatedPage()),

    //account setting
    GetPage(name: account, page: () => AccountPage()),
    GetPage(name: profile, page: () => ProfilePage()),
    GetPage(name: mySubscribe, page: () => MySubscribePage()),
    //subscribe action
    GetPage(name: subscribeCompleted, page: () => SubscribeCompletedPage()),
  ];
  static getbottomNavbar() => bottomNavbar;
  static gethoroscope() => horoscope;
  static gethome() => home;
  static getpremium() => premium;
  //auth
  static getauth() => auth;
  static getsignup() => signup;
  static getsignin() => signin;
  static getConfirmOtp() => confirmOtp;
  static getAccountCreated() => accountCreated;
  //account setting
  static getAccount() => account;
  static getProfile() => profile;
  static getMySubscribe() => mySubscribe;

  //subscribe action
  static getSubscribeCompleted() => subscribeCompleted;

  static String bottomNavbar = "/";
  static String horoscope = "/horoscope";
  static String home = "/home";
  static String premium = "/premium";
  //auth
  static String auth = "/auth";
  static String signup = "/signup";
  static String signin = "/signin";
  static String confirmOtp = "/confirm-otp";
  static String accountCreated = "/account-created";
  //account setting
  static String account = "/account";
  static String profile = "/profile";
  static String mySubscribe = "/my-subscribe";
  //subscribe action
  static String subscribeCompleted = "/subscribe-completed";
}
