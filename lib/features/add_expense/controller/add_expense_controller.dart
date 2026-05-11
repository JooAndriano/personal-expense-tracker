import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/models/expense_model.dart';
import '../../../data/repositories/expense_repository.dart';
import '../state/add_expense_state.dart';

class AddExpenseController extends GetxController {
  final repository = ExpenseRepository();

  final state =
      AddExpenseState.initial().obs;

  final titleController =
  TextEditingController();

  final amountController =
  TextEditingController();

  final selectedDate =
      DateTime.now().obs;

  final selectedCategory =
      'Food & Dining'.obs;

  ExpenseModel? editingExpense;

  final categories = [
    'Food & Dining',
    'Transportation',
    'Shopping',
    'Bills',
    'Entertainment',
  ];

  @override
  void onInit() {
    super.onInit();

    final expense = Get.arguments;

    if (expense != null &&
        expense is ExpenseModel) {
      editingExpense = expense;

      titleController.text = expense.title;

      amountController.text =
          expense.amount.toString();

      selectedDate.value = expense.date;

      selectedCategory.value =
          expense.category;
    }
  }

  Future<void> saveExpense() async {
    final title =
    titleController.text.trim();

    final amount =
        int.tryParse(
          amountController.text.trim(),
        ) ??
            0;

    /// VALIDATION
    if (title.isEmpty) {
      Get.snackbar(
        'Validation Error',
        'Expense title is required',
        snackPosition:
        SnackPosition.BOTTOM,
        margin: const EdgeInsets.all(
          16,
        ),
      );

      return;
    }

    if (amount <= 0) {
      Get.snackbar(
        'Validation Error',
        'Amount must be greater than 0',
        snackPosition:
        SnackPosition.BOTTOM,
        margin: const EdgeInsets.all(
          16,
        ),
      );

      return;
    }

    final expenses =
    repository.getExpenses();

    final expense = ExpenseModel(
      id:
      editingExpense?.id ??
          DateTime.now()
              .millisecondsSinceEpoch
              .toString(),
      title: title,
      amount: amount,
      date: selectedDate.value,
      category:
      selectedCategory.value,
    );

    if (editingExpense != null) {
      final index = expenses.indexWhere(
            (e) => e.id == editingExpense!.id,
      );

      expenses[index] = expense;
    } else {
      expenses.add(expense);
    }

    await repository.saveExpenses(
      expenses,
    );

    Get.back(result: true);

    Get.snackbar(
      'Success',
      editingExpense != null
          ? 'Expense updated successfully'
          : 'Expense added successfully',
      snackPosition:
      SnackPosition.BOTTOM,
      margin: const EdgeInsets.all(
        16,
      ),
    );
  }
}