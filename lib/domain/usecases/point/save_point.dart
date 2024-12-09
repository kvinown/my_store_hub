import 'package:dartz/dartz.dart';
import 'package:my_store_hub/common/failure.dart';
import 'package:my_store_hub/domain/repositories/point_repository.dart';

class SavePoint {
  final PointRepository repository;

  SavePoint(this.repository);

  Future<Either<Failure, void>> execute(int point) {
    return repository.savePoint(point);
  }
}
