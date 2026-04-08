import 'package:dallal_proj/core/common/models/rsp_auth.dart';
import 'package:dallal_proj/features/details_page/domain/entities/show_details_entity.dart';

class FetchAdvsListRspModel extends RspAuth {
  String? fetchStatus, fetchMessage;
  List<ShowDetailsEntity>? advList;

  FetchAdvsListRspModel({this.fetchStatus, this.fetchMessage, this.advList})
    : super(status: fetchStatus, message: fetchMessage);

}
