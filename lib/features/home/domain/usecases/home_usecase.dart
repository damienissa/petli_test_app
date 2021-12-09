import 'package:disposer/disposer.dart';
import 'package:petli_test_app/common/models/photo_model.dart';
import 'package:petli_test_app/common/services/navigation_service.dart';
import 'package:petli_test_app/features/home/domain/repositories/home_local_repository.dart';
import '../entities/home_entitie.dart';
import '../repositories/home_remote_repository.dart';

class HomeUsecase with Disposable {
  HomeUsecase({
    required this.remoteRepository,
    required this.localRepository,
    required this.navigationService,
  });

  final IHomeRemoteRepository remoteRepository;
  final IHomeLocalRepository localRepository;
  final NavigationService navigationService;

  @override
  List<Disposable> get disposables => [remoteRepository];

  Future<HomeEntitie> fetchEntitie() async {
    final entitie = await remoteRepository.fetchEntitie();
    final favorites = localRepository.fetchFavorites();
    final photos = entitie.list
        .map((e) => PhotoCard(e, favorites.contains(e.id)))
        .toList();
    if (photos.isEmpty) {
      _showError();
    }
    return HomeEntitie(photos);
  }

  void _showError() {
    navigationService.showError('Can\'t find any photos');
  }

  void show(Photo photo) {}

  void addToFavorite(Photo photo) {
    localRepository.saveToFavorites(photo.id);
  }

  void removeFromFavorite(Photo photo) {
    localRepository.deleteFromFavorites(photo.id);
  }
}
