import 'dart:convert';
import 'package:dallal_proj/core/api/end_points.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

Map<String, String> buildHeaders({
  String? token,
  bool withContentType = false,
}) {
  final headers = <String, String>{};
  if (withContentType) {
    headers[HttpKeys.contentTypeK] = HttpKeys.xwContentType;
  }
  if (token != null && token.isNotEmpty && token != 'null') {
    headers[HttpKeys.auth] = '${HttpKeys.bearer} $token';
  }
  return headers;
}

//this handles the form data issue using Dio Built-in func
//in an actual project try to handle it manually independentally
isFormD(bool isForm, dynamic data) {
  if (isForm) {
    return FormData.fromMap(data);
  }
  return data;
}

/// Build URI with query parameters
Uri buildUri(String path, Map<String, dynamic>? queryParams) {
  final uri = Uri.parse('${EndPoints.baseUrl}$path');
  return queryParams != null ? uri.replace(queryParameters: queryParams) : uri;
}

/// Handle response safely
dynamic handleResponse(http.Response response, {bool allowNoContent = false}) {
  final statusCode = response.statusCode;
  final body = response.body;

  if (statusCode >= 200 && statusCode < 300) {
    if (allowNoContent && body.isEmpty) return {};
    try {
      return body.isNotEmpty ? jsonDecode(body) : {};
    } catch (_) {
      throw Exception("${HttpKeys.respIsntJson} $body");
    }
  } else {
    debugPrint("Error $statusCode: $body");
    throw Exception("${HttpKeys.reqFailedWithStatus} $statusCode");
  }
}
