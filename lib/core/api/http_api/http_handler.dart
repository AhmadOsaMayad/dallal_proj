import 'dart:convert';

import 'package:dallal_proj/core/api/http_api/http_config_consts.dart';
import 'package:dallal_proj/core/constants/app_texts.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

Map<String, String> buildHeaders({
  String? token,
  bool withContentType = false,
}) {
  final headers = <String, String>{};
  if (withContentType) {
    headers[kContentTypeK] = kContentTypeV;
  }
  if (token != null && token.isNotEmpty && token != 'null') {
    headers[kAuth] = '$kBearer $token';
  }
  return headers;
}

/// Build URI with query parameters
Uri buildUri(String path, Map<String, dynamic>? queryParams) {
  final uri = Uri.parse('$kBaseURL$path');
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
      throw Exception("$kRespIsntJson $body");
    }
  } else {
    debugPrint("Error $statusCode: $body");
    throw Exception("$kReqFailedWithStatus $statusCode");
  }
}
