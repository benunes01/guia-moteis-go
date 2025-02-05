import 'package:teste/app/features/home/infra/models/motel_model.dart';

class GetAllResponse {
  final bool sucesso;
  final DataModel data;
  final List<String> mensagem;

  GetAllResponse({required this.sucesso, required this.data, required this.mensagem});

  factory GetAllResponse.fromJson(Map<String, dynamic> json) {
    return GetAllResponse(
      sucesso: json["sucesso"] ?? false,
      data: DataModel.fromJson(json["data"] ?? {}),
      mensagem: List<String>.from(json["mensagem"] ?? []),
    );
  }
}

class DataModel {
  final int pagina;
  final int qtdPorPagina;
  final int totalSuites;
  final int totalMoteis;
  final double raio;
  final double maxPaginas;
  final List<MotelModel> moteis;

  DataModel({
    required this.pagina,
    required this.qtdPorPagina,
    required this.totalSuites,
    required this.totalMoteis,
    required this.raio,
    required this.maxPaginas,
    required this.moteis,
  });

  factory DataModel.fromJson(Map<String, dynamic> json) {
    return DataModel(
      pagina: json["pagina"] ?? 0,
      qtdPorPagina: json["qtdPorPagina"] ?? 0,
      totalSuites: json["totalSuites"] ?? 0,
      totalMoteis: json["totalMoteis"] ?? 0,
      raio: (json["raio"] ?? 0).toDouble(),
      maxPaginas: (json["maxPaginas"] ?? 0).toDouble(),
      moteis: (json["moteis"] as List<dynamic>?)
          ?.map((e) => MotelModel.fromJson(e))
          .toList() ??
          [],
    );
  }
}