import 'package:dallal_proj/core/extensions/escalator.dart';
import 'package:dallal_proj/core/shared/widgets/helpers/widgets_helper.dart';
import 'package:flutter/material.dart';

class LongHeaderLblBox extends StatelessWidget {
  const LongHeaderLblBox({
    super.key,
    this.onTap,
    required this.child,
    required this.decoration,
  });
  final void Function()? onTap;
  final Decoration decoration;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: WidH.trd,
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          width: context.respWidth(fract: 0.911),
          // Funcs.respWidth(fract: 0.911, context: context),
          height: 50,
          padding: const EdgeInsets.only(left: 4, bottom: 3),
          margin: const EdgeInsets.only(bottom: 10),
          decoration: decoration,
          child: child,
        ),
      ),
    );
  }
}
