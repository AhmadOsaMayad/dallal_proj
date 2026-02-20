import 'package:dallal_proj/core/shared/components/app_cards/package_card/entities/package_cards_display_type.dart';
import 'package:dallal_proj/core/shared/components/app_cards/package_card/entities/package_entity.dart';
import 'package:dallal_proj/core/shared/components/app_cards/package_card/multi_package_card_items.dart';
import 'package:dallal_proj/core/shared/components/app_cards/package_card/items/package_card_box.dart';
import 'package:dallal_proj/core/shared/components/app_cards/package_card/single_package_card_items.dart';
import 'package:flutter/material.dart';

class PckgCard extends StatelessWidget {
  const PckgCard({
    super.key,
    required this.cWidth,
    required this.pckgModel,
    this.cardType = PkgCardsDispType.multi,
    this.onTap,
  });
  final PckgInfEntity pckgModel;
  final PkgCardsDispType cardType;
  final double cWidth;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    final bool isSingle = cardType == PkgCardsDispType.single;
    return PckgCardBox(
      onTap: onTap,
      padding: cardType.padding,
      cWidth: cWidth,
      child:
          isSingle
              ? SinglePckgCardItems(pckgModel: pckgModel, cardType: cardType)
              : MultiPckgCardItems(pckgModel: pckgModel, cardType: cardType),
    );
  }
}
