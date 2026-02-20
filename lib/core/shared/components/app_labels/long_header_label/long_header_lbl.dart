import 'package:dallal_proj/core/shared/components/app_labels/lbl_entity.dart';
import 'package:dallal_proj/core/shared/components/app_labels/long_header_label/long_header_lbl_box.dart';
import 'package:flutter/material.dart';

class LongHeaderLbl extends StatelessWidget {
  const LongHeaderLbl({super.key, this.onTap, required this.lblModel});
  final void Function()? onTap;
  final LblEntity lblModel;
  @override
  Widget build(BuildContext context) {
    return LongHeaderLblBox(
      onTap: onTap,
      decoration: lblModel.deco,
      child: lblModel.lblRow,
    );
  }
}
