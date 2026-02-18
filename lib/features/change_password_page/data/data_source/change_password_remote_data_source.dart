import 'package:dallal_proj/core/api/end_points.dart';
import 'package:dallal_proj/core/errors/failure.dart';
import 'package:dallal_proj/core/utils/api.dart';
import 'package:dallal_proj/core/common/models/rsp_auth.dart';
import 'package:dallal_proj/features/change_password_page/data/models/change_pass_req_model.dart';

abstract class ChangePasswordRemoteDataSource {
  Future<RspAuth> changePassword(ChangePassReqModel changePassModel);
}

class ChangePasswordRemoteDataSourceImplement
    extends ChangePasswordRemoteDataSource {
  final Api api;

  ChangePasswordRemoteDataSourceImplement({required this.api});
  @override
  Future<RspAuth> changePassword(ChangePassReqModel changePassModel) async {
    try {
      var data = await api.put(
        url: EndPoints.changePass,
        body: changePassModel.toJson(),
        token: changePassModel.token,
      );
      RspAuth responseRemote = RspAuth.fromJson(data);
      return responseRemote;
    } on FormatException catch (e) {
      throw ParsingFailure("${HttpKeys.invalidJson}: ${e.message}");
    } on Exception catch (e) {
      throw ServerFailure("${HttpKeys.serverErr} ${e.toString()}");
    }
  }
}
