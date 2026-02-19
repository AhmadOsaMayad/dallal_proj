import 'package:dallal_proj/core/components/app_btns/models/x_b_size.dart';
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

extension Escalators on BuildContext {
  double respFMQ({required double itmFract}) {
    return itmFract / respMQ();
  }

  double respMQ() {
    double x = (MediaQuery.of(this).size.width);
    double y = (MediaQuery.of(this).size.height);
    return x / y;
  }

  double respWidth({required double fract}) {
    return fract * MediaQuery.of(this).size.width;
  }

  double aspInfWth({required double exWidth}) {
    return respWidth(fract: respInfWp(exWidth));
  }

  double respInfWp(double pads) {
    return (1 - (pads / MediaQuery.of(this).size.width));
  }

  /// takes item's [width] in figma and returns corresponding width
  /// ([getWfract] * [MediaQuery].width)
  double frwGetter(double width) => respWidth(fract: Funcs.getWfract(width));

  double respHieght({required double fract}) {
    return fract * MediaQuery.of(this).size.height;
  }

  /// takes item's [height] in figma and returns corresponding height
  /// ([getHfract] * [MediaQuery].height)
  double frhGetter(double height) => respHieght(fract: Funcs.getHfract(height));
}

extension GetAspRatio on XBSize {
  double aspGetter() => width / height;
}

class Funcs {
  static dynamic pushToAdv(
    BuildContext context,
    ShowDetailsEntity showDetailsEntity, {
    String? to,
  }) {
    return GoRouter.of(
      context,
    ).pushNamed(to ?? AppRouter.kAdvDetailsPage, extra: showDetailsEntity);
  }

  static bool? isLeft(int index) =>
      index == 0
          ? true
          : index == 2
          ? false
          : null;

  // static double respFMQ({
  //   required double itmFract,
  //   required BuildContext context,
  // }) {
  //   return itmFract / respMQ(context: context);
  // }

  // static double respMQ({required BuildContext context}) {
  //   double x = (MediaQuery.of(context).size.width);
  //   double y = (MediaQuery.of(context).size.height);
  //   return x / y;
  // }

  // static double respWidth({
  //   required double fract,
  //   required BuildContext context,
  // }) {
  //   return fract * MediaQuery.of(context).size.width;
  // }

  // static double aspInfWth({
  //   required double exWidth,
  //   required BuildContext context,
  // }) {
  //   return respWidth(fract: respInfWp(exWidth, context), context: context);
  // }

  /// returns relative fraction of width
  /// item [width] in figma ÷ screen width in figma
  static double getWfract(double width) => width / 440;

  /// returns relative fraction of height
  /// item [height] in figma ÷ screen width in figma
  static double getHfract(double height) => height / 956;

  // /// takes item's [width] in figma and returns corresponding width
  // /// ([getWfract] * [MediaQuery].width)
  // static double frwGetter(double width, BuildContext context) =>
  //     respWidth(fract: getWfract(width), context: context);

  // /// takes item's [height] in figma and returns corresponding height
  // /// ([getHfract] * [MediaQuery].height)
  // static double frhGetter(double height, BuildContext context) =>
  //     respHieght(fract: getHfract(height), context: context);

  // static double respInfWp(double pads, BuildContext context) {
  //   return (1 - (pads / MediaQuery.of(context).size.width));
  // }

  // static double aspGetter(XBSize w2h) => w2h.width / w2h.height;

  // static double respHieght({
  //   required double fract,
  //   required BuildContext context,
  // }) {
  //   return fract * MediaQuery.of(context).size.height;
  // }
}
