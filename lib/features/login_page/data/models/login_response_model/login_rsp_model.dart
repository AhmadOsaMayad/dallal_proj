import 'package:dallal_proj/core/api/end_points.dart';
import 'package:dallal_proj/core/common/models/rsp_auth.dart';
import 'package:dallal_proj/features/login_page/data/models/login_response_model/user_data.dart';
import 'package:dallal_proj/features/login_page/domain/entities/loggedin_user_entity.dart';

class LoginRspModel extends RspAuth {
  String? logStatus, logMessage;
  LoggedinUserEntity? userData;
  bool? verified;

  LoginRspModel({this.logStatus, this.logMessage, this.userData, this.verified})
    : super(status: logStatus, message: logMessage);

  factory LoginRspModel.fromJson(Map<String, dynamic> json) => LoginRspModel(
    logStatus: json[ApiKeys.status] as String?,
    logMessage: json[ApiKeys.errMsg] as String?,
    userData:
        json[ApiKeys.data] is Map<String, dynamic>
            ? UserData.fromJson(json[ApiKeys.data])
            : null,
    verified: json[ApiKeys.needVerf] as bool?,
  );
}
