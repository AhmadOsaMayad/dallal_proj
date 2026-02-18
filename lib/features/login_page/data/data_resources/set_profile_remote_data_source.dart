import 'package:dallal_proj/core/api/end_points.dart';
import 'package:dallal_proj/core/errors/failure.dart';
import 'package:dallal_proj/core/utils/api.dart';
import 'package:dallal_proj/core/utils/functions/get_me_data.dart';
import 'package:dallal_proj/features/login_page/data/data_resources/set_profile_header_getter.dart';
import 'package:dallal_proj/features/login_page/data/models/set_profile_req_model.dart';

abstract class SetProfileRemoteDataSource {
  Future<UserProfileModel> setProfile(UserProfileModel profileModel);
}

class SetProfileRemoteDataSourceImplement extends SetProfileRemoteDataSource {
  final Api api;
  SetProfileRemoteDataSourceImplement({required this.api});
  @override
  Future<UserProfileModel> setProfile(UserProfileModel profileModel) async {
    try {
      var user = getMeData();
      Map<String, dynamic> body = setProfileHeaderGetter(profileModel);
      var data = await api.patch(
        url: EndPoints.setProfile,
        body: body, //profileModel.toJson(),
        token: user!.uToken,
      );
      UserProfileModel response = UserProfileModel.fromJson(data);
      return response;
    } on FormatException catch (e) {
      throw ParsingFailure("${HttpKeys.invalidJson}: ${e.message}");
    } on Exception catch (e) {
      throw ServerFailure("${HttpKeys.serverErr} ${e.toString()}");
    }
  }
}
