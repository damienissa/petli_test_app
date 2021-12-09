import 'package:flutter/material.dart';
import 'package:petli_test_app/common/design_system/ds_colors.dart';
import 'package:petli_test_app/features/home/domain/entities/home_entitie.dart';
import 'package:petli_test_app/features/home/presentation/view_models/home_view_state.dart';
import 'package:petli_test_app/features/home/presentation/widgets/home_widget_card.dart';

class HomeWidget extends StatelessWidget {
  final HomeViewState state;
  const HomeWidget({
    Key? key,
    required this.state,
  }) : super(key: key);

  List<PhotoCard> get _photos => state.entitie.photos;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(gradient: DSColors.backgroundGradient),
      child: ListView.builder(
        itemBuilder: (
          BuildContext context,
          int index,
        ) {
          return HomeWidgetCard(
            card: _photos[index],
            onCardSelected: (PhotoCard card) {},
            onFavoriteToggle: (PhotoCard card) {
              card.isFavorite = !card.isFavorite;
            },
          );
        },
        itemCount: _photos.length,
      ),
    );
  }
}
