import 'package:my_store_hub/domain/repositories/auth_repository.dart';

class GetRole {
  final AuthRepository repository;

  GetRole(this.repository);

  Future<String?> execute() {
    return repository.getRole();
  }
}
