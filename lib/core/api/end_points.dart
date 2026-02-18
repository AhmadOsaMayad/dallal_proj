class EndPoints {
  static String baseUrl = 'https://dalal.ghassanalmoqbeli.com/api-app/api/';
  static String token = 'token';
  static String login = 'user/login.php';
  static String register = 'user/register.php';
  static String changePass = 'user_profile/change_password.php';
  static String createAdv = 'ad/create_ad.php';
  static String reportAdv = 'ad/report_ad.php';
  static String faveAdv = 'ad/add_favorite.php';
  static String unfaveAdv = 'ad/remove_favorite.php?ad_id=';
  static String likeAdv = 'ad/like_ad.php';
  static String unlikeAdv = 'ad/unlike_ad.php?ad_id=';
  static String updateAdv = 'ad/update_ad.php';
  static String createMedia = 'ad/create_ad_media.php';
  static String deleteMedia = 'ad/delete_ad_media.php?media_id=';
  static String activatePkg = 'package/activate_package.php';
  static String fetchAllAdvs = 'ad/list_all_ads.php';
  static String fetchFeaturedAdvs = 'ad/list_featured_ads.php';
  static String fetchAllBanners = 'banner/get_banners.php';
  static String setProfile = 'user_profile/update_user_profile.php';
  static String getProfile = 'user_profile/get_user_profile.php';
  static String deleteAcc = 'user/request_delete_account.php';
  static String deleteAdv = 'ad/delete_ad.php?id=';
  static String fetchNotifications = 'notification/get_notifications.php?';
  static String getUnreadNotifications = 'notification/unread_count.php';
  static String markAsRead = 'notification/mark_as_read.php';
  static String getPkgInfo = 'package/check_package_expiry.php?ad_id=';
  static String resetPass = 'user/forgot_password.php';
  static String searchFilter = 'search_and_filter/search_and_filter_ads.php?';
  static String fetchApts = '${MutualKeys.propType}${searchFilter}apartment';
  static String fetchHouses = '${MutualKeys.propType}${searchFilter}house';
  static String fetchLands = '${MutualKeys.propType}${searchFilter}land';
  static String fetchShops = '${MutualKeys.propType}${searchFilter}shop';
  static String resendMsg = 'user/resend_otp_code.php';
  static String getMsg = 'user/get_otp.php';
  static String verifyMsg = 'user/verify_otp.php';
}

class HttpKeys {
  static String contentTypeK = 'Content-Type';
  static String xwContentType = 'application/x-www-form-urlencoded';
  static String auth = 'Authorization';
  static String bearer = 'Bearer';
  static String respIsntJson = 'Response is not valid JSON:';
  static String invalidJson = "Invalid Json format";
  static String serverErr = "Server Error";
  static String reqFailedWithStatus = 'Request failed with StatusCode';
  static String status = MutualKeys.status;
  static String errMsg = MutualKeys.errMsg;
}

class MutualKeys {
  static String status = 'status';
  static String errMsg = 'message';
  static String pfpImg = 'profile_image';
  static String name = 'name';
  static String phone = 'phone';
  static String whatsapp = 'whatsapp';
  static String dataImg64 = 'data:image/jpg;base64,';
  static String propType = 'property_type=';
}

class DioKeys {
  static String status = MutualKeys.status;
  static String errMsg = MutualKeys.errMsg;
}
