import 'package:dallal_proj/core/constants/app_defs.dart';
import 'package:dallal_proj/core/utils/functions/remove_api_app.dart';

String safeMergeUrl(String? suffix) {
  if (suffix == null || suffix.isEmpty) return kDomainApp;
  try {
    var newSuffix = removeApiApp(suffix);
    var resq = Uri.parse(kDomainApp).resolve(newSuffix).toString();
    return resq;
  } catch (e) {
    return '$kDomainApp${suffix.startsWith('/') ? suffix : '/$suffix'}';
  }
}
