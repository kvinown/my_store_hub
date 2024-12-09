import 'package:dartz/dartz.dart';
import 'package:my_store_hub/common/failure.dart';
import 'package:my_store_hub/domain/entity/category.dart';
import 'package:my_store_hub/domain/repositories/category_repository.dart';

class UpdateCategory {
  final CategoryRepository repository;

  UpdateCategory(this.repository);

  Future<Either<Failure, String>> execute(Category category) {
    return repository.updateCategory(category);
  }
}
