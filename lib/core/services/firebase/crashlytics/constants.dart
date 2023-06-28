import 'package:firebase_crashlytics/firebase_crashlytics.dart';

class CrashlyticsApp {
  CrashlyticsApp._internal();

  static Future<void> logError(
    dynamic exception, {
    StackTrace? stackTrace,
    dynamic reason,
    Iterable<Object> information = const [],
    bool? printDetails,
    bool fatal = false,
  }) async {
    await FirebaseCrashlytics.instance.recordError(
      exception,
      stackTrace ?? StackTrace.fromString('No StackTrace'),
      reason: reason,
      information: information,
      printDetails: printDetails,
      fatal: fatal,
    );
  }
}
