import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:petli_test_app/common/constants/app_constants.dart';

class DetailsWidget extends StatelessWidget {
  final String photo;
  const DetailsWidget({
    Key? key,
    required this.photo,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pop();
      },
      child: Center(
        child: Hero(
          tag: AppConstants.imageHeroTag,
          child: CachedNetworkImage(
            imageUrl: photo,
            progressIndicatorBuilder: (context, url, progress) =>
                const CircularProgressIndicator(),
          ),
        ),
      ),
    );
  }
}
