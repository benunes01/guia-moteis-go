import 'package:result_dart/result_dart.dart';
import 'package:teste/app/core/utils/i_usecase.dart';
import 'package:teste/app/features/home/domain/failures/motel_failure.dart';
import 'package:teste/app/features/home/domain/repositories/i_motel_repository.dart';
import 'package:teste/app/features/home/infra/models/response/get_all_response.dart';

class GetAllUseCase implements IUsecase {
  final IMotelRepository _motelRepository;

  GetAllUseCase(this._motelRepository);

  @override
  AsyncResult<GetAllResponse, MotelFailure> call(params) async {
    return await _motelRepository.getAll();
  }
}