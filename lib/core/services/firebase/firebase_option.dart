import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, TargetPlatform;
import 'package:flutter_dotenv/flutter_dotenv.dart';

class DefaultFirebaseOptions {
  DefaultFirebaseOptions();
  static String get name {
    return dotenv.env['NAME'] ?? '';
  }

  static FirebaseOptions get currentPlatform {
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;

      // ignore: no_default_cases
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static FirebaseOptions android = FirebaseOptions(
    apiKey: dotenv.env['ANDROID_API_KEY'] ?? '',
    appId: dotenv.env['ANDROID_APP_ID'] ?? '',
    messagingSenderId: dotenv.env['ANDROID_MESSAGING_SENDER_ID'] ?? '',
    projectId: dotenv.env['ANDROID_PROJECT_ID'] ?? '',
  );

  static FirebaseOptions ios = FirebaseOptions(
    apiKey: dotenv.env['IOS_API_KEY'] ?? '',
    appId: dotenv.env['IOS_APP_ID'] ?? '',
    messagingSenderId: dotenv.env['IOS_MESSAGING_SENDER_ID'] ?? '',
    projectId: dotenv.env['IOS_PROJECT_ID'] ?? '',
  );
}
