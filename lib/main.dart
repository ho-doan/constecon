import 'dart:async';
import 'dart:developer' as dev;
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import 'app.dart';
import 'core/local_database/local_database.dart';
import 'core/local_database/share_preferences_hepper.dart';
import 'core/network/api_util.dart';
import 'core/router/route.dart';
import 'core/services/di/service_locator.dart';
// import 'core/services/firebase/crashlytics/constants.dart';
import 'core/services/firebase/remote_config/remote_config_app.dart';

void main() {
  runZonedGuarded(() async {
    WidgetsFlutterBinding.ensureInitialized();
    await initApp();
    configureDependencies(
      dio: ApiUtil.initApiService(apiEndpoint: dotenv.env['API_ENDPOINT']),
    );
    await LocalDatabase.init();
    runApp(const App());
  }, (error, stackTrace) async {
    dev.log('main error: $e');
    // await CrashlyticsApp.logError(
    //   'Error when init App : $error',
    //   stackTrace: stackTrace,
    //   fatal: true,
    // );
  });
}

Future<void> initApp() async {
  await dotenv.load();
  // final firebaseApp = await Firebase.initializeApp(
  //   name: DefaultFirebaseOptions.name,
  //   options: DefaultFirebaseOptions.currentPlatform,
  // );
  Routes.configureRoutes();

  // firebaseApp.setAutomaticDataCollectionEnabled(true);
  EasyLoading.instance
    ..displayDuration = const Duration(milliseconds: 2000)
    ..indicatorType = EasyLoadingIndicatorType.fadingCircle
    ..loadingStyle = EasyLoadingStyle.light
    ..indicatorSize = 45.0
    ..radius = 10.0
    ..userInteractions = true
    ..dismissOnTap = false;
  try {
    await SharedPreferencesHelper.instance.init();
    await RemoteConfigApp.init();
    // await AnalyticsApp.init(firebaseApp: firebaseApp);
    // await FirebaseCrashlytics.instance.setCrashlyticsCollectionEnabled(true);
  } catch (e) {
    dev.log(e.toString());
  }
}
