import 'package:dallal_proj/core/constants/app_texts.dart';
import 'package:flutter/foundation.dart';

/// Backend API base URL.
///
/// Override at build/run time with:
///   flutter run --dart-define=API_BASE_URL=https://your-server.com/api/
///   flutter build apk --dart-define=API_BASE_URL=https://your-server.com/api/
const kDomainApp = String.fromEnvironment(
  'API_BASE_URL',
  defaultValue: 'http://72.62.231.199/api-app/api/',
);

/// Legacy dev domain kept for reference; not used by the app anymore.
@Deprecated('Use kDomainApp with --dart-define=API_BASE_URL instead')
const kGenAppDomain = 'http://192.168.1.7:1234/dallal-proj/';

const kDefFontFam = 'Rubik';

/// Whether debug-only tooling (verbose network logging, etc.) is enabled.
/// Controlled by `--dart-define=DEBUG_API_LOGS=true`; defaults to debug builds.
const kDebugApiLogs = bool.fromEnvironment(
  'DEBUG_API_LOGS',
  defaultValue: kDebugMode,
);
const kDefFilterOPtion = kNewestOPtion;
const kDefReportOpt = kRptFakeAdv;
const kDefYesNoOPtion = kNo;
const kDefRegRadOption = kNo;
const kDefCurrency = kCurrYER;
const kDefCity = 'sanaa';
const kDefCountryCode = 'YE';
const kDefPhoneInpLang = 'ar';
const kDefArRegex = r'^[\u0600-\u06FF]';
const kDefDateFormat = 'yyyy-MM-dd';
const kDefNegotOpt = kNo;
const kDefOfferOpt = kOfrTypFull;
const kDefMidNavBarSelectedIndex = 0;
const kCTs = 'cities';
const kOTs = 'offer_types';
const kOTsRev = 'offer_types_rev';
const kPTs = 'property_type';
const kPTsRev = 'property_type_rev';
const kPTSs = 'properties_type';
