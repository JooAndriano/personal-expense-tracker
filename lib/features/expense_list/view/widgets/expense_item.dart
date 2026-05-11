import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import '../../../../app/themes/app_colors.dart';
import '../../../../app/themes/app_text_styles.dart';
import '../../../../core/extensions/currency_extension.dart';
import '../../../../core/extensions/date_extension.dart';
import '../../../../data/models/expense_model.dart';

class ExpenseItem extends StatelessWidget {
  final ExpenseModel expense;
  final VoidCallback onEdit;
  final VoidCallback onDelete;

  const ExpenseItem({
    super.key,
    required this.expense,
    required this.onEdit,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        bottom: 16,
      ),
      child: Slidable(
        endActionPane: ActionPane(
          motion: const DrawerMotion(),
          extentRatio: 0.45,
          children: [
            SlidableAction(
              onPressed: (_) {
                onEdit();
              },
              backgroundColor:
              Colors.orange,
              foregroundColor:
              Colors.white,
              icon: Icons.edit_rounded,
              borderRadius:
              BorderRadius.circular(20),
            ),
            SlidableAction(
              onPressed: (_) {
                onDelete();
              },
              backgroundColor:
              AppColors.danger,
              foregroundColor:
              Colors.white,
              icon: Icons.delete_rounded,
              borderRadius:
              BorderRadius.circular(20),
            ),
          ],
        ),
        child: Container(
          padding: const EdgeInsets.all(18),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius:
            BorderRadius.circular(24),
          ),
          child: Row(
            children: [
              Container(
                width: 56,
                height: 56,
                decoration: BoxDecoration(
                  color:
                  AppColors.primary
                      .withValues(
                    alpha: 0.08,
                  ),
                  borderRadius:
                  BorderRadius.circular(
                    18,
                  ),
                ),
                child: const Icon(
                  Icons.payments_rounded,
                  color:
                  AppColors.primary,
                ),
              ),

              const SizedBox(width: 16),

              Expanded(
                child: Column(
                  crossAxisAlignment:
                  CrossAxisAlignment.start,
                  children: [
                    Text(
                      expense.title,
                      style:
                      AppTextStyles
                          .cardTitle,
                    ),

                    const SizedBox(
                      height: 4,
                    ),

                    Text(
                      expense.date
                          .toReadableDate(),
                      style:
                      AppTextStyles
                          .subtitle,
                    ),
                  ],
                ),
              ),

              Text(
                expense.amount.toRupiah(),
                style:
                AppTextStyles.amount,
              ),
            ],
          ),
        ),
      ),
    );
  }
}