import 'package:get/get.dart';
import 'package:horoscope_cellcard/layouts/bottom_navbar.dart';
import 'package:horoscope_cellcard/middleware/auth_middleware.dart';
import 'package:horoscope_cellcard/middleware/guest_middleware.dart';
import 'package:horoscope_cellcard/pages/account/account.dart';
import 'package:horoscope_cellcard/pages/auth/account_created.dart';
import 'package:horoscope_cellcard/pages/auth/index.dart';
import 'package:horoscope_cellcard/pages/auth/otp_login.dart';
import 'package:horoscope_cellcard/pages/auth/signin.dart';
import 'package:horoscope_cellcard/pages/auth/signup.dart';
import 'package:horoscope_cellcard/pages/home/home.dart';
import 'package:horoscope_cellcard/pages/horoscope/horoscope.dart';
import 'package:horoscope_cellcard/pages/horoscopes/bank_number_horoscope.dart';
import 'package:horoscope_cellcard/pages/horoscopes/chinese_calendar_horoscope.dart';
import 'package:horoscope_cellcard/pages/horoscopes/couple_horoscope.dart';
import 'package:horoscope_cellcard/pages/horoscopes/dob_horoscope.dart';
import 'package:horoscope_cellcard/pages/horoscopes/phone_number_horoscope.dart';
import 'package:horoscope_cellcard/pages/horoscopes/plate_number_horoscope.dart';
import 'package:horoscope_cellcard/pages/premium/premium.dart';
import 'package:horoscope_cellcard/pages/account/profile.dart';
import 'package:horoscope_cellcard/pages/subscribe/my_subscribe.dart';
import 'package:horoscope_cellcard/pages/subscribe/subscribe_complted.dart';

import '../pages/auth/otp.dart';
import '../pages/horoscopes/daily_horoscope.dart';

class AppPage {
  static List<GetPage> routes = [
    GetPage(name: bottomNavbar, page: () => const BottomNavbar()),
    GetPage(name: horoscope, page: () => const HoroscopePage()),
    GetPage(name: home, page: () => const HomePage()),
    GetPage(
        name: premium,
        page: () => const PremiumPage(),
        middlewares: [AuthMiddleware()]),
    //auth
    GetPage(
        name: auth,
        page: () => const AuthPage(),
        middlewares: [GuestMiddleware()]),
    GetPage(
        name: signup,
        page: () => const SignupPage(),
        middlewares: [GuestMiddleware()]),
    GetPage(
        name: signin,
        page: () => const SigninPage(),
        middlewares: [GuestMiddleware()]),
    GetPage(
        name: confirmOtp,
        page: () => const OtpPage(),
        middlewares: [GuestMiddleware()]),
    GetPage(
        name: confirmOtpLogin,
        page: () => const OtpLoginPage(),
        middlewares: [GuestMiddleware()]),
    GetPage(
        name: accountCreated,
        page: () => const AccountCreatedPage(),
        middlewares: [GuestMiddleware()]),

    //account setting
    GetPage(
        name: account,
        page: () => const AccountPage(),
        middlewares: [AuthMiddleware()]),
    GetPage(name: profile, page: () => const ProfilePage()),
    GetPage(name: mySubscribe, page: () => const MySubscribePage()),
    //subscribe action
    GetPage(
        name: subscribeCompleted, page: () => const SubscribeCompletedPage()),

    //horoscopes
    GetPage(name: dialyHoroscope, page: () => const DailyHoroscopePage()),
    GetPage(name: dobHoroscope, page: () => const DobHoroscopePage()),
    GetPage(name: coupleHoroscope, page: () => const CoupleHoroscopePage()),
    GetPage(name: phoneHoroscope, page: () => const PhoneNumberHoroscopePage()),
    GetPage(name: bankHoroscope, page: () => const BankNumberHoroscopePage()),
    GetPage(name: plateHoroscope, page: () => const PlateNumberHoroscopePage()),
    GetPage(
        name: chCalendarHoroscope, page: () => const ChCalendarHoroscopePage()),
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
  static getConfirmOtpLogin() => confirmOtpLogin;
  static getAccountCreated() => accountCreated;
  //account setting
  static getAccount() => account;
  static getProfile() => profile;
  static getMySubscribe() => mySubscribe;

  //subscribe action
  static getSubscribeCompleted() => subscribeCompleted;

  //horoscopes
  static getDialyHoroscope() => dialyHoroscope;
  static getDobHoroscope() => dobHoroscope;
  static getCoupleHoroscope() => coupleHoroscope;
  static getPhoneHoroscope() => phoneHoroscope;
  static getBankHoroscope() => bankHoroscope;
  static getPlateHoroscope() => plateHoroscope;
  static getChCalendarHoroscope() => chCalendarHoroscope;

  static String bottomNavbar = "/";
  static String horoscope = "/horoscope";
  static String home = "/";
  static String premium = "/premium";
  //auth
  static String auth = "/auth";
  static String signup = "/signup";
  static String signin = "/signin";
  static String confirmOtp = "/confirm-otp";
  static String confirmOtpLogin = "/confirm-otp-login";
  static String accountCreated = "/account-created";
  //account setting
  static String account = "/account";
  static String profile = "/profile";
  static String mySubscribe = "/my-subscribe";
  //subscribe action
  static String subscribeCompleted = "/subscribe-completed";

  //horoscopes
  static String dialyHoroscope = "/daily-horoscope";
  static String dobHoroscope = "/dob-horoscope";
  static String coupleHoroscope = "/couple-horoscope";
  static String phoneHoroscope = "/phone-horoscope";
  static String bankHoroscope = "/bank-horoscope";
  static String plateHoroscope = "/plate-horoscope";
  static String chCalendarHoroscope = "/chinese-horoscope";
}
