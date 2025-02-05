import 'package:teste/app/features/home/infra/models/response/get_all_response.dart';

abstract class IMotelService {
  Future<GetAllResponse> getAll();
}