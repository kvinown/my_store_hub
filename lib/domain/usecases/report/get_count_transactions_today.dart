import 'package:my_store_hub/domain/repositories/report_repository.dart';

class GetCountTransactionsToday {
  final ReportRepository repository;

  GetCountTransactionsToday(this.repository);

  Future<int> execute() {
    return repository.getCountTransactionsToday();
  }
}
