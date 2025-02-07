class ItemModel {
  final String nome;

  ItemModel({required this.nome});

  factory ItemModel.fromJson(Map<String, dynamic> json) {
    return ItemModel(
      nome: json["nome"] ?? "",
    );
  }
}