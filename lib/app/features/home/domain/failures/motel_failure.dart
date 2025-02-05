class MotelFailure {
  final String message;
  final Object? error;

  MotelFailure({required this.message, this.error});

  @override
  String toString() => 'MotelFailure: $message';
}