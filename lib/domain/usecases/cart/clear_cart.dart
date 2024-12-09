import 'package:my_store_hub/domain/repositories/cart_repository.dart';

class ClearCart {
  final CartRepository repository;

  ClearCart(this.repository);

  Future<void> execute() {
    return repository.clearCart();
  }
}
