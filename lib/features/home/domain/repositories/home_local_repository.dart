import 'package:disposer/disposer.dart';

abstract class IHomeLocalRepository with Disposable {
  List<int> fetchFavorites();
  void saveToFavorites(int id);
  void deleteFromFavorites(int id);
}
