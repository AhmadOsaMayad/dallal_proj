import 'package:dallal_proj/core/api/end_points.dart';
import 'package:dallal_proj/core/constants/app_texts.dart';
import 'package:dallal_proj/features/login_page/domain/entities/loggedin_user_entity.dart';

class UserData extends LoggedinUserEntity {
  String? token;
  String? userId;
  String? name;
  String? phone;
  String? whatsapp;
  String? profileImage;
  String? createdAt;

  UserData({
    this.token,
    this.userId,
    this.name,
    this.phone,
    this.whatsapp,
    this.profileImage,
    this.createdAt,
  }) : super(
         uName: name,
         uPhone: phone,
         uToken: token,
         uId: userId,
         uProfileImage: profileImage,
         uWhatsapp: whatsapp,
       );

  factory UserData.fromJson(Map<String, dynamic> json) => UserData(
    token: json[ApiKeys.token] as String?,
    userId: json[ApiKeys.userId] as String?,
    name: json[ApiKeys.name] as String?,
    phone: json[ApiKeys.phone] as String?,
    whatsapp: json[ApiKeys.whatsapp] as String?,
    profileImage:
        (json[ApiKeys.pfpImg] is String?)
            ? (json[ApiKeys.pfpImg] != null)
                ? ((json[ApiKeys.pfpImg] as String).contains(kUserProfsPath))
                    ? json[ApiKeys.pfpImg]
                    : "$kUserProfsNfilePath${json[ApiKeys.pfpImg]}"
                : null
            : null,
    createdAt: json[ApiKeys.createdAt] as String?,
  );
  String? handleUserProfile(String? userProfile) {
    if (userProfile != null) {
      if (userProfile.contains(kUserProfsPath)) {
        return userProfile;
      } else {
        return "$kUserProfsNfilePath$userProfile";
      }
    }
    return userProfile;
  }

  Map<String, dynamic> toJson() => {
    ApiKeys.token: token,
    ApiKeys.userId: userId,
    ApiKeys.name: name,
    ApiKeys.phone: phone,
    ApiKeys.whatsapp: whatsapp,
    ApiKeys.pfpImg: profileImage,
    ApiKeys.createdAt: createdAt,
  };
}
