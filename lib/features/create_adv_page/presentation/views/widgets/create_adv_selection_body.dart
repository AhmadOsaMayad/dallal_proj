import 'package:dallal_proj/core/shared/components/app_cards/selection_cards/create_adv_selection_cards/cr_adv_cell_card.dart';
import 'package:dallal_proj/core/shared/components/app_cards/selection_cards/items/body_cell_cards.dart';
import 'package:dallal_proj/core/shared/components/app_cards/selection_cards/section_card_entity.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CreateAdvSelectionBody extends StatelessWidget {
  const CreateAdvSelectionBody({
    super.key,
    required this.topLCell,
    required this.topRCell,
    required this.btmLCell,
    required this.btmRCell,
  });
  final SectCardEntity topLCell, topRCell, btmLCell, btmRCell;
  @override
  Widget build(BuildContext context) {
    return BodyCellCards(
      topLeft: CrAdvCellCard(
        name: topLCell.name,
        img: topLCell.img,
        onTap:
            () => GoRouter.of(
              context,
            ).pushNamed(topLCell.routePath, extra: topLCell.pTitle),
      ),
      topRight: CrAdvCellCard(
        name: topRCell.name,
        img: topRCell.img,
        onTap:
            () => GoRouter.of(
              context,
            ).pushNamed(topRCell.routePath, extra: topRCell.pTitle),
      ),
      bottomLeft: CrAdvCellCard(
        name: btmLCell.name,
        img: btmLCell.img,
        onTap:
            () => GoRouter.of(
              context,
            ).pushNamed(btmLCell.routePath, extra: btmLCell.pTitle),
      ),
      bottomRight: CrAdvCellCard(
        name: btmRCell.name,
        img: btmRCell.img,
        onTap:
            () => GoRouter.of(
              context,
            ).pushNamed(btmRCell.routePath, extra: btmRCell.pTitle),
      ),
    );
  }
}
