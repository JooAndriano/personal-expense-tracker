import '../models/expense_model.dart';
import '../../core/services/storage_service.dart';

class ExpenseLocalDataSource {
  final storage = StorageService();

  List<ExpenseModel> getExpenses() {
    final data =
    storage.read(StorageService.expensesKey);

    if (data == null) return [];

    return List<Map<String, dynamic>>.from(data)
        .map((e) => ExpenseModel.fromJson(e))
        .toList();
  }

  Future<void> saveExpenses(
      List<ExpenseModel> expenses,
      ) async {
    final jsonList = expenses
        .map((expense) => expense.toJson())
        .toList();

    await storage.write(
      StorageService.expensesKey,
      jsonList,
    );
  }
}