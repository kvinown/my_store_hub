import 'package:dartz/dartz.dart';
import 'package:my_store_hub/common/failure.dart';
import 'package:my_store_hub/domain/entity/transaction.dart';
import 'package:my_store_hub/domain/repositories/transaction_repository.dart';

class GetAllTransactionsByUserId {
  final TransactionRepository repository;

  GetAllTransactionsByUserId(this.repository);

  Future<Either<Failure, List<TransactionEntity>>> execute() {
    return repository.getAllTransactionsByUserId();
  }
}