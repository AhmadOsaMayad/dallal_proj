import 'package:dallal_proj/core/api/end_points.dart';
import 'package:dallal_proj/core/api/http_api/http_consumer.dart';
import 'package:dallal_proj/core/errors/failure.dart';
import 'package:dallal_proj/core/utils/functions/save_user_data.dart';
import 'package:dallal_proj/features/login_page/data/models/login_req_model.dart';
import 'package:dallal_proj/features/login_page/data/models/login_response_model/login_rsp_model.dart';

abstract class LoginRemoteDataSource {
  Future<LoginRspModel> loginUser(LoginReqModel loginModel);
}

class LoginRemoteDataSourceImplement extends LoginRemoteDataSource {
  final HttpConsumer api;

  LoginRemoteDataSourceImplement(this.api);
  @override
  Future<LoginRspModel> loginUser(LoginReqModel loginModel) async {
    try {
      var data = await api.post(EndPoints.login, data: loginModel.toJson());
      LoginRspModel response = LoginRspModel.fromJson(data);
      saveUserData(response.userData);
      return response;
    } on FormatException catch (e) {
      throw ParsingFailure("Invalid JSON: ${e.message}");
    } on Exception catch (e) {
      throw ServerFailure("Server error: ${e.toString()}");
    }
  }
}
