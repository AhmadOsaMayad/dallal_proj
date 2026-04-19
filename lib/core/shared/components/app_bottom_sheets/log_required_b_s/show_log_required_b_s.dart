import 'package:dallal_proj/core/shared/components/app_bottom_sheets/bottom_sheet_holder.dart';
import 'package:dallal_proj/core/shared/components/app_bottom_sheets/filter_b_s/filter_funcs.dart';
import 'package:dallal_proj/core/shared/components/app_btns/col_btn.dart';
import 'package:dallal_proj/core/shared/components/app_btns/white_btn.dart';
import 'package:dallal_proj/core/theme/app_colors.dart';
import 'package:dallal_proj/core/utils/app_router.dart';

import 'package:dallal_proj/core/shared/widgets/svg_ico.dart';
import 'package:dallal_proj/core/shared/widgets/symmetric_pads/v_p_item.dart';
import 'package:dallal_proj/core/shared/widgets/text_widgets/r_text.dart';
import 'package:dallal_proj/gen/assets/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

void showLoginRequiredBottomSheet(BuildContext context) {
  Fltr.callBottomSheet(
    context,
    child: BSFormHolder(
      form: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 40),
            child: Center(
              child: RText(
                'عذراً يجب عليك تسجيل الدخول أولاً للتفاعل مع التطبيق والتمتع بكافة خدماته',
                TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  height: 2.30,
                ),
                tOvrFlw: TextOverflow.visible,
                txtAlign: TextAlign.center,
              ),
            ),
          ),
          VPItem(
            bSpc: 30,
            child: SizedBox(
              height: 50,
              child: ColBtn(
                txt: 'الذهاب لصفحة تسجيل الدخول',
                onPressed: () {
                  context.go(AppRouter.kLoginPage);
                },
              ),
            ),
          ),
        ],
      ),
    ),
  );
}

Future<bool?> showConfBS(
  BuildContext context,
  String messageH1,
  String? messageH2,
) async {
  return await showModalBottomSheet(
    useSafeArea: false,
    backgroundColor: kWhite,
    isScrollControlled: true,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
    context: Navigator.of(context, rootNavigator: true).context, //context,
    builder:
        (context) => BSFormHolder(
          form: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [SvgIco(ico: Assets.icons.svg.confbadge40)],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 8.0,
                  vertical: 10,
                ),
                child: RText(
                  messageH1,
                  const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    height: 1.30,
                  ),
                  tOvrFlw: TextOverflow.visible,
                  txtAlign: TextAlign.right,
                ),
              ),
              if (messageH2 != null)
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10.0,
                    vertical: 10,
                  ),
                  child: RText(
                    messageH2,
                    const TextStyle(
                      fontSize: 14,
                      color: Color(0xFF616060),
                      height: 1.30,
                    ),
                    tOvrFlw: TextOverflow.visible,
                    txtAlign: TextAlign.right,
                  ),
                ),
              VPItem(
                tSpc: 15,
                bSpc: 15,
                child: SizedBox(
                  height: 50,
                  child: ColBtn(
                    color: kRed38,
                    txt: 'نعم',
                    onPressed: () {
                      // result = true;
                      GoRouter.of(context).pop(true);
                    },
                  ),
                ),
              ),
              VPItem(
                bSpc: 30,
                child: SizedBox(
                  height: 50,
                  child: WhiteBtn(
                    txt: 'لا',
                    onPressed: () {
                      // result = false;
                      GoRouter.of(context).pop();
                    },
                  ),
                ),
              ),
            ],
          ),
        ),

    sheetAnimationStyle: AnimationStyle(
      duration: const Duration(milliseconds: 500),
      reverseDuration: const Duration(milliseconds: 500),
    ),
  );
}
