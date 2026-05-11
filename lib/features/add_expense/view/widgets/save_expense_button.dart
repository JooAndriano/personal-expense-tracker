import 'package:flutter/material.dart';

import '../../../../core/components/buttons/primary_button.dart';
import '../../controller/add_expense_controller.dart';

class SaveExpenseButton extends StatelessWidget {
  final AddExpenseController controller;
  const SaveExpenseButton({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return PrimaryButton(
      text: controller.editingExpense != null ? 'Save Changes' : 'Save Expense',
      onTap: () {
        controller.saveExpense();
      },
    );
  }
}
