import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/counter_cubit/counter_cubit.dart';
import '../widgets/counter_display.dart';

class CounterCubitPage extends StatelessWidget {
  const CounterCubitPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CounterCubit(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Counter with Cubit'),
        ),
        body: const CounterCubitView(),
      ),
    );
  }
}

class CounterCubitView extends StatelessWidget {
  const CounterCubitView({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          BlocBuilder<CounterCubit, int>(
            builder: (context, count) {
              return CounterDisplay(
                count: count,
                title: 'Cubit Counter',
              );
            },
          ),
          const SizedBox(height: 40),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildDecrementButton(context),
              const SizedBox(width: 20),
              _buildResetButton(context),
              const SizedBox(width: 20),
              _buildIncrementButton(context),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildIncrementButton(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        context.read<CounterCubit>().increment();
      },
      tooltip: 'Increment',
      child: const Icon(Icons.add),
    );
  }

  Widget _buildDecrementButton(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        context.read<CounterCubit>().decrement();
      },
      tooltip: 'Decrement',
      child: const Icon(Icons.remove),
    );
  }

  Widget _buildResetButton(BuildContext context) {
    return FloatingActionButton.extended(
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
    );
  }
}
