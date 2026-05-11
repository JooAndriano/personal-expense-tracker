import '../datasources/expense_local_datasource.dart';
import '../models/expense_model.dart';

class ExpenseRepository {
  final datasource =
  ExpenseLocalDataSource();

  List<ExpenseModel> getExpenses() {
    return datasource.getExpenses();
  }

  Future<void> saveExpenses(
      List<ExpenseModel> expenses,
      ) async {
    await datasource.saveExpenses(expenses);
  }
}