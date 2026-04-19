import 'package:dallal_proj/core/shared/widgets/svg_ico.dart';
import 'package:dallal_proj/core/shared/widgets/symmetric_pads/h_p_item.dart';
import 'package:dallal_proj/core/shared/widgets/two_item_widgets/two_itm_row.dart';
import 'package:flutter/material.dart';

class RightIcoLine extends StatelessWidget {
  const RightIcoLine({
    super.key,
    required this.text,
    required this.icoPath,
    required this.style,
    this.icoHt,
    this.icoWth,
    required this.color,
  });
  final String text, icoPath;
  final TextStyle style;
  final double? icoHt, icoWth;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return TwoItmRow(
      mXAlign: MainAxisAlignment.end,
      leftChild: HPItem(
        rSpc: 5,
        child: Text(
          text,
          style: style,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
      ),
      rightChild: SvgIco(
        ico: icoPath,
        ht: icoHt ?? 13,
        wth: icoWth ?? 13,
        color: color,
      ),
    );
  }
}
