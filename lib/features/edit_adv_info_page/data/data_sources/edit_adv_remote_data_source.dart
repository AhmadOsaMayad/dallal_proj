import 'package:dallal_proj/core/api/end_points.dart';
import 'package:dallal_proj/core/errors/failure.dart';
import 'package:dallal_proj/core/utils/api.dart';
import 'package:dallal_proj/core/common/models/rsp_auth.dart';
import 'package:dallal_proj/features/create_adv_page/data/models/cr_adv_resp_model.dart';
import 'package:dallal_proj/features/create_adv_page/data/models/media_req_model.dart';
import 'package:dallal_proj/features/edit_adv_info_page/data/models/edit_advertisement_request_model.dart';
import 'package:dallal_proj/features/edit_adv_info_page/domain/use_cases/delete_media_params.dart';

abstract class EditAdvRemoteDataSource {
  Future<AdvertisementApiResponse> updateAdv(
    EditAdvertisementRequestModel editAdvReqModel,
  );
  Future<RspAuth> updateMedia(MediaReqModel mediaReqModel);
  Future<RspAuth> deleteMedia(DeleteMediaParams deleteMediaParams);
}

class EditAdvRemoteDataSourceImplement extends EditAdvRemoteDataSource {
  final Api api;

  EditAdvRemoteDataSourceImplement({required this.api});

  @override
  Future<AdvertisementApiResponse> updateAdv(
    EditAdvertisementRequestModel editAdvReqModel,
  ) async {
    try {
      var data = await api.patch(
        url: EndPoints.updateAdv,
        body: editAdvReqModel.toJson(),
        token: editAdvReqModel.userToken,
      );
      AdvertisementApiResponse response = AdvertisementApiResponse.fromJson(
        data,
      );
      return response;
    } on FormatException catch (e) {
      throw ParsingFailure("${HttpKeys.invalidJson}: ${e.message}");
    } on Exception catch (e) {
      throw ServerFailure("${HttpKeys.serverErr} ${e.toString()}");
    }
  }

  @override
  Future<RspAuth> updateMedia(MediaReqModel mediaReqModel) async {
    try {
      var data = await api.post(
        url: EndPoints.createMedia,
        body: mediaReqModel.toJson(),
        token: mediaReqModel.token,
      );
      RspAuth response = RspAuth.fromJson(data);
      return response;
    } on FormatException catch (e) {
      throw ParsingFailure("${HttpKeys.invalidJson}: ${e.message}");
    } on Exception catch (e) {
      throw ServerFailure("${HttpKeys.serverErr} ${e.toString()}");
    }
  }

  @override
  Future<RspAuth> deleteMedia(DeleteMediaParams deleteMediaParams) async {
    try {
      var data = await api.delete(
        url: '${EndPoints.deleteMedia}${deleteMediaParams.mediaId}',
        token: deleteMediaParams.token,
      );
      RspAuth response = RspAuth.fromJson(data);
      return response;
    } on FormatException catch (e) {
      throw ParsingFailure("${HttpKeys.invalidJson}: ${e.message}");
    } on Exception catch (e) {
      throw ServerFailure("${HttpKeys.serverErr} ${e.toString()}");
    }
  }
}
