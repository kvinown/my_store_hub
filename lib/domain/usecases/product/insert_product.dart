import 'package:dartz/dartz.dart';
import 'package:my_store_hub/common/failure.dart';
import 'package:my_store_hub/domain/entity/product.dart';
import 'package:my_store_hub/domain/repositories/product_repository.dart';

class InsertProduct {
  final ProductRepository repository;

  InsertProduct(this.repository);

  Future<Either<Failure, String>> execute(Product product) {
    return repository.insertProduct(product);
  }
}
