import 'package:dallal_proj/core/constants/app_defs.dart';

class EndPoints {
  static String baseUrl = kDomainApp;
  static String token = 'token';
  static String login = 'user/login.php';
}

class HttpKeys {
  static String contentTypeK = 'Content-Type';
  static String xwContentType = 'application/x-www-form-urlencoded';
  static String auth = 'Authorization';
  static String bearer = 'Bearer';
  static String respIsntJson = 'Response is not valid JSON:';
  static String reqFailedWithStatus = 'Request failed with StatusCode';
}

class DioKeys {
  static String status = 'status';
  static String errMsg = 'errorMessage';
}
