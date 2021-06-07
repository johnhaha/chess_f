import 'package:flutter/material.dart';

extension NavigationExtension on BuildContext {
  NavigatorState get navigation => Navigator.of(this);
  Future<T?> push<T>(Widget child) {
    return Navigator.push<T>(
        this, MaterialPageRoute(builder: (context) => child));
  }

  Future popUp(Widget child) {
    return Navigator.push(this, createRoute(child));
  }
}

Route createRoute(Widget child) {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => child,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      var begin = Offset(0.0, 1.0);
      var end = Offset.zero;
      var curve = Curves.ease;

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
  );
}
