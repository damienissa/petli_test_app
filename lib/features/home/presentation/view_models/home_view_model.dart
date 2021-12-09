import 'package:disposer/disposer.dart';
import 'package:flutter/material.dart';

import '../../domain/entities/home_entitie.dart';
import '../../domain/usecases/home_usecase.dart';
import 'home_view_state.dart';

class HomeViewModel with ChangeNotifier, Disposable, StreamListenable {
  HomeViewModel(this.usecase) {
    usecase.fetchEntitie();
  }

  @override
  List<Disposable> get disposables => [usecase];

  final HomeUsecase usecase;
  late HomeViewState state = HomeViewState(
      entitie: HomeEntitie([]),
      onCardSelected: (PhotoCard card) {
        usecase.show(card.photo);
      },
      onFavoriteToggle: (PhotoCard card) {
        card.isFavorite = !card.isFavorite;
        card.isFavorite
            ? usecase.addToFavorite(card.photo)
            : usecase.removeFromFavorite(card.photo);
      });

  void fetch() async {
    state.entitie = await usecase.fetchEntitie();
    notifyListeners();
  }
}
