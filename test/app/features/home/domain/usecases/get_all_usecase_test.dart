import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:result_dart/result_dart.dart';
import 'package:teste/app/features/home/domain/failures/motel_failure.dart';
import 'package:teste/app/features/home/domain/repositories/i_motel_repository.dart';
import 'package:teste/app/features/home/domain/usecases/get_all_usecase.dart';
import 'package:teste/app/features/home/infra/models/response/get_all_response.dart';

class MockMotelRepository extends Mock implements IMotelRepository {}

void main() {
  late IMotelRepository repository;
  late GetAllUseCase useCase;
  late GetAllResponse response;

  setUp(() {
    repository = MockMotelRepository();
    useCase = GetAllUseCase(repository);
    response = GetAllResponse.mocked();

  });

  test('should return GetAllResponse when call getAllUseCase successfully', () async {
    // Arrange
    when(() => repository.getAll())
        .thenAnswer((_) async => Result.success(response));

    // Action
    final result = await useCase.call(null);

    // Assert
    verify(() => repository.getAll()).called(1);
    expect(result, isA<Result<GetAllResponse, MotelFailure>>());
    expect(result.isSuccess(), true);
  });
}
