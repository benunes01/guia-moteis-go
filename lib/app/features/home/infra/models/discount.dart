class DiscountModel {
  final double desconto;

  DiscountModel({required this.desconto});

  factory DiscountModel.fromJson(Map<String, dynamic> json) {
    return DiscountModel(
      desconto: (json["desconto"] ?? 0).toDouble(),
    );
  }
}