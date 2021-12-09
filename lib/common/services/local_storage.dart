import 'package:shared_preferences/shared_preferences.dart';

class LocalStorage {
  final SharedPreferences sharedPreferences;
  LocalStorage._(this.sharedPreferences);
  static late LocalStorage shared;
  static Future<LocalStorage> init() async {
    shared = LocalStorage._(await SharedPreferences.getInstance());
    return shared;
  }

  List<int> getList(String key) {
    return sharedPreferences
            .getStringList(key)
            ?.map((e) => int.parse(e))
            .toList() ??
        [];
  }

  void setList(List<int> value, {required String key}) {
    sharedPreferences.setStringList(
        key, value.map((e) => e.toString()).toList());
  }
}
