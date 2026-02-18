import 'package:dallal_proj/core/components/app_cards/package_card/entities/package_cards_display_type.dart';
import 'package:dallal_proj/core/components/app_cards/package_card/entities/package_entity.dart';
import 'package:dallal_proj/core/components/app_cards/package_card/items/frame_ico_line.dart';
import 'package:dallal_proj/core/components/app_cards/package_card/items/price_ico_line.dart';
import 'package:dallal_proj/core/constants/app_texts.dart';
import 'package:dallal_proj/core/widgets/text_widgets/r_text.dart';
import 'package:flutter/material.dart';

class MultiPckgCardItems extends StatelessWidget {
  const MultiPckgCardItems({
    super.key,
    required this.pckgModel,
    required this.cardType,
  });

  final PckgInfEntity pckgModel;
  final PkgCardsDispType cardType;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        RText('$kPackage ${pckgModel.type.name}', cardType.titleStyle),
        const Spacer(flex: 1),
        Image.asset(
          pckgModel.type.img,
          height: cardType.imgSize,
          width: cardType.imgSize,
        ),
        const Spacer(flex: 3),
        PriceIcoLine(
          type: pckgModel.type,
          icoSize: cardType.icoSize,
          style: cardType.detsStyle,
        ),
        const Spacer(flex: 2),
        FrameIcoLine(
          type: pckgModel.type,
          icoSize: cardType.icoSize,
          style: cardType.detsStyle,
        ),
        const Spacer(flex: 3),
      ],
    );
  }
}
