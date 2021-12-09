import 'dart:async';

import 'package:disposer/disposer.dart';
import 'package:petli_test_app/common/api/api.dart';
import 'package:petli_test_app/common/models/photo_model.dart';
import 'package:petli_test_app/common/result_type.dart';

import '../models/home_data_model.dart';

class HomeDataSource with Disposable {
  HomeDataSource(this._api);

  final API _api;

  Future<ResultType<HomeDataModel>> fetchData() async {
    final response = await _api.loadImagesList();
    if (response.statusCode == 200) {
      try {
        final list = photoFromJson(response.body);
        return ResultType.success(HomeDataModel.from(list));
      } catch (e) {
        return ResultType.error(BackendError(e.toString()));
      }
    }
    return ResultType.error(BackendError(
        'StatusCode: ${response.statusCode}\nBody: ${response.body}'));
  }
}
