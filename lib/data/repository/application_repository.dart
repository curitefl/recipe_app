import 'package:recipe_app/data/data_store/application_data_store.dart';

class ApplicationRepository {
  final ApplicationDataStore _applicationDataStore;

  ApplicationRepository(final this._applicationDataStore);

  Future<int> getPolicyVersion() async {
    return await _applicationDataStore.getPolicyVersion();
  }

  Future<String> getAppVersion() async {
    return await _applicationDataStore.getAppVersion();
  }
}