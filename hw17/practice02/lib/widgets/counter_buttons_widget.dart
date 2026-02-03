import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import '../models/counter_state.dart';
import '../actions/counter_actions.dart';

class CounterButtonsWidget extends StatelessWidget {
  const CounterButtonsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return StoreConnector<CounterState, VoidCallback>(
      converter: (store) => () => store.dispatch(IncrementAction()),
      builder: (context, incrementCallback) {
        return StoreConnector<CounterState, VoidCallback>(
          converter: (store) => () => store.dispatch(DecrementAction()),
          builder: (context, decrementCallback) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton.icon(
                  onPressed: decrementCallback,
                  icon: const Icon(Icons.remove),
                  label: const Text('Decrement'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 24,
                      vertical: 12,
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                ElevatedButton.icon(
                  onPressed: incrementCallback,
                  icon: const Icon(Icons.add),
                  label: const Text('Increment'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 24,
                      vertical: 12,
                    ),
                  ),
                ),
              ],
            );
          },
        );
      },
    );
  }
}