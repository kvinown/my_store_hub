import 'package:my_store_hub/domain/entity/cart.dart';
import 'package:my_store_hub/domain/entity/product.dart';
import 'package:my_store_hub/domain/repositories/cart_repository.dart';

class AddProductToCart {
  final CartRepository repository;

  AddProductToCart(this.repository);

  Future<Cart> execute(Product product) {
    return repository.addProductToCart(product);
  }
}
