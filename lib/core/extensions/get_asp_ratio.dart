import 'package:dallal_proj/core/shared/components/app_btns/models/x_b_size.dart';

extension GetAspRatio on XBSize {
  double aspGetter() => width / height;
}
