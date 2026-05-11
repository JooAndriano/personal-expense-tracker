import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/models/expense_model.dart';
import '../../../data/repositories/expense_repository.dart';
import '../state/expense_list_state.dart';

enum ExpenseSortType {
  newest,
  oldest,
  highestAmount,
  lowestAmount,
}

class ExpenseListController
    extends GetxController {
  final repository = ExpenseRepository();

  final state =
      ExpenseListState.initial().obs;

  final filteredExpenses =
      <ExpenseModel>[].obs;

  final searchController =
  TextEditingController();

  final selectedCategory =
      'All'.obs;

  final selectedSort =
      ExpenseSortType.newest.obs;

  final categories = [
    'All',
    'Food & Dining',
    'Transportation',
    'Shopping',
    'Bills',
    'Entertainment',
  ];

  @override
  void onInit() {
    super.onInit();

    loadExpenses();

    searchController.addListener(() {
      applyFilters();
    });
  }

  void loadExpenses() {
    final expenses =
    repository.getExpenses();

    state.value = state.value.copyWith(
      expenses: expenses,
    );

    applyFilters();
  }

  void applyFilters() {
    List<ExpenseModel> expenses =
    List.from(
      state.value.expenses,
    );

    /// SEARCH
    final search =
    searchController.text
        .trim()
        .toLowerCase();

    if (search.isNotEmpty) {
      expenses =
          expenses.where((expense) {
            return expense.title
                .toLowerCase()
                .contains(search);
          }).toList();
    }

    /// FILTER
    if (selectedCategory.value !=
        'All') {
      expenses =
          expenses.where((expense) {
            return expense.category ==
                selectedCategory.value;
          }).toList();
    }

    /// SORT
    switch (selectedSort.value) {
      case ExpenseSortType.newest:
        expenses.sort(
              (a, b) =>
              b.date.compareTo(a.date),
        );
        break;

      case ExpenseSortType.oldest:
        expenses.sort(
              (a, b) =>
              a.date.compareTo(b.date),
        );
        break;

      case ExpenseSortType.highestAmount:
        expenses.sort(
              (a, b) =>
              b.amount.compareTo(
                a.amount,
              ),
        );
        break;

      case ExpenseSortType.lowestAmount:
        expenses.sort(
              (a, b) =>
              a.amount.compareTo(
                b.amount,
              ),
        );
        break;
    }

    filteredExpenses.value = expenses;
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

  void setCategory(
      String category,
      ) {
    selectedCategory.value =
        category;

    applyFilters();
  }

  void setSort(
      ExpenseSortType type,
      ) {
    selectedSort.value = type;

    applyFilters();
  }
}