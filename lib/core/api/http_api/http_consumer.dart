import 'package:dallal_proj/core/api/api_consumer.dart';
import 'package:dallal_proj/core/api/end_points.dart';
import 'package:dallal_proj/core/api/http_api/http_handler.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HttpConsumer extends ApiConsumer {
  @override
  Future<dynamic> get(
    String path, {
    Object? data,
    Map<String, dynamic>? queryParams,
  }) async {
    final response = await http.get(
      buildUri(path, queryParams),
      headers: buildHeaders(withContentType: true),
    );
    if (response.statusCode == 200) {
      return response;
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
    final response = await http.post(
      buildUri(path, queryParams),
      body: isFormD(isFormData, data),
      headers: buildHeaders(withContentType: true),
    );
    if (response.statusCode == 200) {
      return response;
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
    final response = await http.put(
      buildUri(path, queryParams),
      body: isFormD(isFormData, data),
      headers: buildHeaders(withContentType: true),
    );
    debugPrint("PUT ${EndPoints.baseUrl}$path ::: BODY: $data");
    if (response.statusCode == 200) {
      return response;
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
    final response = await http.patch(
      buildUri(path, queryParams),
      body: isFormD(isFormData, data),
      headers: buildHeaders(withContentType: true),
    );
    debugPrint("PATCH ${EndPoints.baseUrl}$path ::: BODY: $data");
    if (response.statusCode == 200) {
      return response;
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
    final response = await http.delete(
      buildUri(path, queryParams),
      body: isFormD(isFormData, data),
      headers: buildHeaders(withContentType: true),
    );
    debugPrint("DELETE ${EndPoints.baseUrl}$path");
    if (response.statusCode == 200) {
      return response;
    }
    return handleResponse(response);
  }
}
