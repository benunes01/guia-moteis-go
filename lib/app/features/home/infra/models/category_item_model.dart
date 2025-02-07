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
}