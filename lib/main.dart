import 'package:flutter/material.dart';
import 'package:petli_test_app/common/services/navigation_service.dart';
import 'package:petli_test_app/features/home/home_builder.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: globalNavigationKey,
      home: HomeBuilder.build(),
    );
  }
}
