import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/counter_cubit/counter_cubit.dart';

class CounterButtons extends StatelessWidget {
  const CounterButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        FloatingActionButton(
          heroTag: 'cubit_decrement',
          onPressed: () {
            context.read<CounterCubit>().decrement();
          },
          tooltip: 'Decrement',
          child: const Icon(Icons.remove),
        ),
        const SizedBox(width: 20),
        FloatingActionButton.extended(
          onPressed: () {
            context.read<CounterCubit>().reset();
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Counter has been reset to 0!'),
                duration: Duration(seconds: 2),
              ),
            );
          },
          icon: const Icon(Icons.restart_alt),
          label: const Text('Reset'),
          backgroundColor: Colors.deepOrange,
        ),
        const SizedBox(width: 20),
        FloatingActionButton(
          onPressed: () {
            context.read<CounterCubit>().increment();
          },
          tooltip: 'Increment',
          child: const Icon(Icons.add),
        ),
      ],
    );
  }
}