import 'package:dallal_proj/core/errors/error_model.dart';
import 'package:dio/dio.dart';

class ServerException implements Exception {
  final ErrorModel errModel;

  ServerException({required this.errModel});
}

ServerException handleDioExceptions(DioException e) {
  switch (e.type) {
    case DioExceptionType.connectionTimeout:
      return ServerException(errModel: ErrorModel.fromJson(e.response!.data));
    case DioExceptionType.sendTimeout:
      return ServerException(errModel: ErrorModel.fromJson(e.response!.data));
    case DioExceptionType.receiveTimeout:
      return ServerException(errModel: ErrorModel.fromJson(e.response!.data));
    case DioExceptionType.badCertificate:
      return ServerException(errModel: ErrorModel.fromJson(e.response!.data));
    case DioExceptionType.cancel:
      return ServerException(errModel: ErrorModel.fromJson(e.response!.data));
    case DioExceptionType.connectionError:
      return ServerException(errModel: ErrorModel.fromJson(e.response!.data));
    case DioExceptionType.unknown:
      return ServerException(errModel: ErrorModel.fromJson(e.response!.data));
    case DioExceptionType.badResponse:
      switch (e.response!.statusCode) {
        case 400:
          return ServerException(
            errModel: ErrorModel.fromJson(e.response!.data),
          );
        case 401:
          return ServerException(
            errModel: ErrorModel.fromJson(e.response!.data),
          );
        case 403:
          return ServerException(
            errModel: ErrorModel.fromJson(e.response!.data),
          );
        case 404:
          return ServerException(
            errModel: ErrorModel.fromJson(e.response!.data),
          );
        case 422:
          return ServerException(
            errModel: ErrorModel.fromJson(e.response!.data),
          );
        case 504:
          return ServerException(
            errModel: ErrorModel.fromJson(e.response!.data),
          );
        default:
          return ServerException(
            errModel: ErrorModel(
              status: 000,
              errorMessage: "Unknown Error: ${e.message}",
            ),
          );
      }
  }
}
