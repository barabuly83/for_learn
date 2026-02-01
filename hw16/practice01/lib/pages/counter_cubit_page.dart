import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/counter_cubit/counter_cubit.dart';
import '../widgets/counter_display.dart';
import '../widgets/counter_buttons.dart';

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
          const CounterButtons(),
        ],
      ),
    );
  }
}