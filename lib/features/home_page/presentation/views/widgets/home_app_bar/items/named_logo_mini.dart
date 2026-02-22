import 'package:dallal_proj/core/constants/app_texts.dart';

import 'package:dallal_proj/core/theme/app_font_styles.dart';
import 'package:dallal_proj/core/shared/widgets/two_item_widgets/two_itm_row.dart';
import 'package:dallal_proj/gen/assets/assets.gen.dart';
import 'package:flutter/material.dart';

class MiniNamedLogo extends StatelessWidget {
  const MiniNamedLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return TwoItmRow(
      mXSize: MainAxisSize.min,
      leftChild: Text(kAppName, style: FStyles.s24w6),
      rightChild: Image.asset(
        Assets.icons.png.bLogo.path,
        width: 48,
        height: 48,
      ),
    );
  }
}
