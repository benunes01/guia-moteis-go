import 'package:flutter_test/flutter_test.dart';
import 'package:teste/app/features/home/infra/models/discount_model.dart';
import 'package:teste/app/features/home/infra/models/period_model.dart';

void main() {
  group('PeriodModel', () {
    test('mocked retorna os valores padrão quando nenhum parâmetro é informado', () {
      final model = PeriodModel.mocked();
      expect(model.tempoFormatado, equals('00:00'));
      expect(model.tempo, equals('0h'));
      expect(model.valor, equals(0.0));
      expect(model.valorTotal, equals(0.0));
      expect(model.temCortesia, equals(false));
      final expectedDiscount = DiscountModel.mocked();
      expect(model.desconto?.desconto, equals(expectedDiscount.desconto));
    });

    test('mocked permite sobrescrever os valores padrão', () {
      final customDiscount = DiscountModel.mocked(desconto: 20.0);
      final model = PeriodModel.mocked(
        tempoFormatado: '12:34',
        tempo: '2h',
        valor: 50.0,
        valorTotal: 100.0,
        temCortesia: true,
        desconto: customDiscount,
      );
      expect(model.tempoFormatado, equals('12:34'));
      expect(model.tempo, equals('2h'));
      expect(model.valor, equals(50.0));
      expect(model.valorTotal, equals(100.0));
      expect(model.temCortesia, equals(true));
      expect(model.desconto?.desconto, equals(20.0));
    });

    test('fromJson cria um objeto válido a partir de um Map com todos os campos', () {
      final jsonMap = {
        'tempoFormatado': '08:00',
        'tempo': '1h',
        'valor': 30.0,
        'valorTotal': 60.0,
        'temCortesia': true,
        'desconto': {
          'desconto': 5.0,
        },
      };
      final model = PeriodModel.fromJson(jsonMap);
      expect(model.tempoFormatado, equals('08:00'));
      expect(model.tempo, equals('1h'));
      expect(model.valor, equals(30.0));
      expect(model.valorTotal, equals(60.0));
      expect(model.temCortesia, equals(true));
      expect(model.desconto?.desconto, equals(5.0));
    });

    test('fromJson retorna valores padrão para campos ausentes', () {
      final jsonMap = <String, dynamic>{};
      final model = PeriodModel.fromJson(jsonMap);
      expect(model.tempoFormatado, equals(''));
      expect(model.tempo, equals(''));
      expect(model.valor, equals(0.0));
      expect(model.valorTotal, equals(0.0));
      expect(model.temCortesia, equals(false));
      expect(model.desconto, isNull);
    });
  });
}
