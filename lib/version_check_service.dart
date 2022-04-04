import 'package:package_info_plus/package_info_plus.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';

class VersionCheckService {
  static const String configName = 'force_update_app_version';

  Future<bool> versionCheck() async {
    final PackageInfo packageInfo = await PackageInfo.fromPlatform();
    int currentVersion = int.parse(packageInfo.buildNumber);
    final FirebaseRemoteConfig firebaseRemoteConfig = FirebaseRemoteConfig.instance;

    try {
      await firebaseRemoteConfig.setConfigSettings(RemoteConfigSettings(
          fetchTimeout: const Duration(seconds: 5),
          minimumFetchInterval: Duration.zero),
      );
      await firebaseRemoteConfig.fetchAndActivate();
      int newVersion = firebaseRemoteConfig.getInt(configName);
      if (newVersion > currentVersion) {
        return true;
      }
    } catch (exception) {
      print('リモート設定をフェッチできません。キャッシュされた値またはデフォルト値が使用されます。');
    }
    return false;
  }
}