import 'package:dallal_proj/core/api/api_consumer.dart';
import 'package:dallal_proj/core/api/http_api/http_handler.dart';
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
    dynamic data,
    Map<String, dynamic>? queryParams,
    bool isFormData = false,
  }) async {
    final response = await http.post(
      buildUri(path, queryParams),
      body: isFormD(isFormData, data),
      headers: buildHeaders(),
    );
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
    return handleResponse(response, allowNoContent: true);
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
    return handleResponse(response, allowNoContent: true);
  }
}
