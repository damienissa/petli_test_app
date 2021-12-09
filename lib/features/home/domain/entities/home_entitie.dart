import 'package:flutter/material.dart';
import 'package:petli_test_app/common/models/photo_model.dart';

class HomeEntitie {
  final List<PhotoCard> photos;
  HomeEntitie(this.photos);
}

class PhotoCard with ChangeNotifier {
  PhotoCard(this.photo, this._isFavorite);
  final Photo photo;
  String get title => photo.title;
  String get image => photo.thumbnailUrl;

  bool _isFavorite = false;
  bool get isFavorite => _isFavorite;
  set isFavorite(bool val) {
    _isFavorite = val;
    notifyListeners();
  }
}
