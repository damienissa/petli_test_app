import 'dart:developer';

import 'package:petli_test_app/features/home/data/models/home_data_model.dart';

import '../../domain/repositories/home_remote_repository.dart';
import '../datasources/home_data_source.dart';

class HomeRepository extends IHomeRemoteRepository {
  HomeRepository(HomeDataSource dataSource) : super(dataSource);

  @override
  Future<HomeDataModel> fetchEntitie() async {
    final result = await dataSource.fetchData();
    HomeDataModel? dataModel;
    result.onSuccess((value) => dataModel = value);
    result.catchError((value) => log(value.toString()));
    return dataModel ?? HomeDataModel([]);
  }
}
