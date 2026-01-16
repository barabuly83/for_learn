import 'package:flutter/material.dart';

enum WeatherErrorType {
  networkError,
  apiError,
  locationError,
  validationError,
  unknownError,
}

class WeatherError {
  final WeatherErrorType type;
  final String message;
  final String userMessage;
  final int? statusCode;

  const WeatherError._({
    required this.type,
    required this.message,
    required this.userMessage,
    this.statusCode,
  });

  factory WeatherError.networkError(String message) {
    return WeatherError._(
      type: WeatherErrorType.networkError,
      message: message,
      userMessage: 'Network error occurred',
    );
  }

  factory WeatherError.apiError(String message, int statusCode) {
    return WeatherError._(
      type: WeatherErrorType.apiError,
      message: message,
      userMessage: 'Failed to fetch weather data',
      statusCode: statusCode,
    );
  }

  factory WeatherError.locationError(String message) {
    return WeatherError._(
      type: WeatherErrorType.locationError,
      message: message,
      userMessage: 'Failed to get location',
    );
  }

  factory WeatherError.validationError(String message) {
    return WeatherError._(
      type: WeatherErrorType.validationError,
      message: message,
      userMessage: 'Invalid input',
    );
  }

  factory WeatherError.unknownError(String message) {
    return WeatherError._(
      type: WeatherErrorType.unknownError,
      message: message,
      userMessage: 'An unknown error occurred',
    );
  }

  factory WeatherError.fromException(Exception exception) {
    final message = exception.toString();

    if (message.contains('SocketException') ||
        message.contains('Connection') ||
        message.contains('Network')) {
      return WeatherError.networkError(message);
    } else if (message.contains('DioError')) {
      // Parse Dio error for status code
      final statusCodeMatch = RegExp(r'status code: (\d+)').firstMatch(message);
      final statusCode = statusCodeMatch != null
          ? int.tryParse(statusCodeMatch.group(1)!)
          : 500;

      return WeatherError.apiError(message, statusCode ?? 500);
    } else if (message.contains('Location') ||
        message.contains('GPS') ||
        message.contains('Permission')) {
      return WeatherError.locationError(message);
    } else {
      return WeatherError.unknownError(message);
    }
  }

  IconData get icon {
    switch (type) {
      case WeatherErrorType.networkError:
        return Icons.wifi_off;
      case WeatherErrorType.apiError:
        return Icons.error_outline;
      case WeatherErrorType.locationError:
        return Icons.location_off;
      case WeatherErrorType.validationError:
        return Icons.warning;
      case WeatherErrorType.unknownError:
        return Icons.help_outline;
    }
  }

  @override
  String toString() => 'WeatherError(type: $type, message: $message)';
}
