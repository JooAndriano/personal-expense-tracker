enum ExpenseCategory {
  foodDining,
  transportation,
  shopping,
  bills,
  entertainment,
}

extension ExpenseCategoryLabel on ExpenseCategory {
  String get label {
    switch (this) {
      case ExpenseCategory.foodDining:
        return 'Food & Dining';
      case ExpenseCategory.transportation:
        return 'Transportation';
      case ExpenseCategory.shopping:
        return 'Shopping';
      case ExpenseCategory.bills:
        return 'Bills';
      case ExpenseCategory.entertainment:
        return 'Entertainment';
    }
  }
}

class ExpenseCategoryHelper {
  static List<ExpenseCategory> get valuesList => ExpenseCategory.values;

  static List<String> get labels => valuesList.map((e) => e.label).toList(growable: false);

  static ExpenseCategory? fromLabel(String? label) {
    if (label == null) return null;
    for (final e in ExpenseCategory.values) {
      if (e.label == label) return e;
    }
    return null;
  }
}