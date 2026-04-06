import 'package:dallal_proj/core/utils/functions/get_me_data.dart';
import 'package:dallal_proj/features/login_page/domain/entities/loggedin_user_entity.dart';

abstract class LoginLocalDataSource {
  LoggedinUserEntity? getLoggedinUserData();
}

class LoginLocalDataSourceImplement extends LoginLocalDataSource {
  @override
  LoggedinUserEntity? getLoggedinUserData() {
    return getMeData();
  }
}
