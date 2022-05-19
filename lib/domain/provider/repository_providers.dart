import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:recipe_app/data/data_store/application_data_store.dart';
import 'package:recipe_app/data/repository/application_repository.dart';
import 'package:recipe_app/data/repository/preference_repository.dart';
import 'package:recipe_app/service/firebase/firebase_remote_config_service.dart';

final firebaseRemoteConfigServiceProvider = Provider(
  (ref) => FirebaseRemoteConfigService(),
);

final applicationDataStoreProvider = Provider(
  (ref) => ApplicationDataStore(
    ref.watch(firebaseRemoteConfigServiceProvider),
  ),
);

final applicationRepositoryProvider = Provider(
  (ref) => ApplicationRepository(
    ref.watch(applicationDataStoreProvider),
  ),
);

final preferenceRepositoryProvider = Provider(
  (ref) => PreferenceRepository(),
);
