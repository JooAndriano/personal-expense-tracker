class AddExpenseState {
  final bool isLoading;

  const AddExpenseState({
    required this.isLoading,
  });

  factory AddExpenseState.initial() {
    return const AddExpenseState(
      isLoading: false,
    );
  }

  AddExpenseState copyWith({
    bool? isLoading,
  }) {
    return AddExpenseState(
      isLoading: isLoading ?? this.isLoading,
    );
  }
}