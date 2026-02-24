import 'package:dallal_proj/core/api/dio_api/dio_consumer.dart';
import 'package:dallal_proj/core/api/end_points.dart';
import 'package:dallal_proj/core/api/http_api/http_consumer.dart';
import 'package:dallal_proj/core/errors/dio_xcept.dart';
import 'package:dallal_proj/core/errors/failure.dart';
import 'package:dallal_proj/core/utils/api.dart';
import 'package:dallal_proj/core/utils/functions/get_me_data.dart';
import 'package:dallal_proj/features/login_page/data/data_resources/set_profile_header_getter.dart';
import 'package:dallal_proj/features/login_page/data/models/set_profile_req_model.dart';
import 'package:dio/dio.dart';

// abstract class SetProfileRemoteDataSource {
//   Future<UserProfileModel> setProfile(UserProfileModel profileModel);
//   Future<UserProfileModel> setProfileDio(UserProfileModel profileModel);
//   Future<UserProfileModel> setProfileHtp(UserProfileModel profileModel);
// }

// class SetProfileRemoteDataSourceImplement extends SetProfileRemoteDataSource {
//   final Api api;
//   final DioConsumer apiDio;
//   final HttpConsumer apiHtp;
//   SetProfileRemoteDataSourceImplement({
//     required this.api,
//     required this.apiDio,
//     required this.apiHtp,
//   });
//   @override
//   Future<UserProfileModel> setProfile(UserProfileModel profileModel) async {
//     try {
//       var user = getMeData();
//       Map<String, dynamic> body = setProfileHeaderGetter(profileModel);
//       var data = await api.patch(
//         url: EndPoints.setProfile,
//         body: body, //profileModel.toJson(),
//         token: user!.uToken,
//       );
//       UserProfileModel response = UserProfileModel.fromJson(data);
//       return response;
//     } on FormatException catch (e) {
//       throw ParsingFailure("${HttpKeys.invalidJson}: ${e.message}");
//     } on Exception catch (e) {
//       throw ServerFailure("${HttpKeys.serverErr} ${e.toString()}");
//     }
//   }

//   @override
//   Future<UserProfileModel> setProfileDio(UserProfileModel profileModel) async {
//     try {
//       // var user = getMeData();
//       Map<String, dynamic> body = setProfileHeaderGetter(profileModel);
//       var data = await apiDio.patch(
//         EndPoints.setProfile,
//         data: body, //profileModel.toJson(),
//         // token: user!.uToken,
//       );
//       UserProfileModel response = UserProfileModel.fromJson(data);
//       return response;
//     } on DioException catch (e) {
//       throw handleDioExceptions(e);
//     } on Exception catch (e) {
//       throw ServerFailure("Server error: ${e.toString()}");
//     }
//   }

//   @override
//   Future<UserProfileModel> setProfileHtp(UserProfileModel profileModel) async {
//     try {
//       // var user = getMeData();
//       Map<String, dynamic> body = setProfileHeaderGetter(profileModel);
//       var data = await apiHtp.patch(
//         EndPoints.setProfile,
//         data: body, //profileModel.toJson(),
//         // token: user!.uToken,
//       );
//       UserProfileModel response = UserProfileModel.fromJson(data);
//       return response;
//     } on DioException catch (e) {
//       throw handleDioExceptions(e);
//     } on Exception catch (e) {
//       throw ServerFailure("Server error: ${e.toString()}");
//     }
//   }
// }
