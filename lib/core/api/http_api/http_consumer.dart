import 'dart:convert';

import 'package:dallal_proj/core/api/api_consumer.dart';
import 'package:dallal_proj/core/api/end_points.dart';
import 'package:dallal_proj/core/api/http_api/http_handler.dart';
import 'package:dallal_proj/core/utils/functions/get_me_data.dart';
import 'package:dallal_proj/core/utils/functions/get_me_token.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HttpConsumer extends ApiConsumer {
  @override
  Future<dynamic> get(
    String path, {
    Object? data,
    Map<String, dynamic>? queryParams,
  }) async {
    final user = getMeData();
    final token = getMeToken(user);

    final response = await http.get(
      buildUri(path, queryParams),
      headers: buildHeaders(withContentType: true, token: token),
    );
    if (response.statusCode == 200) {
      Map<String, dynamic> data = jsonDecode(response.body);
      return data;
    }
    return handleResponse(response);
  }

  @override
  Future<dynamic> post(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParams,
    bool isFormData = false,
  }) async {
    final user = getMeData();
    final token = getMeToken(user);
    final response = await http.post(
      buildUri(path, queryParams),
      body: isFormD(isFormData, data),
      headers: buildHeaders(token: token, withContentType: true),
    );

    if (response.statusCode == 200) {
      Map<String, dynamic> data = jsonDecode(response.body);
      return data;
    }
    return handleResponse(response);
  }

  @override
  Future<dynamic> put(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParams,
    bool isFormData = false,
  }) async {
    final user = getMeData();
    final token = getMeToken(user);

    final response = await http.put(
      buildUri(path, queryParams),
      body: isFormD(isFormData, data),
      headers: buildHeaders(withContentType: true, token: token),
    );
    debugPrint("PUT ${EndPoints.baseUrl}$path ::: BODY: $data");
    if (response.statusCode == 200) {
      Map<String, dynamic> data = jsonDecode(response.body);
      return data;
    }
    return handleResponse(response);
  }

  @override
  Future<dynamic> patch(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParams,
    bool isFormData = false,
  }) async {
    final user = getMeData();
    final token = getMeToken(user);

    final response = await http.patch(
      buildUri(path, queryParams),
      body: isFormD(isFormData, data),
      headers: buildHeaders(withContentType: false, token: token),
    );
    debugPrint("PATCH ${EndPoints.baseUrl}$path ::: BODY: $data");
    if (response.statusCode == 200) {
      Map<String, dynamic> data = jsonDecode(response.body);
      return data;
    }
    return handleResponse(response);
  }

  @override
  Future<dynamic> delete(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParams,
    bool isFormData = false,
  }) async {
    final user = getMeData();
    final token = getMeToken(user);

    final response = await http.delete(
      buildUri(path, queryParams),
      body: isFormD(isFormData, data),
      headers: buildHeaders(withContentType: true, token: token),
    );
    debugPrint("DELETE ${EndPoints.baseUrl}$path");
    if (response.statusCode == 200) {
      Map<String, dynamic> data = jsonDecode(response.body);
      return data;
    }
    return handleResponse(response);
  }
}
