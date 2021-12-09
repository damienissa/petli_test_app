import 'package:petli_test_app/common/models/photo_model.dart';

class HomeDataModel {
  final List<Photo> list;
  HomeDataModel(this.list);
  factory HomeDataModel.from(List<Photo> list) => HomeDataModel(list);
}
