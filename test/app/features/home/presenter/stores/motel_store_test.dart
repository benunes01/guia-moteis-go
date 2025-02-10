import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:result_dart/result_dart.dart';
import 'package:teste/app/features/home/domain/failures/motel_failure.dart';
import 'package:teste/app/features/home/domain/usecases/get_all_usecase.dart';
import 'package:teste/app/features/home/infra/models/response/get_all_response.dart';
import 'package:teste/app/features/home/presenter/states/motel_state.dart';
import 'package:teste/app/features/home/presenter/stores/motel_store.dart';

class MockGetAllUseCase extends Mock implements GetAllUseCase {}

void main() {
  late MotelStore motelStore;
  late MockGetAllUseCase mockGetAllUseCase;

  setUp(() {
    mockGetAllUseCase = MockGetAllUseCase();
    motelStore = MotelStore(mockGetAllUseCase);
  });

  group('MotelStore', () {
    blocTest<MotelStore, MotelState>(
      'emits [MotelLoadInProgress, MotelLoadSuccess] when getAllMotels returns success',
      build: () {
        final response = GetAllResponse.mocked();
        when(() => mockGetAllUseCase.call(null))
            .thenAnswer((_) async => Result.success(response));
        return motelStore;
      },
      act: (store) async => await store.getAllMotels(),
      expect: () => [
        isA<MotelLoadInProgress>(),
        isA<MotelLoadSuccess>().having(
              (state) => state.response,
          'response',
          isA<GetAllResponse>(),
        ),
      ],
    );

    blocTest<MotelStore, MotelState>(
      'emits [MotelLoadInProgress, MotelLoadFailure] when getAllMotels returns failure',
      build: () {
        when(() => mockGetAllUseCase.call(null))
            .thenAnswer((_) async => Result.failure(MotelFailure(message: 'Erro ao buscar motéis')));
        return motelStore;
      },
      act: (store) async => await store.getAllMotels(),
      expect: () => [
        isA<MotelLoadInProgress>(),
        isA<MotelLoadFailure>().having(
              (state) => state.message,
          'message',
          'Erro ao buscar motéis',
        ),
      ],
    );
  });
}
