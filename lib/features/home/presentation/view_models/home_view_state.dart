import '../../domain/entities/home_entitie.dart';

class HomeViewState {
  HomeEntitie entitie;
  final Function(PhotoCard) onCardSelected;
  final Function(PhotoCard) onFavoriteToggle;
  HomeViewState({
    required this.entitie,
    required this.onCardSelected,
    required this.onFavoriteToggle,
  });
}
