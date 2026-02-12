import 'package:flutter/material.dart';

import '../../l10n/app_localizations.dart';

class EmptyTodosWidget extends StatelessWidget {
  const EmptyTodosWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        '${AppLocalizations.of(context)!.noTodos}\n${AppLocalizations.of(context)!.addFirstTodo}',
        textAlign: TextAlign.center,
        style: const TextStyle(fontSize: 16, color: Colors.grey),
      ),
    );
  }
}
