import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:horoscope_cellcard/routes/routes.dart';

class AppRouterDelegate extends GetDelegate {
  GetNavConfig get prevRoute => // here
      history.length < 2 ? history.last : history[history.length - 2];

  @override
  Future<GetNavConfig> popHistory() async {
    // and here
    final result = prevRoute;
    Get.rootDelegate.offNamed(prevRoute.currentPage!.name);
    return result;
  }

  @override
  Widget build(BuildContext context) {
    GlobalKey mainNavigatorKey = GlobalKey<NavigatorState>();

    return Navigator(
      key: mainNavigatorKey,
      onPopPage: (route, result) => route.didPop(result),
      pages: currentConfiguration != null
          ? [currentConfiguration!.currentPage!]
          : [GetNavConfig.fromRoute(AppPage.home)!.currentPage!],
    );
  }
}
