import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
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
          return GestureDetector(
            onTap: () => onCardSelected(card),
            child: Container(
              margin:
                  const EdgeInsets.symmetric(horizontal: 24.0, vertical: 8.0),
              decoration: BoxDecoration(
                  color: DSColors.lightOrange,
                  boxShadow: const [
                    BoxShadow(
                      offset: Offset(0, 2),
                      blurRadius: 4,
                      color: DSColors.background,
                    )
                  ],
                  borderRadius: BorderRadius.circular(20)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: Text(
                      card.title,
                      style: const TextStyle(
                          fontFamily: 'Butler',
                          fontWeight: FontWeight.w500,
                          fontSize: 18),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  CachedNetworkImage(
                    imageUrl: card.image,
                  ),
                  CupertinoButton(
                    onPressed: () => onFavoriteToggle(card),
                    child: card.isFavorite
                        ? const Icon(
                            Icons.favorite,
                            color: DSColors.accent,
                          )
                        : const Icon(
                            Icons.favorite_border,
                            color: DSColors.accent,
                          ),
                  )
                ],
              ),
            ),
          );
        });
  }
}
