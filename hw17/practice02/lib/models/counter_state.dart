class CounterState {
  final int count;
  final List<String> operations;

  const CounterState({
    required this.count,
    required this.operations,
  });

  CounterState copyWith({
    int? count,
    List<String>? operations,
  }) {
    return CounterState(
      count: count ?? this.count,
      operations: operations ?? this.operations,
    );
  }

  int get totalOperations => operations.length;
}