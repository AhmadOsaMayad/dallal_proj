import 'package:dallal_proj/features/details_page/domain/entities/show_details_entity.dart';
import 'package:dallal_proj/features/details_page/presentation/views/widgets/adv_refused_body_items/header_attatch_text.dart';
import 'package:dallal_proj/features/details_page/presentation/views/widgets/adv_refused_body_items/header_text.dart';
import 'package:dallal_proj/features/details_page/presentation/views/widgets/adv_refused_body_items/refusal_msg.dart';
import 'package:dallal_proj/features/details_page/presentation/views/widgets/adv_refused_body_items/text_clarify.dart';
import 'package:dallal_proj/features/details_page/presentation/views/widgets/bottom_sheet_btns.dart';

import 'package:dallal_proj/core/extensions/escalator.dart';
import 'package:dallal_proj/core/shared/widgets/svg_ico.dart';
import 'package:dallal_proj/gen/assets/assets.gen.dart';
import 'package:flutter/material.dart';

class AdvRefusedBody extends StatelessWidget {
  const AdvRefusedBody({super.key, required this.detailsEntity});
  final ShowDetailsEntity detailsEntity;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SizedBox(
        height: context.respHieght(fract: 0.85),
        // Funcs.respHieght(fract: 0.85, context: context),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Spacer(flex: 2),
            SvgIco(ico: Assets.icons.svg.refused131o25, wth: 126.6, ht: 126.6),
            const Spacer(flex: 1),
            const HeaderText(),
            const Spacer(flex: 2),
            const HeaderAttatchText(),
            const Spacer(flex: 2),
            RefusalMsg(refuseReason: detailsEntity.refuseReason),

            const Spacer(flex: 10),
            const TextClarify(),
            const Spacer(flex: 2),
            BottomSheetBtns(
              rBtnTxt: 'حذف الإعلان',
              lBtnTxt: 'تعديل الإعلان',
              onTapR: () {
                Navigator.of(context).pop(true);
              },
              onTapL: () {
                Navigator.of(context).pop(false);
              },
            ),
            const Spacer(flex: 2),
          ],
        ),
      ),
    );
  }
}
