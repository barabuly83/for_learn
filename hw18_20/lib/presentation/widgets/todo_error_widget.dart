import 'package:flutter/material.dart';

import '../../l10n/app_localizations.dart';

class TodoErrorWidget extends StatelessWidget {
  final String message;
  final VoidCallback onRetry;

  const TodoErrorWidget({
    super.key,
    required this.message,
    required this.onRetry,
  });

  String _getLocalizedMessage(BuildContext context, String messageKey) {
    final l10n = AppLocalizations.of(context)!;

    switch (messageKey) {
      case 'userMustBeAuthenticated':
        return l10n.userMustBeAuthenticated;
      case 'failedToLoadTodos':
        return l10n.failedToLoadTodos;
      default:
        return '${l10n.error}: $messageKey';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.error_outline, size: 64, color: Colors.red),
          const SizedBox(height: 16),
          Text(
            _getLocalizedMessage(context, message),
            textAlign: TextAlign.center,
            style: const TextStyle(color: Colors.red),
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: onRetry,
            child: Text(AppLocalizations.of(context)!.retry),
          ),
        ],
      ),
    );
  }
}
