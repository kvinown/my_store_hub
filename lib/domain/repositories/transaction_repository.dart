import 'package:dartz/dartz.dart';
import 'package:my_store_hub/common/failure.dart';
import 'package:my_store_hub/domain/entity/transaction.dart';

abstract class TransactionRepository {
  Future<Either<Failure, List<TransactionEntity>>> getAllTransactions();
  Future<Either<Failure, List<TransactionEntity>>> getAllTransactionsByUserId();
  Future<Either<Failure, void>> saveTransaction(TransactionEntity transaction);
}
