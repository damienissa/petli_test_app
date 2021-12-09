import 'dart:developer';

import 'package:petli_test_app/common/models/photo_model.dart';
import 'package:petli_test_app/common/result_type.dart';
import 'package:petli_test_app/features/home/data/models/home_data_model.dart';

import '../../domain/entities/home_entitie.dart';
import '../../domain/repositories/home_repository.dart';
import '../datasources/home_data_source.dart';

class HomeRepository extends IHomeRepository {
  HomeRepository(HomeDataSource dataSource) : super(dataSource);

  @override
  Future<HomeEntitie> fetchEntitie() async {
    final result = await dataSource.fetchData();
    HomeDataModel? dataModel;
    result.onSuccess((value) => dataModel = value);
    result.catchError((value) => log(value.toString()));
    return HomeEntitie.fromDataModel(dataModel ?? HomeDataModel([]));
  }
}
