import 'package:my_store_hub/domain/repositories/cart_repository.dart';

class GetAllCartsMap {
  final CartRepository repository;

  GetAllCartsMap(this.repository);

  Future<Map<String, dynamic>> execute() {
    return repository.getAllCartsMap();
  }
}
