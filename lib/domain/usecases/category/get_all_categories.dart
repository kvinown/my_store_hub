import 'package:dartz/dartz.dart';
import 'package:my_store_hub/common/failure.dart';
import 'package:my_store_hub/domain/entity/category.dart';
import 'package:my_store_hub/domain/repositories/category_repository.dart';

class GetAllCategories {
  final CategoryRepository repository;

  GetAllCategories(this.repository);

  Future<Either<Failure, List<Category>>> execute() {
    return repository.getAllCategories();
  }
}
