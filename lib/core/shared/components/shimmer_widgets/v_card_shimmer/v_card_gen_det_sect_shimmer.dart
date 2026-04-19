import 'package:dallal_proj/core/shared/components/app_btns/models/x_b_size.dart';
import 'package:dallal_proj/core/shared/components/shimmer_widgets/property_card_items/card_date_txt_shimmer.dart';
import 'package:dallal_proj/core/shared/components/shimmer_widgets/property_card_items/card_seperated_btns_shimmer.dart';
import 'package:dallal_proj/core/shared/components/shimmer_widgets/property_card_items/card_title_wid_shimmer.dart';
import 'package:dallal_proj/core/shared/components/shimmer_widgets/property_card_items/right_ico_line_shimmer.dart';

import 'package:dallal_proj/core/shared/widgets/symmetric_pads/v_p_item.dart';
import 'package:dallal_proj/gen/assets/assets.gen.dart';
import 'package:flutter/material.dart';

class VCardGenDetSectShimmer extends StatelessWidget {
  const VCardGenDetSectShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        const CardDateTxtShimmer(),
        const Spacer(flex: 3),
        const CardTitleWidShimmer(),
        const Spacer(flex: 3),
        RightIcoLineShimmer(icoPath: Assets.icons.svg.location13),
        VPItem(
          tSpc: 3,
          bSpc: 3,
          child: RightIcoLineShimmer(icoPath: Assets.icons.svg.building13),
        ),
        RightIcoLineShimmer(icoPath: Assets.icons.svg.tag13),
        const Spacer(flex: 2),
        const CardSeperatedBtnsShimmer(
          moreBtnSize: XBSize(width: 83.5429, height: 29),
          sepWidth: 177,
          isLiked: false,
        ),
      ],
    );
  }
}
