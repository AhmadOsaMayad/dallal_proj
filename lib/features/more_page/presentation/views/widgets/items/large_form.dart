import 'package:dallal_proj/features/more_page/presentation/views/constants.dart';
import 'package:dallal_proj/core/utils/app_router.dart';
import 'package:dallal_proj/core/widgets/helpers/widgets_helper.dart';
import 'package:dallal_proj/features/more_page/presentation/views/widgets/items/box_holder.dart';
import 'package:dallal_proj/features/more_page/presentation/views/widgets/items/form_bars.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class LargeForm extends StatelessWidget {
  const LargeForm({super.key});

  @override
  Widget build(BuildContext context) {
    final sPace = WidH.respSep(context, fract: 1);
    return BoxHolder(
      fixedSizeFraction: kMLFormFractMedium,
      aspect: kMFormWidthMedium / kMLFormHeight,
      children: [
        FBars.aboutUs(() {}),
        sPace,
        FBars.prvNpoltcs(() {}),
        sPace,
        FBars.condUsing(() {}),
        sPace,
        FBars.contactUs(() {
          GoRouter.of(context).push(AppRouter.kContactUsPage);
        }),
        sPace,
        FBars.rateUs(() {}),
        sPace,
        FBars.shareApp(() {}),
        sPace,
        FBars.appVersion(() {}),
      ],
    );
  }
}
