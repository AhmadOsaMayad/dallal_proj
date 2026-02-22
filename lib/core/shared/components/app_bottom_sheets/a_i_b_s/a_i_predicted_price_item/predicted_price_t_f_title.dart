import 'package:dallal_proj/core/shared/widgets/custom_right_ico_line.dart';
import 'package:dallal_proj/core/constants/app_texts.dart';
import 'package:dallal_proj/core/theme/app_font_styles.dart';
import 'package:dallal_proj/core/shared/widgets/symmetric_pads/v_p_item.dart';
import 'package:dallal_proj/gen/assets/assets.gen.dart';
import 'package:flutter/material.dart';

class PredictedPriceTFTitle extends StatelessWidget {
  const PredictedPriceTFTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return VPItem(
      bSpc: 12,
      child: CustomRightIcoLine(
        text: kPredictedPrice,
        icoHt: 24,
        icoWth: 24,
        // itSpc: 4,
        icoPath: Assets.icons.svg.aipredict24,
        style: FStyles.s15w6,
      ),
    );
  }
}
