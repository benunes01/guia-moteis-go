import 'dart:convert';

import 'package:teste/app/core/config/client.dart';
import 'package:teste/app/features/home/external/i_motel_service.dart';
import 'package:teste/app/features/home/infra/models/response/get_all_response.dart';

class MotelService implements IMotelService {
  final ApiClient _apiClient;

  MotelService(this._apiClient);

  @override
  Future<GetAllResponse> getAll() async {
    try {
      final response = await _apiClient.get('');
      final jsonData = jsonDecode(response.body);
      print(jsonData);
      return GetAllResponse.fromJson(jsonData);
    } catch (e) {
      throw ApiException(-1, 'Erro ao buscar lista de motéis: $e');
    }
  }
}