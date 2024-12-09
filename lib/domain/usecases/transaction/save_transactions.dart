import 'package:dartz/dartz.dart';
import 'package:my_store_hub/common/failure.dart';
import 'package:my_store_hub/domain/entity/transaction.dart';
import 'package:my_store_hub/domain/repositories/transaction_repository.dart';

class SaveTransaction {
  final TransactionRepository repository;

  SaveTransaction(this.repository);

  Future<Either<Failure, void>> execute(TransactionEntity transaction) {
    return repository.saveTransaction(transaction);
  }
}
