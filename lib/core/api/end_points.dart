class EndPoints {
  static String baseUrl = 'https://dalal.ghassanalmoqbeli.com/api-app/api/';
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
  static String status = MutualKeys.status;
  static String errMsg = MutualKeys.errMsg;
}

class MutualKeys {
  static String status = 'status';
  static String errMsg = 'message';
}

class DioKeys {
  static String status = MutualKeys.status;
  static String errMsg = MutualKeys.errMsg;
}
