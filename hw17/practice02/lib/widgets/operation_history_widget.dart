import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import '../models/counter_state.dart';

class OperationHistoryWidget extends StatelessWidget {
  const OperationHistoryWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return StoreConnector<CounterState, List<String>>(
      converter: (store) => store.state.operations,
      builder: (context, operations) {
        return Card(
          elevation: 4,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Operation History',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                SizedBox(
                  height: 200,
                  child: operations.isEmpty
                      ? const Center(
                          child: Text(
                            'No operations yet',
                            style: TextStyle(
                              color: Colors.grey,
                              fontStyle: FontStyle.italic,
                            ),
                          ),
                        )
                      : ListView.builder(
                          itemCount: operations.length,
                          itemBuilder: (context, index) {
                            final operation = operations[operations.length - 1 - index];
                            return ListTile(
                              leading: Icon(
                                operation.contains('Incremented')
                                    ? Icons.add_circle
                                    : Icons.remove_circle,
                                color: operation.contains('Incremented')
                                    ? Colors.green
                                    : Colors.red,
                              ),
                              title: Text(operation),
                              dense: true,
                            );
                          },
                        ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}