class DescontoModel {
  final double desconto;

  DescontoModel({required this.desconto});

  factory DescontoModel.fromJson(Map<String, dynamic> json) {
    return DescontoModel(
      desconto: (json["desconto"] ?? 0).toDouble(),
    );
  }
}