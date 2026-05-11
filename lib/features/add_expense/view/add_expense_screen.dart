import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../app/themes/app_colors.dart';
import '../../../core/components/app_scaffold.dart';
import '../../../core/extensions/context_extension.dart';
import '../controller/add_expense_controller.dart';
import 'widgets/expense_form.dart';
import 'widgets/save_expense_button.dart';

class AddExpenseScreen extends StatelessWidget {
  const AddExpenseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(
      AddExpenseController(),
    );

    return AppScaffold(
      backgroundColor:
      AppColors.background,
      appBar: AppBar(
        elevation: 0,
        scrolledUnderElevation: 0,
        backgroundColor:
        Colors.transparent,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(
            Icons.arrow_back_ios_new_rounded,
          ),
        ),
        title: Text(
          controller.editingExpense != null
              ? 'Edit Expense'
              : 'Add Expense',
          style: const TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 24,
          ),
        )
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          keyboardDismissBehavior:
          ScrollViewKeyboardDismissBehavior.onDrag,
          padding: EdgeInsets.only(
            left: 20,
            right: 20,
            top: 20,
            bottom:
            context.viewInsets.bottom + 20,
          ),
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minHeight:
              ContextExt(context).height - 140,
            ),
            child: IntrinsicHeight(
              child: Column(
                crossAxisAlignment:
                CrossAxisAlignment.start,
                children: [
                  ExpenseForm(controller: controller),

                  const Spacer(),

                  SaveExpenseButton(controller: controller),

                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}