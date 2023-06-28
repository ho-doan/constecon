import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_core/firebase_core.dart';

class AnalyticsApp {
  AnalyticsApp._internal();
  static late FirebaseAnalytics analytics;

  static Future<void> init({required FirebaseApp firebaseApp}) async {
    analytics = FirebaseAnalytics.instance;
    analytics.setAnalyticsCollectionEnabled(true);
  }
}
