import 'package:dallal_proj/core/theme/app_colors.dart';

import 'package:dallal_proj/core/shared/widgets/svg_ico.dart';
import 'package:dallal_proj/core/shared/widgets/symmetric_pads/h_p_item.dart';
import 'package:dallal_proj/gen/assets/assets.gen.dart';
import 'package:flutter/material.dart';

class EditIco extends StatelessWidget {
  const EditIco({super.key, this.onTap});
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: HPItem(
        rSpc: 10,
        child: SvgIco(
          ico: Assets.icons.svg.edit18,
          wth: 18,
          ht: 18,
          color: kBlack,
        ),
      ),
    );
  }
}
