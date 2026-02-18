import 'package:dallal_proj/core/common/entities/user_entity.dart';
import 'package:dallal_proj/core/components/app_cards/package_card/entities/package_entity.dart';
import 'package:dallal_proj/core/constants/mock_models.dart';
import 'package:dallal_proj/core/utils/assets_data.dart';

class CardEntity {
  final PckgInfEntity? package;
  final List<String> img;
  final DateTime? date;
  final UserEntity advOwner;
  final String title;
  final String location;
  final String price;
  final String section;
  final String? area;
  final String? mapImg;
  final String? flrCount;
  final String? romCount;
  final String? halCount;
  final String? bthCount;
  final String? kchCount;
  final String likes;
  final bool? isMine;
  final bool? status; // true for active, false refused, null pending
  final bool isLiked; // true for liked, false unliked
  final bool isfaved; // true for faved, false unfaved
  final bool isPremium; // true for premium, false for free

  const CardEntity(
    this.likes, {
    this.package,
    this.isMine,
    this.advOwner = kUserModel,
    this.date,
    this.area = '0',
    this.mapImg = AssetsData.mapImg,
    this.flrCount = '0',
    this.romCount = '0',
    this.halCount = '0',
    this.bthCount = '0',
    this.kchCount = '0',
    required this.section,
    this.status,
    required this.isLiked,
    required this.isfaved,
    required this.isPremium,
    required this.img,
    required this.title,
    required this.price,
    required this.location,
  });
}
