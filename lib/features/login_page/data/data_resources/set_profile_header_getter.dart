import 'package:dallal_proj/core/api/end_points.dart';
import 'package:dallal_proj/core/utils/functions/get_me_data.dart';
import 'package:dallal_proj/features/login_page/data/models/set_profile_req_model.dart';

Map<String, dynamic> setProfileHeaderGetter(UserProfileModel profileModel) {
  var user = getMeData();
  Map<String, dynamic> body = {};
  if (profileModel.profileImage != null &&
      profileModel.profileImage!.isNotEmpty) {
    body.addAll({
      ApiKeys.pfpImg: '${ApiKeys.dataImg64}${profileModel.profileImage}',
    });
  } else {
    body.addAll({ApiKeys.pfpImg: user!.uProfileImage});
  }

  if (profileModel.name != null && profileModel.name!.isNotEmpty) {
    body.addAll({ApiKeys.name: profileModel.name});
  } else {
    body.addAll({ApiKeys.name: user!.uName});
  }

  if (profileModel.whatsapp != null && profileModel.whatsapp!.isNotEmpty) {
    body.addAll({ApiKeys.whatsapp: profileModel.whatsapp});
  } else {
    body.addAll({ApiKeys.whatsapp: user!.uWhatsapp ?? user.uPhone});
  }
  return body;
}
