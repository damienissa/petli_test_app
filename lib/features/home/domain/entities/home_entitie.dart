import 'package:flutter/material.dart';
import 'package:petli_test_app/common/models/photo_model.dart';

import '../../data/models/home_data_model.dart';

class HomeEntitie {
  final List<PhotoCard> photos;
  HomeEntitie(this.photos);
  factory HomeEntitie.fromDataModel(HomeDataModel dataModel) =>
      HomeEntitie(dataModel.list.map(PhotoCard.new).toList());
}

class PhotoCard with ChangeNotifier {
  PhotoCard(this._photo);
  final Photo _photo;
  String get title => _photo.title;
  String get image => _photo.thumbnailUrl;

  bool _isFavorite = false;
  bool get isFavorite => _isFavorite;
  set isFavorite(bool val) {
    _isFavorite = val;
    notifyListeners();
  }
}
