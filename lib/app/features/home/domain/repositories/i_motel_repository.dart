import 'package:result_dart/result_dart.dart';
import 'package:teste/app/features/home/domain/failures/motel_failure.dart';
import 'package:teste/app/features/home/infra/models/response/get_all_response.dart';

abstract class IMotelRepository {
  AsyncResult<GetAllResponse, MotelFailure> getAll();
}