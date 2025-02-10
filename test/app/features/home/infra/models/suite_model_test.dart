import 'package:flutter_test/flutter_test.dart';
import 'package:teste/app/features/home/infra/models/category_item_model.dart';
import 'package:teste/app/features/home/infra/models/item_model.dart';
import 'package:teste/app/features/home/infra/models/period_model.dart';
import 'package:teste/app/features/home/infra/models/suite_model.dart';

void main() {
  group('SuiteModel', () {
    test('mocked retorna os valores padrão quando nenhum parâmetro é informado', () {
      final suite = SuiteModel.mocked();

      expect(suite.nome, equals('Suite Exemplo'));
      expect(suite.qtd, equals(1));
      expect(suite.exibirQtdDisponiveis, equals(true));
      expect(
        suite.fotos,
        equals([
          'https://example.com/foto1.jpg',
          'https://example.com/foto2.jpg'
        ]),
      );

      expect(suite.itens, isNotEmpty);
      expect(suite.itens.first.nome, equals(ItemModel.mocked().nome));

      expect(suite.categoriaItens, isNotEmpty);
      expect(suite.categoriaItens.first.nome,
          equals(CategoryItemModel.mocked().nome));

      expect(suite.periodos, isNotEmpty);
      expect(suite.periodos.first.tempoFormatado,
          equals(PeriodModel.mocked().tempoFormatado));
    });

    test('mocked permite sobrescrever os valores padrão', () {
      final customSuite = SuiteModel.mocked(
        nome: 'Custom Suite',
        qtd: 5,
        exibirQtdDisponiveis: false,
        fotos: ['custom_foto1.jpg'],
        itens: [ItemModel.mocked(nome: 'Custom Item')],
        categoriaItens: [CategoryItemModel.mocked(nome: 'Custom Category')],
        periodos: [PeriodModel.mocked(tempoFormatado: '10:00')],
      );

      expect(customSuite.nome, equals('Custom Suite'));
      expect(customSuite.qtd, equals(5));
      expect(customSuite.exibirQtdDisponiveis, equals(false));
      expect(customSuite.fotos, equals(['custom_foto1.jpg']));
      expect(customSuite.itens.first.nome, equals('Custom Item'));
      expect(customSuite.categoriaItens.first.nome, equals('Custom Category'));
      expect(customSuite.periodos.first.tempoFormatado, equals('10:00'));
    });

    test('fromJson cria um objeto válido a partir de um Map completo', () {
      final jsonMap = {
        'nome': 'Suite Test',
        'qtd': 3,
        'exibirQtdDisponiveis': true,
        'fotos': ['foto1.jpg', 'foto2.jpg'],
        'itens': [
          {
            'nome': 'Item Test',
          }
        ],
        'categoriaItens': [
          {
            'nome': 'Category Test',
            'icone': 'icon.png',
          }
        ],
        'periodos': [
          {
            'tempoFormatado': '09:00',
            'tempo': '1h',
            'valor': 100.0,
            'valorTotal': 200.0,
            'temCortesia': false,
            'desconto': {
              'desconto': 15.0,
            },
          }
        ],
      };

      final suite = SuiteModel.fromJson(jsonMap);

      expect(suite.nome, equals('Suite Test'));
      expect(suite.qtd, equals(3));
      expect(suite.exibirQtdDisponiveis, equals(true));
      expect(suite.fotos, equals(['foto1.jpg', 'foto2.jpg']));

      expect(suite.itens, isA<List<ItemModel>>());
      expect(suite.itens.length, equals(1));
      expect(suite.itens.first.nome, equals('Item Test'));

      expect(suite.categoriaItens, isA<List<CategoryItemModel>>());
      expect(suite.categoriaItens.length, equals(1));
      expect(suite.categoriaItens.first.nome, equals('Category Test'));
      expect(suite.categoriaItens.first.icone, equals('icon.png'));

      expect(suite.periodos, isA<List<PeriodModel>>());
      expect(suite.periodos.length, equals(1));
      final period = suite.periodos.first;
      expect(period.tempoFormatado, equals('09:00'));
      expect(period.tempo, equals('1h'));
      expect(period.valor, equals(100.0));
      expect(period.valorTotal, equals(200.0));
      expect(period.temCortesia, equals(false));
      expect(period.desconto?.desconto, equals(15.0));
    });

    test('fromJson retorna valores default quando campos estão ausentes', () {
      final jsonMap = <String, dynamic>{};
      final suite = SuiteModel.fromJson(jsonMap);

      expect(suite.nome, equals(''));
      expect(suite.qtd, equals(0));
      expect(suite.exibirQtdDisponiveis, equals(false));
      expect(suite.fotos, equals([]));
      expect(suite.itens, equals([]));
      expect(suite.categoriaItens, equals([]));
      expect(suite.periodos, equals([]));
    });
  });
}
