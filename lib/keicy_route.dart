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
  final Widget page;
  final String routeName;
  final Object arguments;
  final PageTransitionType transitionType;
  final Duration transitionDuration;
  final bool opaque;
  final Curve curve;

  KeicyRoute(
    this.routeName,
    this.page, {
    this.arguments,
    this.transitionType,
    this.transitionDuration,
    this.opaque,
    this.curve,
  }) : super(
          settings: RouteSettings(
            name: routeName,
            arguments: arguments,
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
