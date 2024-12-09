import 'package:dartz/dartz.dart';
import 'package:my_store_hub/common/failure.dart';
import 'package:my_store_hub/domain/entity/product.dart';

abstract class ProductRepository {
  Future<Either<Failure, List<Product>>> getAllProducts();
  Future<Either<Failure, String>> insertProduct(Product product);
  Future<Either<Failure, String>> updateProduct(Product product);
  Future<Either<Failure, String>> removeProduct(Product product);
}
