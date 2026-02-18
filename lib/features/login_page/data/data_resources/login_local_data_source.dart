// import 'package:dallal_proj/core/constants/app_texts.dart';
import 'package:dallal_proj/core/utils/functions/get_me_data.dart';
import 'package:dallal_proj/features/login_page/domain/entities/loggedin_user_entity.dart';
// import 'package:hive/hive.dart';

abstract class LoginLocalDataSource {
  LoggedinUserEntity? getLoggedinUserData();
}

class LoginLocalDataSourceImplement extends LoginLocalDataSource {
  @override
  LoggedinUserEntity? getLoggedinUserData() {
    return getMeData();
  }
}
