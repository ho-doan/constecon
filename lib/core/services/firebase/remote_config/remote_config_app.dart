import 'package:firebase_remote_config/firebase_remote_config.dart';

import 'remote_config_constants.dart';

class RemoteConfigApp {
  RemoteConfigApp._internal();
  static late FirebaseRemoteConfig _remoteConfig;
  static Future<void> init() async {
    // _remoteConfig = FirebaseRemoteConfig.instance;
    // await _remoteConfig.setConfigSettings(RemoteConfigSettings(
    //   fetchTimeout: const Duration(minutes: 1),
    //   minimumFetchInterval: const Duration(hours: 1),
    // ));
    // await _remoteConfig.fetchAndActivate();
  }

  static String getNewVersionApp() {
    return _remoteConfig.getString(RemoteConfigConstants.newVersionApp);
  }
}
