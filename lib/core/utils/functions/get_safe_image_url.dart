import 'package:dallal_proj/core/utils/functions/safe_merge_url.dart';

String getSafeImageUrl(String? suffix) {
  final url = safeMergeUrl(suffix);
  if (!(url.startsWith('http'))) {
    return '';
  }
  return url;
}
