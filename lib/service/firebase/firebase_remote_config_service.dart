import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/foundation.dart';
import 'package:recipe_app/data/constants/preference_constants.dart';

class FirebaseRemoteConfigService {
  Future<int> getPolicyVersion() async {
    final firebaseRemoteConfig = FirebaseRemoteConfig.instance;
    await _fetchFirebaseRemoteConfig(firebaseRemoteConfig);
    return firebaseRemoteConfig.getInt(PreferenceConstants.policyVersion);
  }

  Future<String> getAppVersion() async {
    final firebaseRemoteConfig = FirebaseRemoteConfig.instance;
    await _fetchFirebaseRemoteConfig(firebaseRemoteConfig);
    return firebaseRemoteConfig.getString(PreferenceConstants.appVersion);
  }

  Future<void> _fetchFirebaseRemoteConfig(
    final FirebaseRemoteConfig firebaseRemoteConfig,
  ) async {
    try {
      await firebaseRemoteConfig.setConfigSettings(
        RemoteConfigSettings(
          fetchTimeout: const Duration(seconds: 5),
          minimumFetchInterval: Duration.zero,
        ),
      );
      await firebaseRemoteConfig.fetchAndActivate();
    } catch (exception) {
      if (kDebugMode) {
        print(exception);
      }
    }
  }
}
