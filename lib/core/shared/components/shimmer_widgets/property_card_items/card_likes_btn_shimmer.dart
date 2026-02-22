import 'package:dallal_proj/core/shared/components/app_btns/models/x_b_size.dart';
import 'package:dallal_proj/core/shared/components/app_btns/tcon_btn.dart';
import 'package:dallal_proj/core/theme/app_colors.dart';

import 'package:dallal_proj/features/details_page/presentation/views/widgets/adv_details_header_sect/i_v_ico.dart';
import 'package:dallal_proj/features/details_page/presentation/views/widgets/adv_details_header_sect/i_v_text.dart';
import 'package:dallal_proj/gen/assets/assets.gen.dart';
import 'package:flutter/material.dart';

class CardLikesBtnShimmer extends StatelessWidget {
  const CardLikesBtnShimmer({
    super.key,
    required this.likesCount,
    required this.isLiked,
    this.radius,
    this.mXAlign,
    required this.btnSize,
  });
  final String likesCount;
  final bool isLiked;
  final double? radius;
  final MainAxisAlignment? mXAlign;
  final XBSize btnSize;

  @override
  Widget build(BuildContext context) {
    return TconBtn(
      btnSize: btnSize,
      onTap: () {},
      radius: radius,
      leftChild: IVIco(
        isActv: isLiked,
        ico: Assets.icons.svg.like20,
        icoActv: Assets.icons.svg.likefilledb,
      ),
      rightChild: IVText(
        txt: likesCount,
        txtColor: kPrimColG,
        txtActvColor: kPrimColB,
        isActv: isLiked,
      ),
    );
  }
}
