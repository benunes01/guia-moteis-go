class DiscountModel {
  final double desconto;

  DiscountModel({required this.desconto});

  factory DiscountModel.fromJson(Map<String, dynamic> json) {
    return DiscountModel(
      desconto: (json["desconto"] ?? 0).toDouble(),
    );
  }

  factory DiscountModel.mocked({
    double? desconto,
  }) {
    return DiscountModel(
      desconto: desconto ?? 10.0,
    );
  }
}
