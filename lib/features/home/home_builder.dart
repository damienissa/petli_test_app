import 'package:petli_test_app/common/api/api.dart';
import 'package:petli_test_app/common/services/local_storage.dart';
import 'package:petli_test_app/common/services/navigation_service.dart';
import 'package:petli_test_app/features/home/data/repositories/home_local_repository.dart';

import 'data/datasources/home_data_source.dart';
import 'data/repositories/home_repository.dart';
import 'domain/usecases/home_usecase.dart';
import 'presentation/pages/home_page.dart';
import 'presentation/view_models/home_view_model.dart';

class HomeBuilder {
  static HomePage build() {
    final dataSource = HomeDataSource(API());
    final repository = HomeRepository(dataSource);
    final usecase = HomeUsecase(
      remoteRepository: repository,
      navigationService: NavigationService(),
      localRepository: HomeLocalRepository(
        LocalStorage.shared,
      ),
    );
    final viewModel = HomeViewModel(usecase);
    return HomePage(viewModel: viewModel);
  }
}
