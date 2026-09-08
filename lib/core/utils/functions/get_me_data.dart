import 'package:dallal_proj/core/constants/app_texts.dart';
import 'package:dallal_proj/features/login_page/domain/entities/loggedin_user_entity.dart';
import 'package:hive/hive.dart';

LoggedinUserEntity? getMeData() {
  // Defensive: callers (route guard, interceptors) may run before main()
  // finished opening the boxes (e.g. in tests or early app lifecycle).
  if (!Hive.isBoxOpen(kMeDataBox)) return null;
  var box = Hive.box<LoggedinUserEntity?>(kMeDataBox);
  return box.get('me');
}
