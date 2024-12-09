import 'dart:math';

import 'package:dartz/dartz.dart';
import 'package:my_store_hub/common/failure.dart';
import 'package:my_store_hub/domain/repositories/point_repository.dart';

class GetAllPointsHistory {
  final PointRepository repository;

  GetAllPointsHistory(this.repository);

  Future<Either<Failure, List<Point>>> execute() {
    return repository.getAllPointsHistory();
  }
}
