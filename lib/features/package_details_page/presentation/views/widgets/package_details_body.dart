import 'package:dallal_proj/core/enums/package_cards_display_type.dart';
import 'package:dallal_proj/core/shared/components/app_cards/package_card/entities/package_entity.dart';
import 'package:dallal_proj/core/shared/components/app_cards/package_card/package_card.dart';
import 'package:dallal_proj/core/constants/app_texts.dart';
import 'package:dallal_proj/core/extensions/escalator.dart';
import 'package:dallal_proj/core/shared/widgets/helpers/widgets_helper.dart';
import 'package:dallal_proj/core/shared/widgets/text_widgets/body_text.dart';
import 'package:dallal_proj/core/shared/widgets/text_widgets/right_main_title.dart';
import 'package:dallal_proj/temp_try.dart';
import 'package:flutter/cupertino.dart';

class PackageDetailsBody extends StatelessWidget {
  const PackageDetailsBody({super.key, required this.package});
  final PckgInfEntity package;

  @override
  Widget build(BuildContext context) {
    final double cSize = context.respWidth(fract: 0.75);
    // final double cSize = Funcs.respWidth(fract: 0.75, context: context);
    return Column(
      children: [
        const Spacer(flex: 2),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 12.0),
          child: RightMainTitle(text: kUrAdvIsFeatured),
        ),
        const Spacer(flex: 1),
        const Align(
          alignment: Alignment.centerRight,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 12.0),
            child: BodyTxt(tAln: WidH.tra, text: kUrPckgIs),
          ),
        ),
        const Spacer(),
        AspectRatio(
          aspectRatio: cSize / 425,
          child: PckgCard(
            cWidth: cSize,
            pckgModel: package,
            cardType: PkgCardsDispType.single,
          ),
        ),
        const Spacer(flex: 7),
      ],
    );
  }
}
