import 'package:dallal_proj/core/api/end_points.dart';
import 'package:dallal_proj/core/utils/functions/get_me_data.dart';
import 'package:dallal_proj/features/login_page/data/models/set_profile_req_model.dart';

Map<String, dynamic> setProfileHeaderGetter(UserProfileModel profileModel) {
  var user = getMeData();
  Map<String, dynamic> body = {};
  if (profileModel.profileImage != null &&
      profileModel.profileImage!.isNotEmpty) {
    body.addAll({
      MutualKeys.pfpImg: '${MutualKeys.dataImg64}${profileModel.profileImage}',
    });
  } else {
    body.addAll({MutualKeys.pfpImg: user!.uProfileImage});
  }

  if (profileModel.name != null && profileModel.name!.isNotEmpty) {
    body.addAll({MutualKeys.name: profileModel.name});
  } else {
    body.addAll({MutualKeys.name: user!.uName});
  }

  if (profileModel.whatsapp != null && profileModel.whatsapp!.isNotEmpty) {
    body.addAll({MutualKeys.whatsapp: profileModel.whatsapp});
  } else {
    body.addAll({MutualKeys.whatsapp: user!.uWhatsapp ?? user.uPhone});
  }
  return body;
}
