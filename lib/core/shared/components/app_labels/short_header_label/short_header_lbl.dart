import 'package:dallal_proj/core/shared/components/app_labels/lbl_entity.dart';
import 'package:dallal_proj/core/shared/components/app_labels/short_header_label/short_header_lbl_box.dart';
import 'package:flutter/material.dart';

class ShortHeaderLbl extends StatelessWidget {
  const ShortHeaderLbl({super.key, this.onTap, required this.lblModel});
  final void Function()? onTap;
  final LblEntity lblModel;
  @override
  Widget build(BuildContext context) {
    return ShortHeaderLblBox(
      decoration: lblModel.deco,
      onTap: onTap,
      child: lblModel.lblRow,
    );
  }
}
