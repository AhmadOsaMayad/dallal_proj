import 'package:dallal_proj/core/utils/app_funcs.dart';
import 'package:flutter/material.dart';

class ShortHeaderLblBox extends StatelessWidget {
  const ShortHeaderLblBox({
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
    return Align(
      alignment: Alignment.centerRight,
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          width: context.respWidth(
            fract: 0.384,
          ), //Funcs.respWidth(fract: 0.384, context: context),
          height: 33,
          padding: const EdgeInsets.only(left: 4, bottom: 3),
          margin: const EdgeInsets.only(right: 4),
          decoration: decoration,
          child: child,
        ),
      ),
    );
  }
}
