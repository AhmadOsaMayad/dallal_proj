import 'package:dallal_proj/core/constants/app_texts.dart';

import 'package:dallal_proj/features/more_page/presentation/views/widgets/items/more_body_item.dart';
import 'package:dallal_proj/gen/assets/assets.gen.dart';

class FBars {
  static MoreBodyItem changePass(void Function()? onTap) =>
      fBar(onTap, Assets.icons.svg.morechangepass21, kCangePass);

  static MoreBodyItem logOut(void Function()? onTap) =>
      fBar(onTap, Assets.icons.svg.morelogout, kLogOut);

  static MoreBodyItem delAcc(void Function()? onTap) =>
      fBar(onTap, Assets.icons.svg.moredeleteacc, kDelAcc);

  static MoreBodyItem aboutUs(void Function()? onTap) =>
      fBar(onTap, Assets.icons.svg.moreinformation, kAboutUs);

  static MoreBodyItem prvNpoltcs(void Function()? onTap) =>
      fBar(onTap, Assets.icons.svg.moreprivacyandpolitics, kPrvNpoltcs);

  static MoreBodyItem condUsing(void Function()? onTap) =>
      fBar(onTap, Assets.icons.svg.moreconditionalusing, kCondUsing);

  static MoreBodyItem contactUs(void Function()? onTap) =>
      fBar(onTap, Assets.icons.svg.morecontactus, kContactUs);

  static MoreBodyItem rateUs(void Function()? onTap) =>
      fBar(onTap, Assets.icons.svg.morerateus, kRateUs);

  static MoreBodyItem shareApp(void Function()? onTap) =>
      fBar(onTap, Assets.icons.svg.moreshareapp, kShareApp);

  static MoreBodyItem appVersion(void Function()? onTap) =>
      fBar(onTap, Assets.icons.svg.moreinfocircle, kAppVersion);

  static MoreBodyItem fBar(void Function()? onTap, String img, String text) =>
      MoreBodyItem(text: text, img: img, onTap: onTap);
}
