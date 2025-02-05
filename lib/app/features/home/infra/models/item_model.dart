class ItemModel {
  final String nome;

  ItemModel({required this.nome});

  factory ItemModel.fromJson(Map<String, dynamic> json) {
    return ItemModel(
      nome: json["nome"] ?? "",
    );
  }
}

class CategoriaItemModel {
  final String nome;
  final String icone;

  CategoriaItemModel({required this.nome, required this.icone});

  factory CategoriaItemModel.fromJson(Map<String, dynamic> json) {
    return CategoriaItemModel(
      nome: json["nome"] ?? "",
      icone: json["icone"] ?? "",
    );
  }
}