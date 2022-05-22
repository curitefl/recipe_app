import 'package:recipe_app/data/constants/preference_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PreferenceRepository {
  Future<int?> getPolicyVersion() async {
    final preferences = await SharedPreferences.getInstance();
    return preferences.getInt(PreferenceConstants.policyVersion);
  }

  Future<void> setPolicyVersion(final int policyVersion) async {
    final preferences = await SharedPreferences.getInstance();
    preferences.setInt(PreferenceConstants.policyVersion, policyVersion);
  }
}
