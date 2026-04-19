import 'package:dallal_proj/core/api/end_points.dart';
import 'package:dallal_proj/core/errors/failure.dart';

class ErrorModel extends Failure {
  final int status;
  final String errorMessage;

  ErrorModel({required this.status, required this.errorMessage})
    : super(errorMessage);
  factory ErrorModel.fromJson(Map<String, dynamic> jsonData) => ErrorModel(
    status: jsonData[DioKeys.status],
    errorMessage: jsonData[DioKeys.errMsg],
  );
}
