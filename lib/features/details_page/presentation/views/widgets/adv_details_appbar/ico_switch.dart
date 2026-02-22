import 'package:dallal_proj/core/common/models/report_sheet_values.dart';
import 'package:dallal_proj/core/shared/components/app_bottom_sheets/log_required_b_s/show_log_required_b_s.dart';

import 'package:dallal_proj/core/shared/components/app_bottom_sheets/filter_b_s/filter_funcs.dart';
import 'package:dallal_proj/core/shared/components/app_btns/svg_btn.dart';
import 'package:dallal_proj/core/shared/components/app_bottom_sheets/report_b_s/report_form.dart';
import 'package:dallal_proj/core/utils/functions/is_accessible_user.dart';
import 'package:dallal_proj/gen/assets/assets.gen.dart';
import 'package:flutter/material.dart';

class IcoSwitch extends StatelessWidget {
  const IcoSwitch({
    super.key,
    this.isOn = false,
    required this.onValuesChanged,
    required this.onSubmit,
    required this.adID,
  });
  final ValueChanged<ReportSheetValues> onValuesChanged;
  final ValueChanged<ReportSheetValues> onSubmit; // NEW
  final String adID;

  final bool isOn;

  @override
  Widget build(BuildContext context) {
    return isOn
        ? SvgBtn(svg: Assets.icons.svg.opts28, onPressed: () {})
        : SvgBtn(
          svg: Assets.icons.svg.warning24,
          onPressed: () {
            if (isAccessibleUser()) {
              Fltr.callBottomSheet(
                context,
                child: ReportForm(
                  adID: adID,
                  onSubmit: onSubmit,
                  onValuesChanged: onValuesChanged,
                ),
              );
            } else {
              showLoginRequiredBottomSheet(context);
            }
          },
        );
  }
}
