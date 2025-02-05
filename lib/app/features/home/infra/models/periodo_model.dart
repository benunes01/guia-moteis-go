import 'package:teste/app/features/home/infra/models/desconto_model.dart';

class PeriodoModel {
  final String tempoFormatado;
  final String tempo;
  final double valor;
  final double valorTotal;
  final bool temCortesia;
  final DescontoModel? desconto;

  PeriodoModel({
    required this.tempoFormatado,
    required this.tempo,
    required this.valor,
    required this.valorTotal,
    required this.temCortesia,
    this.desconto,
  });

  factory PeriodoModel.fromJson(Map<String, dynamic> json) {
    return PeriodoModel(
      tempoFormatado: json["tempoFormatado"] ?? "",
      tempo: json["tempo"] ?? "",
      valor: (json["valor"] ?? 0).toDouble(),
      valorTotal: (json["valorTotal"] ?? 0).toDouble(),
      temCortesia: json["temCortesia"] ?? false,
      desconto: json["desconto"] != null ? DescontoModel.fromJson(json["desconto"]) : null,
    );
  }
}
