import 'package:bloc/bloc.dart'; // Изменено: импорт из bloc, а не flutter_bloc
import 'package:equatable/equatable.dart';

part 'counter_event.dart';
part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(const CounterState(count: 0)) {
    on<CounterIncremented>(_onIncremented);
    on<CounterDecremented>(_onDecremented);
    on<CounterReset>(_onReset);
  }

  Future<void> _onIncremented(
    CounterIncremented event,
    Emitter<CounterState> emit,
  ) async {
    emit(state.copyWith(count: state.count + 1));
  }

  Future<void> _onDecremented(
    CounterDecremented event,
    Emitter<CounterState> emit,
  ) async {
    emit(state.copyWith(count: state.count - 1));
  }

  Future<void> _onReset(
    CounterReset event,
    Emitter<CounterState> emit,
  ) async {
    emit(state.copyWith(count: 0));
  }
}
