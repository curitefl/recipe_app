import 'package:flutter/foundation.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:recipe_app/text_data.dart';
import 'package:version/version.dart';

class VersionCheckService {
  Future<bool> versionCheck() async {
    final PackageInfo packageInfo = await PackageInfo.fromPlatform();
    Version currentVersion = Version.parse(packageInfo.version);
    final FirebaseRemoteConfig firebaseRemoteConfig = FirebaseRemoteConfig.instance;

    try {
      await firebaseRemoteConfig.setConfigSettings(RemoteConfigSettings(
          fetchTimeout: const Duration(seconds: 5),
          minimumFetchInterval: Duration.zero),
      );
      await firebaseRemoteConfig.fetchAndActivate();
      Version newVersion = Version.parse(firebaseRemoteConfig.getString(TextData.firebaseRemoteConfigName));
      if (newVersion > currentVersion) {
        if (kDebugMode) {
          print(TextData.appVersionIsLatest);
        }
        return true;
      }
    } catch (exception) {
      if (kDebugMode) {
        print(TextData.unableToFetchRemoteConfig);
      }
    }
    if (kDebugMode) {
      print(TextData.appVersionIsOlder);
    }
    return false;
  }
}