import 'package:result_dart/src/async_result.dart';
import 'package:result_dart/src/result.dart';
import 'package:teste/app/features/home/domain/failures/motel_failure.dart';
import 'package:teste/app/features/home/domain/repositories/i_motel_repository.dart';
import 'package:teste/app/features/home/external/i_motel_service.dart';
import 'package:teste/app/features/home/infra/models/response/get_all_response.dart';

class MotelRepository implements IMotelRepository {
  final IMotelService _motelService;

  MotelRepository(this._motelService);

  @override
  AsyncResult<GetAllResponse, MotelFailure> getAll() async {
    try {
      final response = await _motelService.getAll();
      return Success(response);
    } catch (e) {
      return Failure(MotelFailure(message: 'Erro ao buscar motéis', error: e));
    }
  }
}