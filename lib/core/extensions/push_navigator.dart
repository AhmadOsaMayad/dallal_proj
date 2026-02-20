import 'package:dallal_proj/core/utils/app_router.dart';
import 'package:dallal_proj/features/details_page/domain/entities/show_details_entity.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

extension PushNavigator on BuildContext {
  navToAdv(ShowDetailsEntity showDetailsEntity) {
    return GoRouter.of(
      this,
    ).pushNamed(AppRouter.kAdvDetailsPage, extra: showDetailsEntity);
  }

  navTo(String to, ShowDetailsEntity showDetailsEntity) {
    return GoRouter.of(this).pushNamed(to, extra: showDetailsEntity);
  }
}
