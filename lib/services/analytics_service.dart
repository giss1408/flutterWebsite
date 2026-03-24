import 'package:logger/logger.dart';

/// Analytics service for tracking user interactions and performance metrics
class AnalyticsService {
  static final AnalyticsService _instance = AnalyticsService._internal();

  factory AnalyticsService() {
    return _instance;
  }

  AnalyticsService._internal();

  final Logger _logger = Logger();

  /// Track page view
  void trackPageView(String pageName) {
    _logger.i('📍 Page viewed: $pageName');
  }

  /// Track user interaction
  void trackEvent(String eventName, {Map<String, dynamic>? parameters}) {
    _logger.i('🎯 Event: $eventName - ${parameters.toString()}');
  }

  /// Track custom exception
  void trackException(dynamic exception, {dynamic stackTrace}) {
    _logger.e('❌ Exception tracked: $exception', error: exception, stackTrace: stackTrace);
  }

  /// Track performance metric
  void trackPerformance(String metricName, Duration duration) {
    _logger.i('⚡ Performance - $metricName: ${duration.inMilliseconds}ms');
  }

  /// Set user properties
  void setUserProperties({
    required String userId,
    Map<String, String>? customProperties,
  }) {
    final props = {'userId': userId, ...?customProperties};
    _logger.i('👤 User properties set: ${props.toString()}');
  }
}
