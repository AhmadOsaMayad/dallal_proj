import 'package:dallal_proj/core/api/end_points.dart';

class ErrorModel {
  final int status;
  final String errorMessage;

  ErrorModel({required this.status, required this.errorMessage});
  factory ErrorModel.fromJson(Map<String, dynamic> jsonData) => ErrorModel(
    status: jsonData[DioKeys.status],
    errorMessage: jsonData[DioKeys.errMsg],
  );
}
