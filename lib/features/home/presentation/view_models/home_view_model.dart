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
  HomeViewState state = HomeViewState(entitie: HomeEntitie([]));

  void fetch() async {
    state = HomeViewState(entitie: await usecase.fetchEntitie());
    notifyListeners();
  }
}
