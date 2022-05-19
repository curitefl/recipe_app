import 'package:recipe_app/service/firebase/firebase_remote_config_service.dart';

class ApplicationDataStore {
  final FirebaseRemoteConfigService _firebaseService;

  ApplicationDataStore(final this._firebaseService);

  Future<int> getPolicyVersion() async {
    return await _firebaseService.getPolicyVersion();
  }

  Future<String> getAppVersion() async {
    return await _firebaseService.getAppVersion();
  }
}
