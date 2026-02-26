import 'package:dallal_proj/core/api/end_points.dart';
import 'package:dallal_proj/core/utils/functions/get_me_data.dart';
import 'package:dallal_proj/core/utils/functions/is_success.dart';
import 'package:dio/dio.dart';

class DioInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    var user = getMeData();
    options.contentType = HttpKeys.xwContentType;
    if (user != null && isntNull(user.uToken)) {
      options.headers[HttpKeys.auth] = '${HttpKeys.bearer} ${user.uToken}';
    }
    super.onRequest(options, handler);
  }
}
