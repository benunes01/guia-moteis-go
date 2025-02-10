class CategoryItemModel {
  final String nome;
  final String icone;

  CategoryItemModel({required this.nome, required this.icone});

  factory CategoryItemModel.fromJson(Map<String, dynamic> json) {
    return CategoryItemModel(
      nome: json["nome"] ?? "",
      icone: json["icone"] ?? "",
    );
  }

  factory CategoryItemModel.mocked({
    String? nome,
    String? icone,
  }) {
    return CategoryItemModel(
      nome: nome ?? 'Categoria Exemplo',
      icone: icone ?? 'icone_exemplo.png',
    );
  }
}
