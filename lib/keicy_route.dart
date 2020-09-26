library keicy_route;

import 'package:flutter/material.dart';

enum PageTransitionType {
  fade,
  rightToLeft,
  leftToRight,
  upToDown,
  downToUp,
  scale,
  rotate,
  size,
  rightToLeftWithFade,
  leftToRightWithFade,
}

class KeicyRoute extends PageRouteBuilder {
  Widget page;
  String routeName;
  Object arguments;
  PageTransitionType transitionType;
  Duration transitionDuration;
  bool opaque;
  Curve curve;

  KeicyRoute(
    this.routeName,
    this.page, {
    this.arguments,
    this.transitionType = PageTransitionType.fade,
    this.transitionDuration = const Duration(milliseconds: 300),
    this.opaque = true,
    this.curve = Curves.ease,
  }) : super(
          settings: RouteSettings(
            name: routeName,
            arguments: {"isCheckCookie": false},
          ),
          pageBuilder: (context, animation, secondaryAnimation) => page,
          transitionDuration: transitionDuration,
          opaque: opaque,
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            var tween = Tween<double>(begin: 0, end: 1).chain(CurveTween(curve: curve));
            switch (transitionType) {
              case PageTransitionType.fade:
                return FadeTransition(
                  opacity: animation.drive(tween),
                  child: child,
                );
                break;
              default:
                return FadeTransition(
                  opacity: animation.drive(tween),
                  child: child,
                );
                break;
            }
          },
        );
}
