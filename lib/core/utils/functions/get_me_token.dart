import 'package:dallal_proj/core/utils/functions/is_success.dart';
import 'package:dallal_proj/features/login_page/domain/entities/loggedin_user_entity.dart';

String? getMeToken(LoggedinUserEntity? user) {
  final String? token;
  if (isntVNull(user) && isNemp(user!.uToken)) {
    token = user.uToken;
    return token;
  }
  return null;
}
