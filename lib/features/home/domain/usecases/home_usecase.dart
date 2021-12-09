import 'package:disposer/disposer.dart';
import 'package:petli_test_app/common/services/navigation_service.dart';
import '../entities/home_entitie.dart';
import '../repositories/home_repository.dart';

class HomeUsecase with Disposable {
  HomeUsecase({
    required this.domainRepository,
    required this.navigationService,
  });

  final IHomeRepository domainRepository;
  final NavigationService navigationService;

  @override
  List<Disposable> get disposables => [domainRepository];

  Future<HomeEntitie> fetchEntitie() async {
    final entitie = await domainRepository.fetchEntitie();
    if (entitie.photos.isEmpty) {
      _showError();
    }
    return entitie;
  }

  void _showError() {
    navigationService.showError('Can\'t find any photos');
  }
}
