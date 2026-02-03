import '../models/counter_state.dart';
import '../actions/counter_actions.dart';

CounterState counterReducer(CounterState state, dynamic action) {
  if (action is IncrementAction) {
    final newCount = state.count + 1;
    final newOperations = List<String>.from(state.operations)
      ..add('Incremented: +1 (Total: $newCount)');

    return state.copyWith(
      count: newCount,
      operations: newOperations,
    );
  }

  if (action is DecrementAction) {
    final newCount = state.count - 1;
    final newOperations = List<String>.from(state.operations)
      ..add('Decremented: -1 (Total: $newCount)');

    return state.copyWith(
      count: newCount,
      operations: newOperations,
    );
  }

  return state;
}