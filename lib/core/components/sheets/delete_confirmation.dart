import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../app/constants/ui_constants.dart';
import '../../../app/themes/app_colors.dart';

class DeleteConfirmation extends StatelessWidget {
  final VoidCallback onConfirm;
  final VoidCallback? onCancel;
  const DeleteConfirmation({super.key, required this.onConfirm, this.onCancel});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(UiConstants.spacingXL),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: UiConstants.radiusSheet,
      ),
      child: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 56,
              height: 56,
              decoration: BoxDecoration(
                color: AppColors.danger.withValues(alpha: 0.1),
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.delete_rounded,
                color: AppColors.danger,
                size: 28,
              ),
            ),
            const SizedBox(height: UiConstants.spacingL),
            const Text(
              'Delete Expense?',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: UiConstants.spacingS),
            Text(
              'This action cannot be undone.',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.grey.shade600,
                height: 1.5,
              ),
            ),
            const SizedBox(height: UiConstants.spacing2XL),
            Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      minimumSize: UiConstants.minButtonSize,
                      shape: RoundedRectangleBorder(
                        borderRadius: UiConstants.radiusM,
                      ),
                    ),
                    onPressed: () {
                      Get.back();
                      onCancel?.call();
                    },
                    child: const Text('Cancel'),
                  ),
                ),
                const SizedBox(width: UiConstants.spacingM),
                Expanded(
                  child: FilledButton(
                    style: FilledButton.styleFrom(
                      backgroundColor: AppColors.danger,
                      minimumSize: UiConstants.minButtonSize,
                      shape: RoundedRectangleBorder(
                        borderRadius: UiConstants.radiusM,
                      ),
                    ),
                    onPressed: () {
                      Get.back();
                      onConfirm();
                    },
                    child: const Text('Delete'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
