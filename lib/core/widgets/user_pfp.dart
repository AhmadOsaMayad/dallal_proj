import 'package:dallal_proj/core/theme/app_colors.dart';
import 'package:dallal_proj/core/utils/assets_data.dart';
import 'package:dallal_proj/core/utils/functions/get_safe_image_url.dart';
import 'package:flutter/material.dart';

class UserPfp extends StatelessWidget {
  const UserPfp({super.key, required this.rad, required this.imgPath});

  final double? rad;
  final String? imgPath;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: rad ?? 33,
      backgroundColor: kPrimColG,
      foregroundImage:
          (imgPath != null && imgPath!.isNotEmpty)
              ? NetworkImage(getSafeImageUrl(imgPath))
              : const AssetImage(AssetsData.rUserAvatar),
    );
  }
}

class UserPfp2 extends StatelessWidget {
  const UserPfp2({super.key, required this.rad, required this.imgPath});

  final double? rad;
  final String? imgPath;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: rad ?? 33,
      backgroundColor: kPrimColG,
      foregroundImage:
          (imgPath != null && imgPath!.isNotEmpty)
              ? NetworkImage(getSafeImageUrl(imgPath))
              : const AssetImage(AssetsData.rUserAvatar),
    );
  }
}
