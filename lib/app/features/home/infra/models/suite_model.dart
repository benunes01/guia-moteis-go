import 'package:teste/app/features/home/infra/models/item_model.dart';
import 'package:teste/app/features/home/infra/models/periodo_model.dart';

class SuiteModel {
  final String nome;
  final int qtd;
  final bool exibirQtdDisponiveis;
  final List<String> fotos;
  final List<ItemModel> itens;
  final List<CategoriaItemModel> categoriaItens;
  final List<PeriodoModel> periodos;

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
          ?.map((e) => CategoriaItemModel.fromJson(e))
          .toList() ??
          [],
      periodos: (json["periodos"] as List<dynamic>?)
          ?.map((e) => PeriodoModel.fromJson(e))
          .toList() ??
          [],
    );
  }
}