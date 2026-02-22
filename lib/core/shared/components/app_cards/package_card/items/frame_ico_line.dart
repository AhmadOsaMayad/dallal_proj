import 'package:dallal_proj/core/enums/package_type.dart';
import 'package:dallal_proj/core/constants/app_texts.dart';
import 'package:dallal_proj/core/theme/app_font_styles.dart';
import 'package:dallal_proj/core/theme/app_font_styles_colorer.dart';

import 'package:dallal_proj/core/shared/widgets/right_ico_line.dart';
import 'package:dallal_proj/gen/assets/assets.gen.dart';
import 'package:flutter/material.dart';

class FrameIcoLine extends StatelessWidget {
  const FrameIcoLine({super.key, required this.type, this.icoSize, this.style});

  final PackageType type;
  final double? icoSize;
  final TextStyle? style;

  @override
  Widget build(BuildContext context) {
    return RightIcoLine(
      text: '$kFrame ${type.frame} $kDay',
      icoPath: Assets.icons.svg.frame20,
      style: FsC.colSt(style ?? FStyles.s12w5, type.color),
      color: type.color,
      icoHt: icoSize,
      icoWth: icoSize,
    );
  }
}
