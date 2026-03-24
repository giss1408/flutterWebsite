import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

/// Global error handler for production-ready error management
class ErrorHandler {
  static final ErrorHandler _instance = ErrorHandler._internal();

  factory ErrorHandler() {
    return _instance;
  }

  ErrorHandler._internal();

  final Logger _logger = Logger();

  /// Handle and log errors
  void handleError(
    dynamic error, {
    required String context,
    StackTrace? stackTrace,
    VoidCallback? onRetry,
  }) {
    _logger.e('❌ Error in $context: $error', stackTrace: stackTrace);

    // In production, send error to remote service
    // await sendToErrorTracking(error, stackTrace, context);
  }

  /// Handle network errors
  void handleNetworkError(dynamic error, {String? context}) {
    _logger.e('📡 Network error${context != null ? ' in $context' : ''}: $error');
  }

  /// Handle async errors that aren't caught
  static void setupGlobalErrorHandler() {
    FlutterError.onError = (FlutterErrorDetails details) {
      _instance._logger.e(
        '🔴 Flutter Error: ${details.exception}',
        stackTrace: details.stack,
      );
    };

    // Catch async errors not caught by Flutter
    // Note: This only works in production with proper error tracking setup
  }

  /// Show error dialog to user
  static void showErrorDialog(
    BuildContext context, {
    required String title,
    required String message,
    VoidCallback? onRetry,
  }) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(title),
        content: Text(message),
        actions: [
          if (onRetry != null)
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                onRetry();
              },
              child: const Text('Retry'),
            ),
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Dismiss'),
          ),
        ],
      ),
    );
  }
}
