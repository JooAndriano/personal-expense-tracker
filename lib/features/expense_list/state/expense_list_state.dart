import '../../../data/models/expense_model.dart';

class ExpenseListState {
  final bool isLoading;
  final List<ExpenseModel> expenses;

  const ExpenseListState({
    required this.isLoading,
    required this.expenses,
  });

  factory ExpenseListState.initial() {
    return const ExpenseListState(
      isLoading: false,
      expenses: [],
    );
  }

  ExpenseListState copyWith({
    bool? isLoading,
    List<ExpenseModel>? expenses,
  }) {
    return ExpenseListState(
      isLoading: isLoading ?? this.isLoading,
      expenses: expenses ?? this.expenses,
    );
  }
}