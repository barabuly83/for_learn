import 'package:flutter/material.dart';

import '../../l10n/app_localizations.dart';
import 'failures.dart';

class ErrorLocalizer {
  const ErrorLocalizer._();

  static String localize(BuildContext context, Failure failure) {
    final l10n = AppLocalizations.of(context)!;

    if (failure is AuthFailure) {
      return _localizeAuthFailure(failure, l10n);
    } else if (failure is ServerFailure) {
      return l10n.error;
    } else if (failure is CacheFailure) {
      return l10n.error;
    } else if (failure is NetworkFailure) {
      return l10n.error;
    } else {
      return l10n.error;
    }
  }

  static String _localizeAuthFailure(
    AuthFailure failure,
    AppLocalizations l10n,
  ) {
    switch (failure.code) {
      case 'user-not-found':
        return l10n.authErrorUserNotFound;
      case 'wrong-password':
      case 'invalid-credential':
        return l10n.authErrorWrongPassword;
      case 'email-already-in-use':
        return l10n.authErrorEmailAlreadyInUse;
      case 'weak-password':
        return l10n.authErrorWeakPassword;
      case 'invalid-email':
        return l10n.authErrorInvalidEmail;
      case 'user-disabled':
        return l10n.authErrorUserDisabled;
      case 'too-many-requests':
        return l10n.authErrorTooManyRequests;
      case 'operation-not-allowed':
        return l10n.authErrorOperationNotAllowed;
      case 'requires-recent-login':
        return l10n.authErrorRequiresRecentLogin;
      default:
        return l10n.authErrorUnknown;
    }
  }
}
