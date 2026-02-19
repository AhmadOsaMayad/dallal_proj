import 'package:dallal_proj/core/constants/app_texts.dart';
import 'package:dallal_proj/core/theme/app_font_styles_colorer.dart';
import 'package:dallal_proj/core/utils/app_funcs.dart';
import 'package:dallal_proj/core/theme/app_font_styles.dart';
import 'package:flutter/material.dart';

class SpecialPropsTextWid extends StatelessWidget {
  const SpecialPropsTextWid({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: context.respHieght(fract: 0.0355),
        // Funcs.respHieght(fract: 0.0355, context: context),
        right: context.respWidth(
          fract: 0.0545,
        ), //Funcs.respWidth(fract: 0.0545, context: context),
        bottom: context.respHieght(fract: 0.0177),
        // Funcs.respHieght(fract: 0.0177, context: context),
      ),
      child: Text(kSpecialProps, style: FsC.htStyle(FStyles.s18w6, 1.3)),
    );
  }
}
