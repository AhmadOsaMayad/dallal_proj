import 'package:dallal_proj/core/extensions/escalator.dart';
import 'package:dallal_proj/gen/assets/assets.gen.dart';

import 'package:flutter/material.dart';

class DeskMapImg extends StatelessWidget {
  const DeskMapImg({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.respWidth(fract: 0.17),
      // Funcs.respWidth(fract: 0.17, context: context),
      child: ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(8)),
        child: AspectRatio(
          aspectRatio: 1.505,
          child: Image.asset(
            Assets.images.jpg.map.path,
            fit: BoxFit.fill,
            alignment: Alignment.center,
          ),
        ),
      ),
    );
  }
}
