import 'package:my_store_hub/domain/entity/cart.dart';
import 'package:my_store_hub/domain/entity/product.dart';

abstract class CartRepository {
  Future<Cart> addProductToCart(Product product);
  Future<Cart> addProductQuantity(Product product);
  Future<Cart> reduceProductQuantity(Product product);
  Future<Map<String, dynamic>> getAllCartsMap();
  Future<void> clearCart();
}
