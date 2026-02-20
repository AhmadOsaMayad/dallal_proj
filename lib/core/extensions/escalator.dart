import 'package:dallal_proj/core/utils/app_funcs.dart';
import 'package:flutter/material.dart';

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
