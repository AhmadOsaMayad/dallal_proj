import 'package:dallal_proj/core/widgets/helpers/widgets_helper.dart';
import 'package:flutter/material.dart';

class DText extends StatelessWidget {
  const DText({super.key, required this.txt, this.txtAlign, this.style});
  final String txt;
  final TextAlign? txtAlign;
  final TextStyle? style;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Directionality(
        textDirection: WidH.trd,
        child: Text.rich(
          TextSpan(text: txt, style: style),
          textAlign: txtAlign ?? TextAlign.center,
        ),
      ),
    );
  }
}

