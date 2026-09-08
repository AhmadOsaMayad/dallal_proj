// App smoke test.
//
// Boots the real app widget (with Hive backed by a temp dir and the service
// locator registered, mirroring main()) and verifies the guest navigation
// flow: splash holds, then routes signed-out users to the preview page.
//
// The original template counter test was removed because it never matched
// this app and would fail on every run.

import 'dart:io';

import 'package:dallal_proj/core/common/entities/adv_card_entity/adv_card_entity.dart';
import 'package:dallal_proj/core/constants/app_defs.dart';
import 'package:dallal_proj/core/constants/app_texts.dart';
import 'package:dallal_proj/core/di/service_locator.dart';
import 'package:dallal_proj/features/login_page/domain/entities/loggedin_user_entity.dart';
import 'package:dallal_proj/features/preview/presentation/views/preview_page.dart';
import 'package:dallal_proj/features/splash/presentation/views/splash_view.dart';
import 'package:dallal_proj/main.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() {
  setUpAll(() async {
    TestWidgetsFlutterBinding.ensureInitialized();

    final Directory tempDir = await Directory.systemTemp.createTemp(
      'dallal_test_hive',
    );
    Hive.init(tempDir.path);

    Hive.registerAdapter(LoggedinUserEntityAdapter());
    Hive.registerAdapter(AdvCardEntityAdapter());

    await Hive.openBox<LoggedinUserEntity?>(kMeDataBox);
    await Hive.openBox<AdvCardEntity?>(kFeaturedAdvBox);
    await Hive.openBox<AdvCardEntity?>(kAllAdvBox);

    setupServiceLocator();
  });

  testWidgets('boots into splash and routes guests to the preview page', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const DallalProj());

    // First frame: the splash screen with the animated logo.
    expect(find.byType(SplashView), findsOneWidget);

    // The splash holds ~5 seconds before deciding where to navigate.
    // With an empty auth box the user is treated as signed out.
    await tester.pump(const Duration(seconds: 6));
    await tester.pump();

    expect(find.byType(PreviewPage), findsOneWidget);
  });
}
