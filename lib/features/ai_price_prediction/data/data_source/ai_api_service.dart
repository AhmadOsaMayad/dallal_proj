import 'dart:convert';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

/// API Service for the local AI model connection.
class AiApiService {
  /// The base URL for the local AI prediction server.
  ///
  /// Update [_laptopIp] to match your development machine's local IP address.
  static const String _laptopIp = '192.168.1.8';

  String get baseUrl {
    if (kIsWeb) {
      return 'http://127.0.0.1:8000';
    }
    return 'http://$_laptopIp:8000';
  }

  final Duration _timeout = const Duration(seconds: 30);

  /// Makes a POST request to the AI prediction endpoint.
  ///
  /// Throws:
  /// - [SocketException] when there's no network connection
  /// - [HttpException] when the server returns a non-200 status
  /// - [FormatException] when the response is not valid JSON
  Future<Map<String, dynamic>> predictPrice({
    required Map<String, dynamic> requestBody,
  }) async {
    final url = Uri.parse('$baseUrl/predict');

    try {
      final response = await http
          .post(
            url,
            headers: {
              'Content-Type': 'application/json',
              'Accept': 'application/json',
            },
            body: jsonEncode(requestBody),
          )
          .timeout(_timeout);

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = jsonDecode(response.body);
        return data;
      } else {
        throw HttpException(
          'AI Server Error: Status ${response.statusCode} - ${response.body}',
        );
      }
    } on SocketException {
      rethrow;
    } on http.ClientException catch (e) {
      throw SocketException('Connection failed: ${e.message}');
    } on FormatException {
      rethrow;
    }
  }

  /// Test the connection to the AI server.
  Future<bool> testConnection() async {
    try {
      final response = await http
          .get(Uri.parse(baseUrl))
          .timeout(const Duration(seconds: 5));
      // Even if we get 404, it means the server is running
      return response.statusCode == 200 || response.statusCode == 404;
    } catch (e) {
      return false;
    }
  }
}
