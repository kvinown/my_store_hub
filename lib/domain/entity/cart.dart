import 'package:equatable/equatable.dart';
import 'package:my_store_hub/domain/entity/product.dart';

class Cart extends Equatable {
  final List<Product> products;
  final int totalPrice;

  const Cart({
    required this.products,
    this.totalPrice = 0,
  });
  
  @override
  List<Object?> get props => [products, totalPrice];
  
}
