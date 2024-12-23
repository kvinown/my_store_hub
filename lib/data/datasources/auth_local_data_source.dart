import 'package:my_store_hub/data/pf/preference_helper.dart';

abstract class AuthLocalDataSource {
  Future<String?> getRole();
  Future<void> setRole(String role);
  Future<void> removeRole();
}

class AuthLocalDataSourceImpl extends AuthLocalDataSource {
  final PreferenceHelper preferencesHelper;

  AuthLocalDataSourceImpl(this.preferencesHelper);

  @override
  Future<String?> getRole() async {
    return await preferencesHelper.getRole();
  }

  @override
  Future<void> setRole(String role) async {
    await preferencesHelper.setRole(role);
  }

  @override
  Future<void> removeRole() async {
    await preferencesHelper.removeRole();
  }
}
