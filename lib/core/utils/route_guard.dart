import 'package:dallal_proj/core/utils/functions/get_me_data.dart';
import 'package:dallal_proj/core/utils/functions/is_loggedin.dart';
import 'package:dallal_proj/features/login_page/domain/entities/loggedin_user_entity.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';

/// Route paths that require an authenticated session.
const Set<String> kProtectedRoutes = {
  '/mainPage',
  '/notificPage',
  '/favoritePage',
  '/crAdvPage',
  '/featuringAdvPage',
  '/packageDetailsPage',
  '/editAdvPage',
  '/editPersonalInfoPage',
  '/advRefusedPage',
};

/// Redirects unauthenticated users away from protected routes to the preview
/// (onboarding) page. Routes that need an extra payload (e.g. [GoRoute]s that
/// cast `state.extra`) will fail naturally if opened without data, but the
/// auth gate below runs first so signed-out users never reach them.
String? authGuard(BuildContext context, GoRouterState state) {
  final LoggedinUserEntity? user = getMeData();
  final bool loggedIn = isLoggedin(user);

  if (!loggedIn && kProtectedRoutes.contains(state.matchedLocation)) {
    return '/previewPage';
  }
  return null;
}
