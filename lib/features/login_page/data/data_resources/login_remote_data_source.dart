import 'package:dallal_proj/core/api/dio_api/dio_consumer.dart';
import 'package:dallal_proj/core/api/end_points.dart';
import 'package:dallal_proj/core/errors/dio_xcept.dart';
import 'package:dallal_proj/core/errors/failure.dart';
import 'package:dallal_proj/core/utils/functions/save_user_data.dart';
import 'package:dallal_proj/features/login_page/data/models/login_req_model.dart';
import 'package:dallal_proj/features/login_page/data/models/login_response_model/login_rsp_model.dart';
import 'package:dio/dio.dart';

abstract class LoginRemoteDataSource {
  Future<LoginRspModel> loginUser(LoginReqModel loginModel);
}

class LoginRemoteDataSourceImplement extends LoginRemoteDataSource {
  final DioConsumer api;

  LoginRemoteDataSourceImplement(this.api);
  @override
  Future<LoginRspModel> loginUser(LoginReqModel loginModel) async {
    try {
      var data = await api.post(EndPoints.login, data: loginModel.toJson());
      LoginRspModel response = LoginRspModel.fromJson(data);
      saveUserData(response.userData);
      return response;
    } on DioException catch (e) {
      throw handleDioExceptions(e);
    } on Exception catch (e) {
      throw ServerFailure("Server error: ${e.toString()}");
    }
  }
}
