import 'package:dallal_proj/core/shared/components/app_labels/lbl_entity.dart';
import 'package:dallal_proj/core/theme/app_colors.dart';
import 'package:dallal_proj/core/constants/app_texts.dart';
import 'package:dallal_proj/core/theme/app_font_styles_colorer.dart';
import 'package:dallal_proj/core/theme/app_themes.dart';
import 'package:dallal_proj/core/theme/app_font_styles.dart';
import 'package:dallal_proj/core/shared/components/app_labels/items/lbl_row.dart';
import 'package:dallal_proj/core/shared/components/app_labels/items/prem_lbl_ico.dart';
import 'package:dallal_proj/core/shared/components/app_labels/items/prem_lbl_txt.dart';
import 'package:flutter/material.dart';

class LblHelper {
  static var prmLblModel = LblEntity(prmLabel(null), prmLblRow());

  static var pndLblModel = LblEntity(pendingLabel(), pndLblRow());

  static var getLblModel = LblEntity(prmLabel(kPrimColY), getLblRow());

  static Decoration pendingLabel() =>
      Themer.genShape(color: kPrimColO, borderRadius: BorderRadius.circular(8));

  static LblRow prmLblRow() => LblRow(
    children: [
      PremLblTxt(style: FsC.premiumLabelTextStyle(18), txt: kPremAdv),
      const PremLblIco(color: kPrimColY),
    ],
  );

  static LblRow pndLblRow() => LblRow(
    children: [
      PremLblTxt(style: FsC.colStW(FStyles.s18wB), txt: kAdvUnderReview),
    ],
  );

  static LblRow getLblRow() => LblRow(
    children: [
      const PremLblIco(color: kBlack),
      PremLblTxt(style: FStyles.s14W5, txt: kLongPremLblText),
    ],
  );

  static Decoration prmLabel(Color? color) => Themer.genShape(
    color: color ?? kBlack1D,
    borderRadius: _prmLblRad(),
    // side: BorderSide(),
  );

  static BorderRadius _prmLblRad() => const BorderRadius.only(
    topLeft: Radius.circular(5),
    topRight: Radius.circular(2),
    bottomLeft: Radius.circular(5),
    bottomRight: Radius.circular(5),
  );
}
