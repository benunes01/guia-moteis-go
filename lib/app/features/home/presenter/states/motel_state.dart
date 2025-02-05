// coverage:ignore-file
import 'package:equatable/equatable.dart';
import 'package:teste/app/features/home/infra/models/response/get_all_response.dart';

abstract class MotelState extends Equatable {
  @override
  List<Object> get props => [];
}

class MotelLoadInProgress extends MotelState {}

class MotelLoadSuccess extends MotelState {
  final GetAllResponse response;

  MotelLoadSuccess(this.response);

  @override
  List<Object> get props => [response];
}

class MotelLoadFailure extends MotelState {
  final String message;

  MotelLoadFailure(this.message);

  @override
  List<Object> get props => [message];
}
