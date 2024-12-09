import 'package:my_store_hub/domain/repositories/auth_repository.dart';

class GetLoginStatus {
  final AuthRepository repository;

  GetLoginStatus(this.repository);

  bool execute() {
    return repository.getLoginStatus();
  }
}
