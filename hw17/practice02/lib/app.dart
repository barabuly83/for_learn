import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'store/app_store.dart';
import 'widgets/counter_widget.dart';
import 'widgets/counter_buttons_widget.dart';
import 'widgets/operation_history_widget.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return StoreProvider(
      store: appStore,
      child: MaterialApp(
        title: 'Counter with Operation History',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
          useMaterial3: true,
        ),
        home: const CounterPage(),
      ),
    );
  }
}

class CounterPage extends StatelessWidget {
  const CounterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter with Operation History'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: const Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            CounterWidget(),
            SizedBox(height: 24),
            CounterButtonsWidget(),
            SizedBox(height: 24),
            Expanded(
              child: OperationHistoryWidget(),
            ),
          ],
        ),
      ),
    );
  }
}