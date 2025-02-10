import 'package:teste/app/features/home/infra/models/discount_model.dart';

class PeriodModel {
  final String tempoFormatado;
  final String tempo;
  final double valor;
  final double valorTotal;
  final bool temCortesia;
  final DiscountModel? desconto;

  PeriodModel({
    required this.tempoFormatado,
    required this.tempo,
    required this.valor,
    required this.valorTotal,
    required this.temCortesia,
    this.desconto,
  });

  factory PeriodModel.fromJson(Map<String, dynamic> json) {
    return PeriodModel(
      tempoFormatado: json["tempoFormatado"] ?? "",
      tempo: json["tempo"] ?? "",
      valor: (json["valor"] ?? 0).toDouble(),
      valorTotal: (json["valorTotal"] ?? 0).toDouble(),
      temCortesia: json["temCortesia"] ?? false,
      desconto: json["desconto"] != null
          ? DiscountModel.fromJson(json["desconto"])
          : null,
    );
  }

  factory PeriodModel.mocked({
    String? tempoFormatado,
    String? tempo,
    double? valor,
    double? valorTotal,
    bool? temCortesia,
    DiscountModel? desconto,
  }) {
    return PeriodModel(
      tempoFormatado: tempoFormatado ?? '00:00',
      tempo: tempo ?? '0h',
      valor: valor ?? 0.0,
      valorTotal: valorTotal ?? 0.0,
      temCortesia: temCortesia ?? false,
      desconto: desconto ?? DiscountModel.mocked(),
    );
  }
}
