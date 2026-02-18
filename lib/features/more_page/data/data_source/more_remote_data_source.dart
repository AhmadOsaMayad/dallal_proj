import 'package:dallal_proj/core/api/end_points.dart';
import 'package:dallal_proj/core/errors/failure.dart';
import 'package:dallal_proj/core/utils/api.dart';
import 'package:dallal_proj/core/utils/functions/get_me_data.dart';
import 'package:dallal_proj/core/common/models/rsp_auth.dart';

abstract class MoreRemoteDataSource {
  Future<RspAuth> deleteAccount();
}

class MoreRemoteDataSourceImplement extends MoreRemoteDataSource {
  final Api api;

  MoreRemoteDataSourceImplement({required this.api});
  @override
  Future<RspAuth> deleteAccount() async {
    try {
      var user = getMeData();
      var data = await api.post(
        url: EndPoints.deleteAcc,
        body: null,
        token: user!.uToken!,
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
