import 'package:flutter_test/flutter_test.dart';
import 'package:teste/app/features/home/infra/models/motel_model.dart';
import 'package:teste/app/features/home/infra/models/suite_model.dart';

void main() {
  group('MotelModel', () {
    test('mocked retorna os valores padrão quando nenhum parâmetro é informado', () {
      final motel = MotelModel.mocked();

      expect(motel.fantasia, equals('Motel Exemplo'));
      expect(motel.logo, equals('https://example.com/logo.png'));
      expect(motel.bairro, equals('Bairro Exemplo'));
      expect(motel.distancia, equals(1.0));
      expect(motel.qtdFavoritos, equals(10));
      expect(motel.qtdAvaliacoes, equals(5));
      expect(motel.media, equals(4.5));

      expect(motel.suites, isNotEmpty);
      final defaultSuite = SuiteModel.mocked();
      expect(motel.suites.first.nome, equals(defaultSuite.nome));
    });

    test('mocked permite sobrescrever os valores padrão', () {
      final customSuite = SuiteModel.mocked(
        nome: 'Suite Customizada',
      );
      final motel = MotelModel.mocked(
        fantasia: 'Custom Motel',
        logo: 'https://custom.com/logo.png',
        bairro: 'Custom Bairro',
        distancia: 2.0,
        qtdFavoritos: 20,
        suites: [customSuite],
        qtdAvaliacoes: 10,
        media: 3.5,
      );

      expect(motel.fantasia, equals('Custom Motel'));
      expect(motel.logo, equals('https://custom.com/logo.png'));
      expect(motel.bairro, equals('Custom Bairro'));
      expect(motel.distancia, equals(2.0));
      expect(motel.qtdFavoritos, equals(20));
      expect(motel.qtdAvaliacoes, equals(10));
      expect(motel.media, equals(3.5));
      expect(motel.suites, equals([customSuite]));
    });

    test('fromJson cria um objeto válido a partir de um Map completo', () {
      final jsonMap = {
        'fantasia': 'Motel Test',
        'logo': 'https://test.com/logo.png',
        'bairro': 'Test Bairro',
        'distancia': 2.5,
        'qtdFavoritos': 15,
        'suites': [
          {
            'nome': 'Suite Test',
            'qtd': 2,
            'exibirQtdDisponiveis': true,
            'fotos': ['url1', 'url2'],
            'itens': [],
            'categoriaItens': [],
            'periodos': [],
          }
        ],
        'qtdAvaliacoes': 8,
        'media': 3.5,
      };

      final motel = MotelModel.fromJson(jsonMap);

      expect(motel.fantasia, equals('Motel Test'));
      expect(motel.logo, equals('https://test.com/logo.png'));
      expect(motel.bairro, equals('Test Bairro'));
      expect(motel.distancia, equals(2.5));
      expect(motel.qtdFavoritos, equals(15));
      expect(motel.qtdAvaliacoes, equals(8));
      expect(motel.media, equals(3.5));

      expect(motel.suites, isA<List>());
      expect(motel.suites.length, equals(1));
      expect(motel.suites.first.nome, equals('Suite Test'));
    });

    test('fromJson retorna valores default quando campos estão ausentes', () {
      final jsonMap = <String, dynamic>{};
      final motel = MotelModel.fromJson(jsonMap);

      expect(motel.fantasia, equals(''));
      expect(motel.logo, equals(''));
      expect(motel.bairro, equals(''));
      expect(motel.distancia, equals(0.0));
      expect(motel.qtdFavoritos, equals(0));
      expect(motel.qtdAvaliacoes, equals(0));
      expect(motel.media, equals(0.0));
      expect(motel.suites, isEmpty);
    });
  });
}
