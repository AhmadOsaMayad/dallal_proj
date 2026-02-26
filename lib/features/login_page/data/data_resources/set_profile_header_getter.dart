import 'package:dallal_proj/core/api/end_points.dart';
import 'package:dallal_proj/core/utils/functions/get_me_data.dart';
import 'package:dallal_proj/core/utils/functions/is_success.dart';
import 'package:dallal_proj/features/login_page/data/models/set_profile_req_model.dart';

Map<String, String> setProfileHeaderGetter(UserProfileModel profileModel) {
  var user = getMeData();
  Map<String, String> body = {};
  if (isNemp(profileModel.profileImage)) {
    body.addAll({
      ApiKeys.pfpImg: '${ApiKeys.dataImg64}${profileModel.profileImage}',
    });
  } else {
    body.addAll({ApiKeys.pfpImg: user!.uProfileImage!});
  }

  if (isNemp(profileModel.name)) {
    body.addAll({ApiKeys.name: profileModel.name!});
  } else {
    body.addAll({ApiKeys.name: user!.uName!});
  }

  if (isNemp(profileModel.whatsapp)) {
    body.addAll({ApiKeys.whatsapp: profileModel.whatsapp ?? user!.uPhone!});
  } else {
    body.addAll({ApiKeys.whatsapp: user!.uWhatsapp ?? user.uPhone!});
  }

  return body;
}
