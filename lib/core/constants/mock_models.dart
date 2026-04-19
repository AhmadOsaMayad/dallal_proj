import 'package:dallal_proj/core/common/entities/options_list_entity.dart';
import 'package:dallal_proj/core/common/entities/user_entity.dart';
import 'package:dallal_proj/core/shared/components/app_cards/package_card/entities/package_entity.dart';
import 'package:dallal_proj/core/enums/package_type.dart';
import 'package:dallal_proj/core/shared/components/app_cards/selection_cards/section_card_entity.dart';
import 'package:dallal_proj/core/constants/app_texts.dart';
import 'package:dallal_proj/core/constants/str_lists.dart';
import 'package:dallal_proj/core/utils/app_router.dart';
import 'package:dallal_proj/gen/assets/assets.gen.dart';

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

class MockModels {
  static SectCardEntity kCrAdvCardHouse = SectCardEntity(
    name: kHouse,
    pTitle: '$kCreateAdv - $kHouse',
    img: Assets.icons.svg.cradvhouses,
    routePath: AppRouter.kCrAdvPage,
  );

  static SectCardEntity kCrAdvCardApt = SectCardEntity(
    name: kApt,
    pTitle: '$kCreateAdv - $kApt',
    img: Assets.icons.svg.cradvapts180,
    routePath: AppRouter.kCrAdvPage,
  );

  static SectCardEntity kCrAdvCardStore = SectCardEntity(
    name: kStore,
    pTitle: '$kCreateAdv - $kStore',
    img: Assets.icons.svg.cradvstores,
    routePath: AppRouter.kCrAdvPage,
  );

  static SectCardEntity kCrAdvCardGrnd = SectCardEntity(
    name: kGround,
    pTitle: '$kCreateAdv - $kGround',
    img: Assets.icons.svg.cradvgrounds,
    routePath: AppRouter.kCrAdvPage,
  );

  static SectCardEntity kSectCardHouses = SectCardEntity(
    name: kHouses,
    img: Assets.icons.svg.houses180,
    routePath: AppRouter.kSelectedSectPage,
  );

  static SectCardEntity kSectCardApts = SectCardEntity(
    name: kApts,
    img: Assets.icons.svg.appartments180,
    routePath: AppRouter.kSelectedSectPage,
  );

  static SectCardEntity kSectCardStores = SectCardEntity(
    name: kStores,
    img: Assets.icons.svg.stores180,
    routePath: AppRouter.kSelectedSectPage,
  );

  static SectCardEntity kSectCardGrnds = SectCardEntity(
    name: kGrounds,
    img: Assets.icons.svg.grounds180,
    routePath: AppRouter.kSelectedSectPage,
  );
}
