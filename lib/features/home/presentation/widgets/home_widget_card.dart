import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:petli_test_app/common/design_system/ds_colors.dart';
import 'package:petli_test_app/features/home/domain/entities/home_entitie.dart';

class HomeWidgetCard extends StatelessWidget {
  final PhotoCard card;
  final Function(PhotoCard) onCardSelected;
  final Function(PhotoCard) onFavoriteToggle;
  const HomeWidgetCard({
    Key? key,
    required this.card,
    required this.onCardSelected,
    required this.onFavoriteToggle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: card,
        builder: (context, _) {
          return Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 24.0, vertical: 8.0),
            child: GestureDetector(
              onTap: () => onCardSelected(card),
              child: Container(
                // height: 300,
                decoration: BoxDecoration(
                    color: DSColors.lightOrange,
                    borderRadius: BorderRadius.circular(20)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        card.title,
                        style: const TextStyle(
                            color: DSColors.darkText, fontSize: 18),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    CachedNetworkImage(
                      imageUrl: card.image,
                    ),
                    TextButton.icon(
                        onPressed: () => onFavoriteToggle(card),
                        icon: card.isFavorite
                            ? const Icon(Icons.favorite)
                            : const Icon(Icons.favorite_border),
                        label: const Text(''))
                  ],
                ),
              ),
            ),
          );
        });
  }
}
