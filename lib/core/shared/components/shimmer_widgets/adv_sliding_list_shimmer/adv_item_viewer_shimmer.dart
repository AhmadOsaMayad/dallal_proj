import 'package:dallal_proj/core/shared/components/shimmer_widgets/property_card_items/cust_img_holder_shimmer.dart';
import 'package:dallal_proj/core/extensions/escalator.dart';
import 'package:flutter/widgets.dart';

class AdvItemViewerShimmer extends StatelessWidget {
  const AdvItemViewerShimmer({super.key});
  @override
  Widget build(BuildContext context) {
    return CustImgHolderShimmer(
      radius: 12,
      aspect: context.respWidth(fract: 0.85) / context.respWidth(fract: 0.16),
    );
  }
}

          // Funcs.respWidth(fract: 0.85, context: context) /
          // Funcs.respWidth(fract: 0.16, context: context),