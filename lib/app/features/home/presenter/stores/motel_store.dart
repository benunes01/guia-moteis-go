import 'package:bloc/bloc.dart';
import 'package:teste/app/features/home/domain/usecases/get_all_usecase.dart';
import 'package:teste/app/features/home/presenter/states/motel_state.dart';

class MotelStore extends Cubit<MotelState> {
  final GetAllUseCase _getAllUseCase;

  MotelStore(this._getAllUseCase) : super(MotelLoadInProgress());

  Future<void> getAllMotels() async {
    emit(MotelLoadInProgress());

    final result = await _getAllUseCase.call(null);

    result.fold(
          (success) => emit(MotelLoadSuccess(success)),
          (failure) => emit(MotelLoadFailure('Erro ao buscar motéis')),
    );
  }
}
