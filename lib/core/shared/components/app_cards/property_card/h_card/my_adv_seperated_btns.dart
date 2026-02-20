import 'package:dallal_proj/core/shared/components/app_bottom_sheets/log_required_b_s/show_log_required_b_s.dart';
import 'package:dallal_proj/core/shared/components/app_cards/property_card/items/property_card_helper.dart';
import 'package:dallal_proj/core/constants/app_texts.dart';
import 'package:dallal_proj/core/extensions/push_navigator.dart';
import 'package:dallal_proj/core/extensions/escalator.dart';
import 'package:dallal_proj/core/utils/app_router.dart';
import 'package:dallal_proj/core/shared/components/app_cards/property_card/items/card_btns/card_seperated_btns_box.dart';
import 'package:dallal_proj/core/shared/components/app_cards/property_card/h_card/pending_btn.dart';
import 'package:dallal_proj/core/shared/components/app_cards/property_card/h_card/refused_btn.dart';
import 'package:dallal_proj/core/utils/functions/get_me_data.dart';
import 'package:dallal_proj/features/details_page/domain/entities/show_details_entity.dart';
import 'package:dallal_proj/features/my_account_page/data/models/delete_adv_req_model.dart';
import 'package:dallal_proj/features/my_account_page/presentation/manager/delete_adv_cubit/delete_adv_cubit.dart';
import 'package:dallal_proj/features/my_account_page/presentation/manager/user_profile_cubit/user_profile_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class MyAdvSeperatedBtns extends StatelessWidget {
  const MyAdvSeperatedBtns({super.key, required this.detailsEntity});
  final ShowDetailsEntity detailsEntity;

  @override
  Widget build(BuildContext context) {
    bool isn(var value) => value != null ? true : false;
    void deleteAdv() {
      var user = getMeData();
      BlocProvider.of<DeleteAdvCubit>(context).deleteAdv(
        DeleteAdvReqModel(adID: detailsEntity.advId, token: user!.uToken!),
      );
    }

    Future<dynamic> refreshAdvs() async {
      var user = getMeData();
      BlocProvider.of<UserProfileCubit>(context).fetchUserProfile(user!.uToken);
    }

    Future<dynamic> editedAdv() async {
      var result = await GoRouter.of(
        context,
      ).push(AppRouter.kEditAdvPage, extra: detailsEntity);
      return result;
    }

    Future<void> editHandler(
      result,
      void Function() deleteAdv,
      Future<dynamic> Function() editedAdv,
      Future<dynamic> Function() refreshAdvs,
    ) async {
      if (isn(result)) {
        if (result) {
          deleteAdv();
        } else if (!result) {
          var editResult = await editedAdv();
          if (isn(editResult)) {
            if (editResult) {
              refreshAdvs();
            }
          }
        }
      } else {
        debugPrint(kNullResult);
      }
    }

    return SeperatedBtnsBox(
      rMXAlign: MainAxisAlignment.center,
      children:
          (detailsEntity.advStatus == true)
              ? PCardH.normalAdvBtns(
                () => context.navToAdv(detailsEntity),
                //Funcs.pushToAdv(context, detailsEntity),
                () async {
                  var confirm = await showConfBS(
                    context,
                    kSureAboutDelHead,
                    kSureAboutDelSub,
                  );
                  if (isn(confirm) && confirm is bool) {
                    if (confirm) {
                      deleteAdv();
                    }
                  }
                }, //deleteOnTap
                () async {
                  var result = await editedAdv();
                  if (isn(result)) {
                    if (result) {
                      refreshAdvs();
                    }
                  }
                }, //editOnTap
              )
              : (detailsEntity.advStatus == null)
              ? [
                PendingBtn(
                  onTap: () => context.navToAdv(detailsEntity),
                  //Funcs.pushToAdv(context, detailsEntity),
                ),
              ]
              : [
                RefusedBtn(
                  onTap: () async {
                    var result = await context.navTo(
                      AppRouter.kAdvRefusedPage,
                      detailsEntity,
                    );
                    // await Funcs.pushToAdv(
                    //   context,
                    //   detailsEntity,
                    //   to: AppRouter.kAdvRefusedPage,
                    // );
                    await editHandler(
                      result,
                      deleteAdv,
                      editedAdv,
                      refreshAdvs,
                    );
                  },
                ),
              ],
    );
  }
}
