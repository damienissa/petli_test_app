import 'package:flutter/material.dart';
import 'package:petli_test_app/common/services/local_storage.dart';
import 'package:petli_test_app/common/services/navigation_service.dart';
import 'package:petli_test_app/features/home/home_builder.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await LocalStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: globalNavigationKey,
      home: HomeBuilder.build(),
    );
  }
}
