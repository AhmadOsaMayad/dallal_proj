import 'package:dallal_proj/features/more_page/presentation/views/constants.dart';
import 'package:dallal_proj/core/components/app_bottom_sheets/log_required_b_s/show_log_required_b_s.dart';
import 'package:dallal_proj/core/constants/app_texts.dart';
import 'package:dallal_proj/core/utils/app_router.dart';
import 'package:dallal_proj/core/utils/functions/delete_user_login_data.dart';
import 'package:dallal_proj/core/utils/functions/get_me_data.dart';
import 'package:dallal_proj/core/utils/functions/is_loggedin.dart';
import 'package:dallal_proj/core/utils/functions/save_advs_list.dart';
import 'package:dallal_proj/core/widgets/helpers/widgets_helper.dart';
import 'package:dallal_proj/features/more_page/presentation/delete_account_cubit/delete_account_cubit.dart';
import 'package:dallal_proj/features/more_page/presentation/views/widgets/items/box_holder.dart';
import 'package:dallal_proj/features/more_page/presentation/views/widgets/items/form_bars.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class SmallForm extends StatelessWidget {
  const SmallForm({super.key});

  @override
  Widget build(BuildContext context) {
    final sPace = WidH.respSep(context, fract: 1);
    void logOut() {
      deleteAdvsList(kFeaturedAdvBox);
      deleteAdvsList(kAllAdvBox);
      deleteUserLoginData();
      context.go(AppRouter.kPreRegisterPage);
    }

    void delAcc() {
      BlocProvider.of<DeleteAccountCubit>(context).deleteAccount();
    }

    return BoxHolder(
      fixedSizeFraction: kMSFormFractMedium,
      aspect: kMFormWidthMedium / kMSFormHeight,
      children: [
        FBars.changePass(() {
          var user = getMeData();
          if (isLoggedin(user)) {
            GoRouter.of(context).push(AppRouter.kChangePassPage);
          } else {
            showLoginRequiredBottomSheet(context);
          }
        }),
        sPace,
        FBars.logOut(() async {
          bool? confirm = await showConfBS(
            context,
            ' هل ترغب بتسجيل الخروج من حسابك الآن؟',
            'سيتم إعادتك إلى شاشة البداية ولن تتمكن من التفاعل كمستخدم حتى تسجيل الدخول مرة أخرى.',
          );
          if (confirm != null) {
            logOut();
            if (confirm) {}
          }
        }),
        sPace,
        FBars.delAcc(() async {
          var user = getMeData();
          if (isLoggedin(user)) {
            bool? confirm = await showConfBS(
              context,
              ' هل ترغب بحذف حسابك نهائياً؟',
              'سيتم حذف جميع بياناتك ولن تتمكن من استرجاعها مرة أخرى.',
            );

            if (confirm != null) {
              if (confirm) {
                delAcc();
              }
            }
          } else {
            showLoginRequiredBottomSheet(context);
          }
        }),
      ],
    );
  }
}
