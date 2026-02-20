import 'package:dallal_proj/core/extensions/escalator.dart';
import 'package:flutter/material.dart';

class PagePadding extends StatelessWidget {
  const PagePadding({super.key, required this.child, this.fract = 0.1});
  final Widget child;
  final double fract;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: context.respWidth(fract: fract),
      ),
      child: child,
    );
  }
}

// Funcs.respWidth(fract: fract, context: context),
