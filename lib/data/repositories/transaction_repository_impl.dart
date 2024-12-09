import 'package:dartz/dartz.dart';
import 'package:my_store_hub/common/failure.dart';
import 'package:my_store_hub/data/datasources/transaction_remote_data_source.dart';
import 'package:my_store_hub/data/models/transaction_model.dart';
import 'package:my_store_hub/domain/entity/transaction.dart';
import 'package:my_store_hub/domain/repositories/transaction_repository.dart';

class TransactionRepositoryImpl extends TransactionRepository {
  final TransactionRemoteDataSource remoteDataSource;

  TransactionRepositoryImpl(this.remoteDataSource);

  @override
  Future<Either<Failure, List<TransactionEntity>>> getAllTransactions() async {
    try {
      final result = await remoteDataSource.getAllTransactions();
      return Right(result.map((item) => item.toEntity()).toList());
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<TransactionEntity>>>
      getAllTransactionsByUserId() async {
    try {
      final result = await remoteDataSource.getAllTransactionsByUserId();
      return Right(result.map((item) => item.toEntity()).toList());
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> saveTransaction(
    TransactionEntity transaction,
  ) async {
    try {
      final result = await remoteDataSource.saveTransaction(
        TransactionModel.fromEntity(transaction),
      );
      return Right(result);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
