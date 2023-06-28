import 'package:fluro/fluro.dart';
import 'package:flutter/cupertino.dart';

import '../../feature/about_us/presentation/about_us/about_us_page.dart';
import '../../feature/contact/presentation/contact/contact_page.dart';
import '../../feature/esg/presentation/esg/esg_page.dart';
import '../../feature/home/presentation/home/home_page.dart';
import '../../feature/new/presentation/new/new_page.dart';
import '../../feature/partner/presentation/partner/partner_page.dart';
import '../../feature/product/presentation/product/product_page.dart';
import '../../feature/recruitment/presentation/recruitment/recruitment_page.dart';
import 'router_path.dart';

class Routes {
  Routes();
  static final router = FluroRouter();
  static RouteObserver<PageRoute> routeObserver = RouteObserver<PageRoute>();

  static void configureRoutes() {
    _setRouter(
      RoutePath.recruitment,
      handler: recruitmentHandler,
      transitionType: TransitionType.cupertino,
    );
    _setRouter(
      RoutePath.aboutUs,
      handler: aboutUsHandler,
      transitionType: TransitionType.cupertino,
    );

    _setRouter(
      RoutePath.contact,
      handler: contactHandler,
      transitionType: TransitionType.cupertino,
    );

    _setRouter(
      RoutePath.esg,
      handler: esgHandler,
      transitionType: TransitionType.cupertino,
    );
    _setRouter(
      RoutePath.news,
      handler: newHandler,
      transitionType: TransitionType.cupertino,
    );
    _setRouter(
      RoutePath.partner,
      handler: partnerHandler,
      transitionType: TransitionType.cupertino,
    );
    _setRouter(
      RoutePath.product,
      handler: productHandler,
      transitionType: TransitionType.cupertino,
    );
    _setRouter(
      RoutePath.home,
      handler: homeHandler,
      transitionType: TransitionType.cupertino,
    );
  }

  static void _setRouter(String path,
      {required Handler handler, TransitionType? transitionType}) {
    transitionType ??= TransitionType.cupertino;
    router.define(path, handler: handler, transitionType: transitionType);
  }
}
