import 'package:dartz/dartz.dart';
import 'package:my_store_hub/common/failure.dart';
import 'package:my_store_hub/domain/repositories/point_repository.dart';

class UsePoint {
  final PointRepository repository;

  UsePoint(this.repository);

  Future<Either<Failure, void>> execute(int point) {
    return repository.usePoint(point);
  }
}
