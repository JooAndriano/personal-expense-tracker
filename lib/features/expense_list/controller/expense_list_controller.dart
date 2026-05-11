import 'package:get/get.dart';

import '../../../data/models/expense_model.dart';
import '../../../data/repositories/expense_repository.dart';
import '../state/expense_list_state.dart';

class ExpenseListController extends GetxController {
  final repository = ExpenseRepository();

  final state =
      ExpenseListState.initial().obs;

  @override
  void onInit() {
    super.onInit();

    loadExpenses();
  }

  void loadExpenses() {
    final expenses =
    repository.getExpenses();

    expenses.sort(
          (a, b) => b.date.compareTo(a.date),
    );

    state.value = state.value.copyWith(
      expenses: expenses,
    );
  }

  int get totalExpense {
    return state.value.expenses.fold(
      0,
          (sum, item) => sum + item.amount,
    );
  }

  Future<void> deleteExpense(
      String id,
      ) async {
    final updatedExpenses =
    state.value.expenses
        .where((e) => e.id != id)
        .toList();

    await repository.saveExpenses(
      updatedExpenses,
    );

    loadExpenses();
  }
}