import 'package:package_info_plus/package_info_plus.dart';
import 'package:recipe_app/data/repository/application_repository.dart';
import 'package:recipe_app/data/repository/preference_repository.dart';
import 'package:version/version.dart';

class SplashUseCase {
  final ApplicationRepository _applicationRepository;
  final PreferenceRepository _preferenceRepository;

  SplashUseCase(
    final this._applicationRepository,
    final this._preferenceRepository,
  );

  Future<bool> isPolicyUpdated() async {
    final currentVersion = await _preferenceRepository.getPolicyVersion();

    if(currentVersion == null) {
      return false;
    }

    final newVersion = await _applicationRepository.getPolicyVersion();
    return currentVersion >= newVersion;
  }

  Future<bool> isAppUpdated() async {
    final packageInfo = await PackageInfo.fromPlatform();
    final currentVersion = Version.parse(packageInfo.version);
    final newVersion = Version.parse(await _applicationRepository.getAppVersion());
    return currentVersion >= newVersion;
  }

  Future<void> agreeNewPolicyVersion() async {
    final newVersion = await _applicationRepository.getPolicyVersion();
    await _preferenceRepository.setPolicyVersion(newVersion);
  }
}
