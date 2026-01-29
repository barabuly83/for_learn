import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/counter_bloc/counter_bloc.dart';
import '../widgets/counter_display.dart';

class CounterBlocPage extends StatelessWidget {
  const CounterBlocPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CounterBloc(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Counter with BLoC'),
        ),
        body: const CounterBlocView(),
      ),
    );
  }
}

class CounterBlocView extends StatelessWidget {
  const CounterBlocView({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          BlocBuilder<CounterBloc, CounterState>(
            builder: (context, state) {
              return CounterDisplay(
                count: state.count,
                title: 'BLoC Counter',
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
        context.read<CounterBloc>().add(const CounterIncremented());
      },
      tooltip: 'Increment',
      child: const Icon(Icons.add),
    );
  }

  Widget _buildDecrementButton(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        context.read<CounterBloc>().add(const CounterDecremented());
      },
      tooltip: 'Decrement',
      child: const Icon(Icons.remove),
    );
  }

  Widget _buildResetButton(BuildContext context) {
    return FloatingActionButton.extended(
      onPressed: () {
        context.read<CounterBloc>().add(const CounterReset());
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
