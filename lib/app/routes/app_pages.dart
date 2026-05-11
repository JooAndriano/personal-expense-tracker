import 'package:get/get.dart';

import '../../features/add_expense/view/add_expense_screen.dart';
import '../../features/expense_list/view/expense_list_screen.dart';
import 'app_routes.dart';

class AppPages {
  static const initial = AppRoutes.expenseList;

  static final routes = [
    GetPage(
      name: AppRoutes.expenseList,
      page: () => const ExpenseListScreen(),
    ),
    GetPage(
      name: AppRoutes.addExpense,
      page: () => const AddExpenseScreen(),
    ),
  ];
}