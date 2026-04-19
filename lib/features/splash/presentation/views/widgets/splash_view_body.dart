import 'package:dallal_proj/core/utils/app_router.dart';

import 'package:dallal_proj/core/utils/functions/get_me_data.dart';
import 'package:dallal_proj/core/utils/functions/is_loggedin.dart';
import 'package:dallal_proj/core/shared/widgets/symmetric_pads/v_p_item.dart';
import 'package:dallal_proj/core/shared/widgets/two_item_widgets/two_itm_col.dart';
import 'package:dallal_proj/features/splash/presentation/views/widgets/sliding_text.dart';
import 'package:dallal_proj/gen/assets/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<Offset> slidingAnimation;

  @override
  void initState() {
    super.initState();
    initSlidingAnimation();
    navigateToHome();
  }

  @override
  Widget build(BuildContext context) {
    return TwoItmCol(
      mXAlign: MainAxisAlignment.center,
      cXAlign: CrossAxisAlignment.stretch,
      topChild: VPItem(
        bSpc: 5,
        child: Image.asset(
          Assets.icons.png.bLogo.path,
          width: 236,
          height: 236,
        ),
      ),
      btmChild: SlidingText(slidingAnimation: slidingAnimation),
    );
  }

  void initSlidingAnimation() {
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );
    slidingAnimation = Tween<Offset>(
      begin: const Offset(0, 2),
      end: Offset.zero,
    ).animate(animationController);
    animationController.forward();
  }

  void navigateToHome() {
    Future.delayed(const Duration(seconds: 5), () {
      if (!mounted) return;
      isLoggedin(getMeData())
          ? GoRouter.of(context).go(AppRouter.kMainPage)
          : GoRouter.of(context).go(AppRouter.kPreviewPage);
    });
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }
}
