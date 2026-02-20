import 'package:dallal_proj/core/common/entities/options_list_entity.dart';
import 'package:dallal_proj/core/common/entities/user_entity.dart';
import 'package:dallal_proj/core/shared/components/app_cards/package_card/entities/package_entity.dart';
import 'package:dallal_proj/core/shared/components/app_cards/package_card/entities/package_type.dart';
import 'package:dallal_proj/core/shared/components/app_cards/selection_cards/section_card_entity.dart';
import 'package:dallal_proj/core/constants/app_texts.dart';
import 'package:dallal_proj/core/constants/str_lists.dart';
import 'package:dallal_proj/core/utils/app_router.dart';
import 'package:dallal_proj/core/utils/assets_data.dart';

const kUserModel = UserEntity();

final kFundPckgModel = PckgInfEntity(
  type: PackageType.fund,
  startDate: DateTime.now(),
);

final kSpecialPckgModel = PckgInfEntity(
  type: PackageType.special,
  startDate: DateTime.now(),
);

final kGoldenPckgModel = PckgInfEntity(
  type: PackageType.golden,
  startDate: DateTime.now(),
);

const kPropCkbModel = OptionsListEntity(
  title: kPropertyType,
  options: CLstr.propertyType,
);

const int tfModelLength = 4;

const List<String> kTFModelTitles = [
  kKitchenCount,
  kBathsCount,
  kHallsCount,
  kRoomsCount,
];

const kIsNegot = OptionsListEntity(
  title: '$kNegotiatable؟   ',
  options: CLstr.isOnlyPremOpts,
);

const kOfferCkbModel = OptionsListEntity(
  title: kOfferType,
  options: CLstr.offerType,
);

const kAdvicesOLM = OptionsListEntity(title: kAdvices, options: CLstr.advices);

const kOrderByRBModel = OptionsListEntity(
  title: kOrderResultsBy,
  options: CLstr.orderByOptions,
);

const kReportRBModel = OptionsListEntity(
  title: kReportTitle,
  options: CLstr.reportOptions,
);

const kOnlyPremOptModel = OptionsListEntity(
  title: kIsOnlyPremiumResults,
  options: CLstr.isOnlyPremOpts,
);

const kCrAdvCardHouse = SectCardEntity(
  name: kHouse,
  pTitle: '$kCreateAdv - $kHouse',
  img: AssetsData.crAdvHouse,
  routePath: AppRouter.kCrAdvPage,
);

const kCrAdvCardApt = SectCardEntity(
  name: kApt,
  pTitle: '$kCreateAdv - $kApt',
  img: AssetsData.crAdvApt,
  routePath: AppRouter.kCrAdvPage,
);

const kCrAdvCardStore = SectCardEntity(
  name: kStore,
  pTitle: '$kCreateAdv - $kStore',
  img: AssetsData.crAdvStore,
  routePath: AppRouter.kCrAdvPage,
);

const kCrAdvCardGrnd = SectCardEntity(
  name: kGround,
  pTitle: '$kCreateAdv - $kGround',
  img: AssetsData.crAdvGround,
  routePath: AppRouter.kCrAdvPage,
);

const kSectCardHouses = SectCardEntity(
  name: kHouses,
  img: AssetsData.housesSvg,
  routePath: AppRouter.kSelectedSectPage,
);

const kSectCardApts = SectCardEntity(
  name: kApts,
  img: AssetsData.appartmentsSvg,
  routePath: AppRouter.kSelectedSectPage,
);

const kSectCardStores = SectCardEntity(
  name: kStores,
  img: AssetsData.storesSvg,
  routePath: AppRouter.kSelectedSectPage,
);

const kSectCardGrnds = SectCardEntity(
  name: kGrounds,
  img: AssetsData.groundsSvg,
  routePath: AppRouter.kSelectedSectPage,
);
