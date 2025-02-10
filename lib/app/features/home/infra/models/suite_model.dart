import 'package:teste/app/features/home/infra/models/category_item_model.dart';
import 'package:teste/app/features/home/infra/models/item_model.dart';
import 'package:teste/app/features/home/infra/models/period_model.dart';

class SuiteModel {
  final String nome;
  final int qtd;
  final bool exibirQtdDisponiveis;
  final List<String> fotos;
  final List<ItemModel> itens;
  final List<CategoryItemModel> categoriaItens;
  final List<PeriodModel> periodos;

  SuiteModel({
    required this.nome,
    required this.qtd,
    required this.exibirQtdDisponiveis,
    required this.fotos,
    required this.itens,
    required this.categoriaItens,
    required this.periodos,
  });

  factory SuiteModel.fromJson(Map<String, dynamic> json) {
    return SuiteModel(
      nome: json["nome"] ?? "",
      qtd: json["qtd"] ?? 0,
      exibirQtdDisponiveis: json["exibirQtdDisponiveis"] ?? false,
      fotos: List<String>.from(json["fotos"] ?? []),
      itens: (json["itens"] as List<dynamic>?)
          ?.map((e) => ItemModel.fromJson(e))
          .toList() ??
          [],
      categoriaItens: (json["categoriaItens"] as List<dynamic>?)
          ?.map((e) => CategoryItemModel.fromJson(e))
          .toList() ??
          [],
      periodos: (json["periodos"] as List<dynamic>?)
          ?.map((e) => PeriodModel.fromJson(e))
          .toList() ??
          [],
    );
  }

  factory SuiteModel.mocked({
    String? nome,
    int? qtd,
    bool? exibirQtdDisponiveis,
    List<String>? fotos,
    List<ItemModel>? itens,
    List<CategoryItemModel>? categoriaItens,
    List<PeriodModel>? periodos,
  }) {
    return SuiteModel(
      nome: nome ?? 'Suite Exemplo',
      qtd: qtd ?? 1,
      exibirQtdDisponiveis: exibirQtdDisponiveis ?? true,
      fotos: fotos ?? [
        'https://example.com/foto1.jpg',
        'https://example.com/foto2.jpg'
      ],
      itens: itens ?? [ItemModel.mocked()],
      categoriaItens: categoriaItens ?? [CategoryItemModel.mocked()],
      periodos: periodos ?? [PeriodModel.mocked()],
    );
  }
}
