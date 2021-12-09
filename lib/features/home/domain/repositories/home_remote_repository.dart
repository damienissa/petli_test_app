import 'package:disposer/disposer.dart';
import 'package:petli_test_app/features/home/data/models/home_data_model.dart';

import '../../data/datasources/home_data_source.dart';

abstract class IHomeRemoteRepository with Disposable {
  IHomeRemoteRepository(this.dataSource);

  final HomeDataSource dataSource;

  @override
  List<Disposable> get disposables => [dataSource];

  Future<HomeDataModel> fetchEntitie();
}
