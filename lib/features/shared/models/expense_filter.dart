import '../enums/expense_category.dart';

enum ExpenseSortType {
  newest,
  oldest,
  highestAmount,
  lowestAmount,
}

class ExpenseFilter {
  /// Use `null` to represent "All" category in filters.
  final ExpenseCategory? category;
  final ExpenseSortType sort;
  final String search;

  const ExpenseFilter({
    required this.category,
    required this.sort,
    required this.search,
  });

  factory ExpenseFilter.initial() => const ExpenseFilter(
        category: null,
        sort: ExpenseSortType.newest,
        search: '',
      );

  ExpenseFilter copyWith({
    ExpenseCategory? category,
    bool clearCategory = false,
    ExpenseSortType? sort,
    String? search,
  }) {
    return ExpenseFilter(
      category: clearCategory ? null : (category ?? this.category),
      sort: sort ?? this.sort,
      search: search ?? this.search,
    );
  }

  String get categoryLabel => category?.label ?? 'All';
}