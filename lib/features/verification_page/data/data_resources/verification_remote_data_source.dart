import 'package:dallal_proj/core/api/end_points.dart';
import 'package:dallal_proj/core/errors/failure.dart';
import 'package:dallal_proj/core/utils/api.dart';
import 'package:dallal_proj/core/common/models/rsp_auth.dart';

abstract class VerificationRemoteDataSource {
  Future<RspAuth> resendMsg(String phone);
  // Future<RspAuth> getMsg(String phone);
}

class VerificationRemoteDataSourceImplement
    extends VerificationRemoteDataSource {
  final Api api;

  VerificationRemoteDataSourceImplement(this.api);
  @override
  Future<RspAuth> resendMsg(String phone) async {
    try {
      var data = await api.post(
        url: EndPoints.resendMsg,
        body: {MutualKeys.phone: phone},
        token: null,
      );
      RspAuth response = RspAuth.fromJson(data);
      return response;
    } on FormatException catch (e) {
      throw ParsingFailure("${HttpKeys.invalidJson}: ${e.message}");
    } on Exception catch (e) {
      throw ServerFailure("${HttpKeys.serverErr} ${e.toString()}");
    }
  }
}
