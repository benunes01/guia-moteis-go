class ItemModel {
  final String nome;

  ItemModel({required this.nome});

  factory ItemModel.fromJson(Map<String, dynamic> json) {
    return ItemModel(
      nome: json["nome"] ?? "",
    );
  }

  factory ItemModel.mocked({
    String? nome,
  }) {
    return ItemModel(
      nome: nome ?? 'Item Exemplo',
    );
  }
}
