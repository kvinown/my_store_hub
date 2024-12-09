import 'package:my_store_hub/domain/repositories/auth_repository.dart';

class Logout {
  final AuthRepository repository;

  Logout(this.repository);

  Future<void> execute() {
    return repository.logout();
  }
}
