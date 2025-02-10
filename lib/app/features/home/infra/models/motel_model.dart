import 'package:teste/app/features/home/infra/models/suite_model.dart';

class MotelModel {
  final String fantasia;
  final String logo;
  final String bairro;
  final double distancia;
  final int qtdFavoritos;
  final List<SuiteModel> suites;
  final int qtdAvaliacoes;
  final double media;

  MotelModel({
    required this.fantasia,
    required this.logo,
    required this.bairro,
    required this.distancia,
    required this.qtdFavoritos,
    required this.suites,
    required this.qtdAvaliacoes,
    required this.media,
  });

  factory MotelModel.fromJson(Map<String, dynamic> json) {
    return MotelModel(
      fantasia: json["fantasia"] ?? "",
      logo: json["logo"] ?? "",
      bairro: json["bairro"] ?? "",
      distancia: (json["distancia"] ?? 0).toDouble(),
      qtdFavoritos: json["qtdFavoritos"] ?? 0,
      suites: (json["suites"] as List<dynamic>?)
          ?.map((e) => SuiteModel.fromJson(e))
          .toList() ??
          [],
      qtdAvaliacoes: json["qtdAvaliacoes"] ?? 0,
      media: (json["media"] ?? 0).toDouble(),
    );
  }

  factory MotelModel.mocked({
    String? fantasia,
    String? logo,
    String? bairro,
    double? distancia,
    int? qtdFavoritos,
    List<SuiteModel>? suites,
    int? qtdAvaliacoes,
    double? media,
  }) {
    return MotelModel(
      fantasia: fantasia ?? 'Motel Exemplo',
      logo: logo ?? 'https://example.com/logo.png',
      bairro: bairro ?? 'Bairro Exemplo',
      distancia: distancia ?? 1.0,
      qtdFavoritos: qtdFavoritos ?? 10,
      suites: suites ?? [SuiteModel.mocked()],
      qtdAvaliacoes: qtdAvaliacoes ?? 5,
      media: media ?? 4.5,
    );
  }
}
