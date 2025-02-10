import 'package:flutter_test/flutter_test.dart';
import 'package:teste/app/features/home/infra/models/category_item_model.dart';

void main() {
  group('CategoryItemModel', () {
    test('mocked retorna valores padrão quando nenhum parâmetro é informado', () {
      final model = CategoryItemModel.mocked();
      expect(model.nome, equals('Categoria Exemplo'));
      expect(model.icone, equals('icone_exemplo.png'));
    });

    test('mocked permite sobrescrever os valores padrão', () {
      final model = CategoryItemModel.mocked(
        nome: 'Nova Categoria',
        icone: 'novo_icone.png',
      );
      expect(model.nome, equals('Nova Categoria'));
      expect(model.icone, equals('novo_icone.png'));
    });

    test('fromJson cria um objeto válido a partir de um Map', () {
      final jsonMap = {
        'nome': 'Test Category',
        'icone': 'test_icon.png',
      };

      final model = CategoryItemModel.fromJson(jsonMap);
      expect(model.nome, equals('Test Category'));
      expect(model.icone, equals('test_icon.png'));
    });

    test('dois objetos com os mesmos valores possuem campos iguais', () {
      final model1 = CategoryItemModel.mocked();
      final model2 = CategoryItemModel.mocked();

      expect(model1.nome, equals(model2.nome));
      expect(model1.icone, equals(model2.icone));

      expect(model1 == model2, isFalse);
    });
  });
}
