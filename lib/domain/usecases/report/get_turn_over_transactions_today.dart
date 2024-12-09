import 'package:my_store_hub/domain/repositories/report_repository.dart';

class GetTurnOverTransactionsToday {
  final ReportRepository repository;

  GetTurnOverTransactionsToday(this.repository);

  Future<int> execute() {
    return repository.getTurnOverTransactionsToday();
  }
}
