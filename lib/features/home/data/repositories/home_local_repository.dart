import 'package:petli_test_app/common/constants/app_constants.dart';
import 'package:petli_test_app/common/services/local_storage.dart';
import 'package:petli_test_app/features/home/domain/repositories/home_local_repository.dart';

class HomeLocalRepository extends IHomeLocalRepository {
  final LocalStorage storage;

  HomeLocalRepository(this.storage);
  @override
  List<int> fetchFavorites() {
    return storage.getList(AppConstants.favoriteList);
  }

  @override
  void saveToFavorites(int id) {
    final favorites = fetchFavorites();
    favorites.add(id);
    storage.setList(favorites, key: AppConstants.favoriteList);
  }

  @override
  void deleteFromFavorites(int id) {
    final favorites = fetchFavorites();
    favorites.remove(id);
    storage.setList(favorites, key: AppConstants.favoriteList);
  }
}
