import 'package:dallal_proj/core/theme/app_colors.dart';

import 'package:dallal_proj/core/shared/widgets/svg_ico.dart';
import 'package:dallal_proj/gen/assets/assets.gen.dart';
import 'package:flutter/material.dart';

class SuffixTextIcon extends StatelessWidget {
  const SuffixTextIcon({super.key, required this.onTap});

  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.centerRight,
      children: [
        // Custom left border
        Positioned(
          left: 0,
          top: 12, // Adjust top offset
          bottom: 12, // Adjust bottom offset
          child: Container(
            width: 2, // Border thickness
            color: kPrimColG, // Border color
          ),
        ),
        // Icon with padding
        Padding(
          padding: const EdgeInsets.all(8),
          child: GestureDetector(
            onTap: onTap,
            child: SvgIco(ico: Assets.icons.svg.search24, color: kPrimColG),
          ),
        ),
      ],
    );
  }
}
