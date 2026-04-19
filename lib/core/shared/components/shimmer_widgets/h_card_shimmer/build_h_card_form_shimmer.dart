import 'package:dallal_proj/core/shared/components/shimmer_widgets/property_card_items/card_date_txt_shimmer.dart';
import 'package:dallal_proj/core/shared/components/shimmer_widgets/property_card_items/card_property_image_shimmer.dart';
import 'package:dallal_proj/core/shared/components/shimmer_widgets/property_card_items/card_title_wid_shimmer.dart';
import 'package:dallal_proj/core/shared/components/shimmer_widgets/property_card_items/right_ico_line_shimmer.dart';
import 'package:dallal_proj/gen/assets/assets.gen.dart';

import 'package:flutter/material.dart';

List<Widget> buildHCardFormShimmer({
  bool? isFaved = false,
  bool? isFeatured = false,
  bool? status,
  required Widget child,
}) {
  return [
    CardPropertyImageShimmer(
      isFaved: isFaved,
      isFeatured: isFeatured,
      status: status,
    ),
    const Spacer(flex: 2),
    const CardDateTxtShimmer(),
    const Spacer(flex: 4),
    const CardTitleWidShimmer(),
    const Spacer(flex: 6),
    RightIcoLineShimmer(icoPath: Assets.icons.svg.location13),
    const Spacer(flex: 1),
    RightIcoLineShimmer(icoPath: Assets.icons.svg.building13),
    const Spacer(flex: 1),
    RightIcoLineShimmer(icoPath: Assets.icons.svg.tag13),
    const Spacer(flex: 6),
    child,
  ];
}
