import 'package:dartz/dartz.dart';
import 'package:my_store_hub/common/failure.dart';
import 'package:my_store_hub/domain/entity/point.dart';

abstract class PointRepository {
  Future<Either<Failure, List<Point>>> getAllPointsHistory();
  Future<Either<Failure, void>> savePoint(int point);
  Future<Either<Failure, void>> usePoint(int point);
}