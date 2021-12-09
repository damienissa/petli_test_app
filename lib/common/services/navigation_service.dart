import 'package:flutter/material.dart';

final globalNavigationKey = GlobalKey<NavigatorState>();

class NavigationService {
  BuildContext get context => globalNavigationKey.currentContext!;
  void showError(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }

  void showPopup(Widget child) {
    showDialog(
      context: context,
      builder: (_) => child,
    );
  }
}
