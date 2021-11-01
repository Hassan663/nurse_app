import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class AppRoutes {
  static Future<T?> push<T extends Object>(
    BuildContext context,
    Widget page,
  ) async {
    return await Navigator.push(
        context,
        PageTransition(
            type: PageTransitionType.leftToRightWithFade, child: page));
  }

  static void replace(
    BuildContext context,
    Widget page,
  ) {
    Navigator.push(
        context,
        PageTransition(
            type: PageTransitionType.leftToRightWithFade, child: page));
  }

  static void popUntilHome(BuildContext context) {
    Navigator.of(context).popUntil((predicate) => predicate.isFirst);
  }

  static void pop(BuildContext context) {
    Navigator.of(context).pop();
  }

  static void dismissAlert(context) {
    Navigator.of(context).pop();
  }
}
