import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../app/routes/app_routes.dart';
import '../../../app/themes/app_colors.dart';
import '../../../app/themes/app_text_styles.dart';

class ExpenseListScreen extends StatelessWidget {
  const ExpenseListScreen({super.key});

  void showProfileBottomSheet(BuildContext context) {
    final nameController =
    TextEditingController(text: 'John Doe');

    final emailController =
    TextEditingController(
      text: 'john.doe@email.com',
    );

    Get.bottomSheet(
      Container(
        padding: const EdgeInsets.all(24),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(32),
          ),
        ),
        child: SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              /// Close Button
              Align(
                alignment: Alignment.topRight,
                child: GestureDetector(
                  onTap: () {
                    Get.back();
                  },
                  child: const Icon(
                    Icons.close_rounded,
                  ),
                ),
              ),

              const SizedBox(height: 8),

              /// Profile Image
              Stack(
                children: [
                  Container(
                    width: 96,
                    height: 96,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: LinearGradient(
                        colors: [
                          Color(0xFF3B82F6),
                          Color(0xFF9333EA),
                        ],
                      ),
                    ),
                    child: const Icon(
                      Icons.person_rounded,
                      color: Colors.white,
                      size: 42,
                    ),
                  ),

                  Positioned(
                    right: 0,
                    bottom: 0,
                    child: GestureDetector(
                      onTap: () {
                        /// next phase:
                        /// image picker
                      },
                      child: Container(
                        width: 32,
                        height: 32,
                        decoration: BoxDecoration(
                          color: AppColors.primary,
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: Colors.white,
                            width: 2,
                          ),
                        ),
                        child: const Icon(
                          Icons.edit_rounded,
                          color: Colors.white,
                          size: 16,
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 24),

              /// Name
              TextField(
                controller: nameController,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                ),
                decoration: InputDecoration(
                  border: InputBorder.none,
                  suffixIcon: const Icon(
                    Icons.edit_rounded,
                    size: 18,
                  ),
                  contentPadding: EdgeInsets.zero,
                ),
              ),

              /// Email
              TextField(
                controller: emailController,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.grey.shade600,
                ),
                decoration: InputDecoration(
                  border: InputBorder.none,
                  suffixIcon: const Icon(
                    Icons.edit_rounded,
                    size: 18,
                  ),
                  contentPadding: EdgeInsets.zero,
                ),
              ),

              const SizedBox(height: 24),

              SizedBox(
                width: double.infinity,
                height: 54,
                child: FilledButton.icon(
                  onPressed: () {
                    Get.back();
                  },
                  icon: const Icon(
                    Icons.save_rounded,
                  ),
                  label: const Text(
                    'Save Profile',
                  ),
                ),
              ),

              const SizedBox(height: 12),
            ],
          ),
        ),
      ),
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,

      /// Floating Button
      floatingActionButton:
      FloatingActionButton.extended(
        backgroundColor: AppColors.primary,
        onPressed: () {
          Get.toNamed(AppRoutes.addExpense);
        },
        icon: const Icon(
          Icons.add_rounded,
          color: Colors.white,
        ),
        label: const Text(
          'Add Expense',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 16,
          ),
          child: Column(
            children: [
              /// Header
              Row(
                children: [
                  const Expanded(
                    child: Text(
                      'Expenses',
                      style: AppTextStyles.title,
                    ),
                  ),

                  /// Profile Button
                  GestureDetector(
                    onTap: () {
                      showProfileBottomSheet(
                        context,
                      );
                    },
                    child: Container(
                      width: 48,
                      height: 48,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: AppColors.textPrimary,
                          width: 2,
                        ),
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.person_rounded,
                        size: 28,
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 24),

              /// Empty State
              Expanded(
                child: Center(
                  child: Column(
                    mainAxisAlignment:
                    MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 84,
                        height: 84,
                        decoration: BoxDecoration(
                          color: Colors.grey.shade100,
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          Icons.receipt_long_rounded,
                          size: 42,
                          color: Colors.grey.shade500,
                        ),
                      ),

                      const SizedBox(height: 24),

                      const Text(
                        'No expenses yet',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w700,
                        ),
                      ),

                      const SizedBox(height: 10),

                      Text(
                        'Start tracking your expenses\nby adding your first one',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.grey.shade600,
                          height: 1.5,
                        ),
                      ),

                      const SizedBox(height: 28),

                      FilledButton.icon(
                        style: FilledButton.styleFrom(
                          backgroundColor:
                          AppColors.primary,
                          padding:
                          const EdgeInsets.symmetric(
                            horizontal: 24,
                            vertical: 16,
                          ),
                        ),
                        onPressed: () {
                          Get.toNamed(
                            AppRoutes.addExpense,
                          );
                        },
                        icon: const Icon(
                          Icons.add_rounded,
                          color: Colors.white,
                        ),
                        label: const Text(
                          'Add Expense',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight:
                            FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}