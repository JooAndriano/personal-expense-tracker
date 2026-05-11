import 'package:flutter/material.dart';

import '../../../../core/components/textfields/app_text_field.dart';
import '../../controller/add_expense_controller.dart';

class ExpenseTitleField extends StatelessWidget {
  final AddExpenseController controller;
  const ExpenseTitleField({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Expense Title',
          style: TextStyle(
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 10),
        AppTextField(
          controller: controller.titleController,
          hint: 'e.g. Grocery Shopping',
        ),
      ],
    );
  }
}
