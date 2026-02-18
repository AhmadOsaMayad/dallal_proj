import 'dart:developer';

import 'package:dallal_proj/core/api/end_points.dart';
import 'package:dallal_proj/core/errors/failure.dart';
import 'package:dallal_proj/core/utils/api.dart';
import 'package:dallal_proj/core/utils/functions/get_all_advs_list.dart';
import 'package:dallal_proj/core/utils/functions/get_featured_advs_list.dart';
import 'package:dallal_proj/core/common/models/rsp_auth.dart';
import 'package:dallal_proj/features/details_page/domain/entities/show_details_entity.dart';
import 'package:dallal_proj/features/home_page/data/models/banners_model/banners_model.dart';
import 'package:dallal_proj/features/home_page/data/models/fetch_advs_list_rsp_model.dart';
import 'package:dallal_proj/features/home_page/data/models/interaction_req_model.dart';
import 'package:dallal_proj/features/home_page/domain/entities/banners_rsp_entity.dart';

abstract class HomeRemoteDataSource {
  Future<FetchAdvsListRspModel> fetchFeaturedAdvs(String? token);
  Future<FetchAdvsListRspModel> fetchAllAdvs(String? token);
  Future<BannersRspEntity> fetchAllBans();
  Future<RspAuth> likeAdv(InteractionReqModel interAct);
  Future<RspAuth> unlikeAdv(InteractionReqModel interAct);
  Future<RspAuth> faveAdv(InteractionReqModel interAct);
  Future<RspAuth> unfaveAdv(InteractionReqModel interAct);
}

class HomeRemoteDataSourceImplement extends HomeRemoteDataSource {
  final Api api;

  HomeRemoteDataSourceImplement({required this.api});
  @override
  Future<FetchAdvsListRspModel> fetchAllAdvs(String? token) async {
    try {
      if (token == 'null') {
        token = null;
      }
      var data = await api.get(url: EndPoints.fetchAllAdvs, token: token);
      RspAuth response = RspAuth.fromJson(data);
      List<ShowDetailsEntity> allAdvs = getAllAdvsList(data);
      // saveAdvsList(allAdvs, kAllAdvBox);

      return FetchAdvsListRspModel(
        fetchStatus: response.status,
        fetchMessage: response.message,
        advList: allAdvs,
      );
      // return allAdvs;
    } on FormatException catch (e) {
      throw ParsingFailure("${HttpKeys.invalidJson}: ${e.message}");
    } on Exception catch (e) {
      throw ServerFailure("${HttpKeys.serverErr} ${e.toString()}");
    }
  }

  @override
  Future<FetchAdvsListRspModel> fetchFeaturedAdvs(String? token) async {
    try {
      var data = await api.get(url: EndPoints.fetchFeaturedAdvs, token: token);
      RspAuth response = RspAuth.fromJson(data);

      List<ShowDetailsEntity> featuredAdvs = getFeaturedAdvsList(data);
      // saveAdvsList(featuredAdvs, kFeaturedAdvBox);
      return FetchAdvsListRspModel(
        fetchStatus: response.status,
        fetchMessage: response.message,
        advList: featuredAdvs,
      );
      // return featuredAdvs;
    } on FormatException catch (e) {
      throw ParsingFailure("${HttpKeys.invalidJson}: ${e.message}");
    } on Exception catch (e) {
      throw ServerFailure("${HttpKeys.serverErr} ${e.toString()}");
    }
  }

  @override
  Future<BannersRspEntity> fetchAllBans() async {
    try {
      var data = await api.get(url: EndPoints.fetchAllBanners, token: null);
      BannersRspEntity response = BannersModel.fromJson(data);
      return response;
    } on FormatException catch (e) {
      throw ParsingFailure("${HttpKeys.invalidJson}: ${e.message}");
    } on Exception catch (e) {
      throw ServerFailure("${HttpKeys.serverErr} ${e.toString()}");
    }
  }

  @override
  Future<RspAuth> faveAdv(InteractionReqModel interAct) async {
    try {
      var data = await api.post(
        url: EndPoints.faveAdv,
        token: interAct.token,
        body: interAct.toJson(),
      );
      log(data.toString());
      RspAuth response = RspAuth.fromJson(data);
      return response;
    } on FormatException catch (e) {
      throw ParsingFailure("${HttpKeys.invalidJson}: ${e.message}");
    } on Exception catch (e) {
      throw ServerFailure("${HttpKeys.serverErr} ${e.toString()}");
    }
  }

  @override
  Future<RspAuth> unfaveAdv(InteractionReqModel interAct) async {
    try {
      var data = await api.delete(
        url: "${EndPoints.unfaveAdv}${interAct.advID}",
        token: interAct.token,
        // body: interAct.advID,
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
  Future<RspAuth> likeAdv(InteractionReqModel interAct) async {
    try {
      var data = await api.post(
        url: EndPoints.likeAdv,
        token: interAct.token,
        body: interAct.toJson(),
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
  Future<RspAuth> unlikeAdv(InteractionReqModel interAct) async {
    try {
      var data = await api.delete(
        url: "${EndPoints.unlikeAdv}${interAct.advID}",
        token: interAct.token,
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
