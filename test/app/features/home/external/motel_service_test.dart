import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:mocktail/mocktail.dart';
import 'package:teste/app/core/config/client.dart';
import 'package:teste/app/features/home/external/motel_service.dart';
import 'package:teste/app/features/home/infra/models/response/get_all_response.dart';

class ApiClientMock extends Mock implements ApiClient {}

void main() {
  late ApiClientMock apiClientMock;
  late MotelService motelService;

  setUp(() {
    apiClientMock = ApiClientMock();
    motelService = MotelService(apiClientMock);
  });

  group('MotelService', () {
    test('deve retornar GetAllResponse quando getAll for bem-sucedido', () async {

      final jsonMap = {
        "sucesso": true,
        "data": {
          "pagina": 1,
          "qtdPorPagina": 10,
          "totalSuites": 20,
          "totalMoteis": 5,
          "raio": 1.0,
          "maxPaginas": 1.0,
          "moteis": []
        },
        "mensagem": ["Mensagem de exemplo"]
      };
      final jsonString = jsonEncode(jsonMap);

      final requestObj = Request('GET', Uri.parse('http://example.com'));

      final fakeResponse = Response(
        jsonString,
        200,
        request: requestObj,
        headers: {"content-type": "application/json"},
      );

      when(() => apiClientMock.get('')).thenAnswer((_) async => fakeResponse);

      final result = await motelService.getAll();

      expect(result, isA<GetAllResponse>());
      expect(result.sucesso, isTrue);
      expect(result.data.pagina, 1);
      expect(result.mensagem, ["Mensagem de exemplo"]);
    });

    test('deve lançar ApiException quando getAll falhar', () async {
      final exception = Exception('Erro de teste');
      when(() => apiClientMock.get('')).thenThrow(exception);

      expect(() async => await motelService.getAll(),
          throwsA(isA<ApiException>()));
    });
  });
}
