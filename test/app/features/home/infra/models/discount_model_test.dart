import 'package:flutter_test/flutter_test.dart';
import 'package:teste/app/features/home/infra/models/discount_model.dart';

void main() {
  group('DiscountModel', () {
    test('mocked retorna valor padrão quando nenhum desconto é informado', () {
      final model = DiscountModel.mocked();
      expect(model.desconto, equals(10.0));
    });

    test('mocked permite sobrescrever o valor padrão', () {
      final model = DiscountModel.mocked(desconto: 15.0);
      expect(model.desconto, equals(15.0));
    });

    test('fromJson cria um objeto válido a partir de um Map com desconto informado', () {
      final jsonMap = {"desconto": 20.0};
      final model = DiscountModel.fromJson(jsonMap);
      expect(model.desconto, equals(20.0));
    });

    test('fromJson cria um objeto válido retornando 0.0 quando a chave desconto está ausente', () {
      final jsonMap = <String, dynamic>{};
      final model = DiscountModel.fromJson(jsonMap);
      expect(model.desconto, equals(0.0));
    });
  });
}
