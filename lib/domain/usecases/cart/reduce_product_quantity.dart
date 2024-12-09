import 'package:my_store_hub/domain/entity/cart.dart';
import 'package:my_store_hub/domain/entity/product.dart';
import 'package:my_store_hub/domain/repositories/cart_repository.dart';

class ReduceProductQuantity {
  final CartRepository repository;

  ReduceProductQuantity(this.repository);

  Future<Cart> execute(Product product) {
    return repository.reduceProductQuantity(product);
  }
}
