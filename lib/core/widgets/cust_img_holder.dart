import 'package:cached_network_image/cached_network_image.dart';
import 'package:dallal_proj/core/components/shimmer_widgets/property_card_items/cust_img_holder_shimmer.dart';
import 'package:dallal_proj/core/components/shimmer_widgets/place_holder_image.dart';
import 'package:dallal_proj/core/utils/functions/get_safe_image_url.dart';
import 'package:flutter/material.dart';

class CustImgHolder extends StatelessWidget {
  const CustImgHolder({super.key, required this.img, this.aspect, this.radius});
  final String? img;
  final double? aspect, radius;
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.all(Radius.circular(radius ?? 8)),
      child: AspectRatio(
        aspectRatio: aspect ?? 9 / 7,
        child: CachedNetworkImage(
          fit: BoxFit.fill,
          imageUrl: getSafeImageUrl(img),
          placeholder:
              (context, url) =>
                  url.isEmpty
                      ? const PlaceHolderImage()
                      : const CustImgHolderShimmer(),
          errorWidget: (context, url, error) => const PlaceHolderImage(),
        ),
      ),
    );
  }
}
