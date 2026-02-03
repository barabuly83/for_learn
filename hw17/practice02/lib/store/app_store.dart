import 'package:redux/redux.dart';
import '../models/counter_state.dart';
import '../reducers/counter_reducer.dart';

final Store<CounterState> appStore = Store<CounterState>(
  counterReducer,
  initialState: const CounterState(
    count: 0,
    operations: [],
  ),
);