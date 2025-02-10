// coverage:ignore-file
import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;

class ApiClient {
  final http.Client _client;
  static const String _primaryBaseUrl = 'https://www.jsonkeeper.com/b/1IXK';
  static const String _fallbackBaseUrl = 'https://www.npoint.io/docs/e728bb91e0cd56cc0711';

  String _baseUrl = _primaryBaseUrl;

  ApiClient({http.Client? client}) : _client = client ?? http.Client();

  Future<http.Response> get(String endpoint, {Map<String, String>? headers}) async {
    return _handleRequest(() => _client.get(Uri.parse('$_baseUrl$endpoint'), headers: headers));
  }

  Future<http.Response> post(String endpoint,
      {Map<String, String>? headers, Object? body}) async {
    return _handleRequest(() => _client.post(
      Uri.parse('$_baseUrl$endpoint'),
      headers: headers,
      body: jsonEncode(body),
    ));
  }

  Future<http.Response> put(String endpoint,
      {Map<String, String>? headers, Object? body}) async {
    return _handleRequest(() => _client.put(
      Uri.parse('$_baseUrl$endpoint'),
      headers: headers,
      body: jsonEncode(body),
    ));
  }

  Future<http.Response> delete(String endpoint, {Map<String, String>? headers}) async {
    return _handleRequest(() => _client.delete(Uri.parse('$_baseUrl$endpoint'), headers: headers));
  }

  Future<http.Response> _handleRequest(Future<http.Response> Function() request) async {
    try {
      final response = await request();
      _logResponse(response);
      if (_isSuccessful(response.statusCode)) {
        return response;
      } else {
        throw ApiException(response.statusCode, response.body);
      }
    } catch (e) {
      // Se falhar na URL primária, tenta a fallback URL
      if (_baseUrl == _primaryBaseUrl) {
        log('[HTTP] Falha na URL primária, tentando fallback...');
        _baseUrl = _fallbackBaseUrl;
        return _handleRequest(request);
      }
      throw ApiException(-1, 'Erro na requisição: $e');
    }
  }

  bool _isSuccessful(int statusCode) => statusCode >= 200 && statusCode < 300;

  void _logResponse(http.Response response) {
    log('[HTTP] ${response.request?.method} ${response.request?.url}');
    log('[HTTP] Status: ${response.statusCode}');
    log('[HTTP] Response: ${response.body}');
  }

  void close() {
    _client.close();
  }
}

class ApiException implements Exception {
  final int statusCode;
  final String message;

  ApiException(this.statusCode, this.message);

  @override
  String toString() => 'ApiException ($statusCode): $message';
}
