import 'package:dallal_proj/core/theme/app_font_styles_colorer.dart';
import 'package:dallal_proj/core/shared/widgets/helpers/widgets_helper.dart';
import 'package:dallal_proj/features/details_page/domain/entities/show_details_entity.dart';
import 'package:dallal_proj/gen/assets/assets.gen.dart';
import 'package:flutter/material.dart';

import 'package:dallal_proj/core/theme/app_font_styles.dart';
import 'package:dallal_proj/core/shared/components/app_cards/property_card/items/card_details/card_date_txt.dart';
import 'package:dallal_proj/core/shared/components/app_cards/property_card/items/card_image/card_property_image.dart';
import 'package:dallal_proj/core/shared/components/app_cards/property_card/items/card_details/card_title_wid.dart';
import 'package:dallal_proj/core/shared/widgets/custom_right_ico_line.dart';

List<Widget> buildHCardForm(
  ShowDetailsEntity advsListItem, {
  void Function()? onPressedFav,

  required Widget child,
}) {
  return [
    CardPropertyImage(advListItem: advsListItem),
    const Spacer(flex: 2),
    CardDateTxt(date: WidH.str2date(advsListItem.date!)),
    const Spacer(flex: 4),
    CardTitleWid(
      text: advsListItem.title!,
      style: FsC.htStyle(FStyles.s12wB, 0.1),
    ),
    const Spacer(flex: 6),
    CustomRightIcoLine(
      text: advsListItem.adress!,
      icoPath: Assets.icons.svg.location13,
      style: FStyles.s10w5h1o6,
    ),
    const Spacer(flex: 1),
    CustomRightIcoLine(
      text: advsListItem.section!,
      icoPath: Assets.icons.svg.building13,
      style: FStyles.s10w5h1o6,
    ),
    const Spacer(flex: 1),
    CustomRightIcoLine(
      text: advsListItem.price!,
      icoPath: Assets.icons.svg.tag13,
      style: FStyles.s10w5h1o6,
    ),
    const Spacer(flex: 6),
    child,
  ];
}
