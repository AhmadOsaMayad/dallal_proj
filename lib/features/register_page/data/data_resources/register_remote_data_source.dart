import 'package:dallal_proj/core/api/end_points.dart';
import 'package:dallal_proj/core/api/http_api/http_consumer.dart';
import 'package:dallal_proj/core/errors/failure.dart';
import 'package:dallal_proj/core/utils/api.dart';
import 'package:dallal_proj/core/common/models/rsp_auth.dart';
import 'package:dallal_proj/features/register_page/data/models/register_model.dart';

abstract class RegisterRemoteDataSource {
  Future<RspAuth> registerUser(RegisterModel registerModel);
  Future<RspAuth> registerUserHtCon(RegisterModel registerModel);
}

class RegisterRemoteDataSourceImplement extends RegisterRemoteDataSource {
  final Api api;
  final HttpConsumer apiHt;

  RegisterRemoteDataSourceImplement(this.api, this.apiHt);

  @override
  Future<RspAuth> registerUser(RegisterModel registerModel) async {
    try {
      var data = await api.post(
        url: EndPoints.register,
        body: registerModel.toJson(),
        token: null,
      );
      RspAuth response = RspAuth.fromJson(data);
      return response;
    } on FormatException catch (e) {
      throw ParsingFailure("${HttpKeys.invalidJson} format: ${e.message}");
    } on Exception catch (e) {
      throw ServerFailure("${HttpKeys.serverErr} ${e.toString()}");
    }

    // throw UnimplementedError();
  }

  @override
  Future<RspAuth> registerUserHtCon(RegisterModel registerModel) async {
    try {
      var data = await apiHt.post(
        EndPoints.register,
        data: registerModel.toJson(),
        // token: null,
      );
      RspAuth response = RspAuth.fromJson(data);
      return response;
    } on FormatException catch (e) {
      throw ParsingFailure("${HttpKeys.invalidJson} format: ${e.message}");
    } on Exception catch (e) {
      throw ServerFailure("${HttpKeys.serverErr} ${e.toString()}");
    }

    // throw UnimplementedError();
  }
}
