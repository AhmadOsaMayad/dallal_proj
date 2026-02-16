import 'package:dallal_proj/core/api/api_consumer.dart';
import 'package:dallal_proj/core/api/http_api/http_handler.dart';
import 'package:dallal_proj/core/constants/app_texts.dart';
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
    return handleResponse(response);
  }

  @override
  Future<dynamic> post(
    String path, {
    Object? data,
    Map<String, dynamic>? queryParams,
  }) async {
    final response = await http.post(
      buildUri(path, queryParams),
      body: data,
      headers: buildHeaders(),
    );
    return handleResponse(response);
  }

  @override
  Future<dynamic> put(
    String path, {
    Object? data,
    Map<String, dynamic>? queryParams,
  }) async {
    final response = await http.put(
      buildUri(path, queryParams),
      body: data,
      headers: buildHeaders(withContentType: true),
    );
    debugPrint("PUT $kBaseURL$path ::: BODY: $data");
    return handleResponse(response);
  }

  @override
  Future<dynamic> patch(
    String path, {
    Object? data,
    Map<String, dynamic>? queryParams,
  }) async {
    final response = await http.patch(
      buildUri(path, queryParams),
      body: data,
      headers: buildHeaders(withContentType: true),
    );
    debugPrint("PATCH $kBaseURL$path ::: BODY: $data");
    return handleResponse(response, allowNoContent: true);
  }

  @override
  Future<dynamic> delete(
    String path, {
    Object? data,
    Map<String, dynamic>? queryParams,
  }) async {
    final response = await http.delete(
      buildUri(path, queryParams),
      headers: buildHeaders(withContentType: true),
    );
    debugPrint("DELETE $kBaseURL$path");
    return handleResponse(response, allowNoContent: true);
  }
}
