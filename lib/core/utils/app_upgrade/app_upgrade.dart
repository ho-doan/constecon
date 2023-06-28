import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:launch_review/launch_review.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:version/version.dart';

import '../../services/firebase/remote_config/remote_config_app.dart';

// ignore: avoid_classes_with_only_static_members
class AppUpgrade {
  static const androidAppId = 'TODO:';
  static const iOSAppId = 'TODO:';

  static Future<void> verifyRemoteConfigurations({
    required BuildContext context,
    bool maintenance = false,
    bool appUpdate = false,
    bool newTermsOfService = false,
  }) async {
    final newVersion = await _fetchNewVersion();
    if (newVersion == null || newVersion.isEmpty) {
      return;
    }
    if (maintenance) {
      // await _showMaintenanceDialogIfRequired(
      // );
    }

    if (appUpdate) {
      // ignore: use_build_context_synchronously
      await _showUpdateAppDialogIfRequired(
        context,
        newVersion,
      );
    }
    if (newTermsOfService) {
      // await _showNewTermsDialogIfRequired(
      //   context,
      //   envState,
      //   prefs,
      //   config.notifyNewTermsOfService,
      // );
    }
  }

  static Future<String?> _fetchNewVersion() async {
    return RemoteConfigApp.getNewVersionApp();
  }

  static Future<void> _showUpdateAppDialogIfRequired(
    BuildContext context,
    String newVersion,
  ) async {
    if (await _isShowOptionalUpdateDialog(newVersion: newVersion)) {
      // ignore: use_build_context_synchronously
      await _showOptionalUpdateDialog(context, newVersion);
    }
  }

  static Future<bool> _isShowOptionalUpdateDialog(
      {String newVersion = ''}) async {
    final currentVersion = await getAppVersion();
    return currentVersion < Version.parse(newVersion);
  }

  static Future<void> _showOptionalUpdateDialog(
    BuildContext context,
    String newVersion,
  ) async {
    //TODO: hard
    final confirm = await _showTwoButtonsDialog(
      context: context,
      title: 'new version',
      message: 'new version app. upgrade now',
      actionOk: 'ok',
      actionCancel: 'cancel',
    );
    if (!confirm) {
      return;
    }
    await _showAppInStore();
  }

  static Future<Version> getAppVersion() async {
    final packageInfo = await PackageInfo.fromPlatform();
    return Version.parse(packageInfo.version);
  }

  static Future<bool> _showTwoButtonsDialog({
    required BuildContext context,
    String? title,
    String? message,
    String? actionOk,
    String? actionCancel,
    bool barrierDismissible = true,
  }) async {
    final dialogResult = await showDialog<bool>(
      context: context,
      barrierDismissible: barrierDismissible,
      builder: (BuildContext context) {
        if (Platform.isIOS) {
          return CupertinoAlertDialog(
            title: Text(title ?? ''),
            content: Text(message ?? ''),
            actions: buildListAction(context, actionOk, actionCancel),
          );
        }
        return AlertDialog(
          title: Text(title ?? ''),
          content: Text(message ?? ''),
          actions: buildListAction(context, actionOk, actionCancel),
        );
      },
    );
    return dialogResult ?? false;
  }

  static List<Widget> buildListAction(
    BuildContext context,
    String? actionOk,
    String? actionCancel,
  ) {
    return <Widget>[
      TextButton(
        onPressed: () => Navigator.of(context).pop(false),
        child: Text(actionCancel ?? ''),
      ),
      TextButton(
        onPressed: () => Navigator.of(context).pop(true),
        child: Text(actionOk ?? ''),
      ),
    ];
  }

  static Future<void> _showAppInStore() async {
    await LaunchReview.launch(
      androidAppId: androidAppId,
      iOSAppId: iOSAppId,
      writeReview: false,
    );
  }
}
