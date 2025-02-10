import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:teste/app/features/home/external/i_motel_service.dart';
import 'package:teste/app/features/home/infra/models/response/get_all_response.dart';
import 'package:teste/app/features/home/infra/repositories/motel_repository.dart';

class MockMotelService extends Mock implements IMotelService {}

void main() {
  late MockMotelService mockMotelService;
  late MotelRepository motelRepository;
  late GetAllResponse response;

  setUp(() {
    mockMotelService = MockMotelService();
    motelRepository = MotelRepository(mockMotelService);
    response = GetAllResponse.mocked();
  });

  group('MotelRepository Tests', () {
    test('should return success when IMotelService.getAll returns a valid response', () async {
      // Arrange
      when(() => mockMotelService.getAll())
          .thenAnswer((_) async => response);

      // Action
      final result = await motelRepository.getAll();

      // Assert
      verify(() => mockMotelService.getAll()).called(1);
      expect(result.isSuccess(), isTrue);
      result.fold(
            (success) => expect(success, equals(response)),
            (failure) => fail('Expected success but got failure: $failure'),
      );
    });

    test('should return failure when IMotelService.getAll throws an exception', () async {
      // Arrange
      final exception = Exception('Test exception');
      when(() => mockMotelService.getAll())
          .thenThrow(exception);

      // Action
      final result = await motelRepository.getAll();

      // Assert
      verify(() => mockMotelService.getAll()).called(1);
      result.fold(
            (success) => fail('Expected failure but got success: $success'),
            (failure) {
          expect(failure.message, equals('Erro ao buscar motéis'));
          expect(failure.error, equals(exception));
        },
      );
    });
  });
}
