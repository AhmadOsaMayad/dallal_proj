import 'package:dallal_proj/gen/assets/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class PremLblIco extends StatelessWidget {
  const PremLblIco({super.key, required this.color});
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 24,
      height: 24,
      clipBehavior: Clip.antiAlias,
      decoration: const BoxDecoration(),
      child: SvgPicture.asset(
        Assets.icons.svg.premiumico,
        colorFilter: ColorFilter.mode(color, BlendMode.srcIn),
      ),
    );
  }
}
