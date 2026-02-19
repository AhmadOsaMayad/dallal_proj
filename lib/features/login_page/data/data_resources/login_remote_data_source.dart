import 'package:dallal_proj/core/api/dio_api/dio_consumer.dart';
import 'package:dallal_proj/core/api/end_points.dart';
import 'package:dallal_proj/core/errors/dio_xcept.dart';
import 'package:dallal_proj/core/api/http_api/http_consumer.dart';
import 'package:dallal_proj/core/errors/failure.dart';
import 'package:dallal_proj/core/utils/api.dart';
import 'package:dallal_proj/core/utils/functions/save_user_data.dart';
import 'package:dallal_proj/features/login_page/data/models/login_req_model.dart';
import 'package:dallal_proj/features/login_page/data/models/login_response_model/login_rsp_model.dart';
import 'package:dio/dio.dart';
// import 'package:jwt_decoder/jwt_decoder.dart';

abstract class LoginRemoteDataSource {
  Future<LoginRspModel> loginUser(LoginReqModel loginModel);
  Future<LoginRspModel> loginUserAlt(LoginReqModel loginModel);
}

class LoginRemoteDataSourceImplement extends LoginRemoteDataSource {
  final DioConsumer apiDio;
  final HttpConsumer apiHttp;
  final Api api;

  LoginRemoteDataSourceImplement({
    required this.api,
    required this.apiDio,
    required this.apiHttp,
  });
  @override
  Future<LoginRspModel> loginUser(LoginReqModel loginModel) async {
    try {
      var data = await apiDio.post(EndPoints.login, data: loginModel.toJson());
      LoginRspModel response = LoginRspModel.fromJson(data);
      saveUserData(response.userData);
      return response;
    } on DioException catch (e) {
      throw handleDioExceptions(e);
    } on Exception catch (e) {
      throw ServerFailure("Server error: ${e.toString()}");
    }
  }

  @override
  Future<LoginRspModel> loginUserAlt(LoginReqModel loginModel) async {
    try {
      var data = await api.post(
        url: EndPoints.login,
        body: loginModel.toJson(),
        token: null,
      );
      LoginRspModel response = LoginRspModel.fromJson(data);
      // final decodedToken = JwtDecoder.decode(response.userData!.uToken!);
      // decodedToken; //this line is just to turn the warning line off
      saveUserData(response.userData);
      return response;
    } on DioException catch (e) {
      throw handleDioExceptions(e);
    } on FormatException catch (e) {
      throw ParsingFailure("${HttpKeys.invalidJson}: ${e.message}");
    } on Exception catch (e) {
      throw ServerFailure("${HttpKeys.serverErr} ${e.toString()}");
    }
  }
}
