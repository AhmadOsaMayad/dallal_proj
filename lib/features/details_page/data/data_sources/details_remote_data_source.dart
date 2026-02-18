import 'package:dallal_proj/core/api/end_points.dart';
import 'package:dallal_proj/features/details_page/data/models/report_req_model.dart';
import 'package:dallal_proj/features/home_page/data/models/interaction_req_model.dart';
import 'package:dallal_proj/core/errors/failure.dart';
import 'package:dallal_proj/core/common/models/rsp_auth.dart';
import 'package:dallal_proj/core/utils/api.dart';
import 'dart:developer';

abstract class DetailsRemoteDataSource {
  Future<RspAuth> reportAdv(ReportReqModel interAct);
  Future<RspAuth> likeAdv(InteractionReqModel interAct);
  Future<RspAuth> unlikeAdv(InteractionReqModel interAct);
  Future<RspAuth> faveAdv(InteractionReqModel interAct);
  Future<RspAuth> unfaveAdv(InteractionReqModel interAct);
}

class DetailsRemoteDataSourceImplement extends DetailsRemoteDataSource {
  final Api api;

  DetailsRemoteDataSourceImplement({required this.api});
  @override
  Future<RspAuth> reportAdv(ReportReqModel reportModel) async {
    try {
      var data = await api.post(
        url: EndPoints.reportAdv,
        body: reportModel.toJson(),
        token: reportModel.token,
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
