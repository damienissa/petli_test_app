import 'package:flutter/material.dart';

final globalNavigationKey = GlobalKey<NavigatorState>();

class NavigationService {
  void showError(String message) {
    ScaffoldMessenger.of(globalNavigationKey.currentContext!).showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }
}
