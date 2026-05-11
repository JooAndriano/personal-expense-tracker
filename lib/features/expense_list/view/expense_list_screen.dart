import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../app/routes/app_routes.dart';
import '../../../app/themes/app_colors.dart';
import '../../../app/themes/app_text_styles.dart';
import '../../../core/extensions/currency_extension.dart';
import '../../profile/controller/profile_controller.dart';
import '../controller/expense_list_controller.dart';
import 'widgets/expense_item.dart';

class ExpenseListScreen extends StatelessWidget {
  const ExpenseListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(
      ExpenseListController(),
    );

    final profileController = Get.put(
      ProfileController(),
    );

    return Scaffold(
      backgroundColor:
      AppColors.background,

      floatingActionButton:
      FloatingActionButton.extended(
        backgroundColor:
        AppColors.primary,
        onPressed: () async {
          final result =
          await Get.toNamed(
            AppRoutes.addExpense,
          );

          if (result == true) {
            controller.loadExpenses();
          }
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
          padding:
          const EdgeInsets.symmetric(
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
                      style:
                      AppTextStyles
                          .title,
                    ),
                  ),

                  GestureDetector(
                    onTap: () {
                      showModalBottomSheet(
                        context: context,
                        isScrollControlled:
                        true,
                        backgroundColor:
                        Colors.transparent,
                        builder: (_) {
                          return AnimatedPadding(
                            duration: const Duration(
                              milliseconds: 150,
                            ),
                            padding: EdgeInsets.only(
                              bottom:
                              MediaQuery.of(context)
                                  .viewInsets
                                  .bottom,
                            ),
                            child: Container(
                              padding: const EdgeInsets.all(
                                24,
                              ),
                              decoration:
                              const BoxDecoration(
                                color: Colors.white,
                                borderRadius:
                                BorderRadius.vertical(
                                  top: Radius.circular(32),
                                ),
                              ),
                              child: SafeArea(
                                child: SingleChildScrollView(
                                  keyboardDismissBehavior:
                                  ScrollViewKeyboardDismissBehavior
                                      .onDrag,
                                  child: Column(
                                    mainAxisSize:
                                    MainAxisSize.min,
                                    children: [
                                      Align(
                                        alignment:
                                        Alignment.topRight,
                                        child:
                                        GestureDetector(
                                          onTap: () {
                                            Get.back();
                                          },
                                          child: const Icon(
                                            Icons
                                                .close_rounded,
                                          ),
                                        ),
                                      ),

                                      const SizedBox(
                                        height: 8,
                                      ),

                                      /// PROFILE IMAGE
                                      Obx(() {
                                        final imagePath =
                                            profileController
                                                .state
                                                .value
                                                .profile
                                                .imagePath;

                                        return Stack(
                                          children: [
                                            Container(
                                              width: 96,
                                              height: 96,
                                              decoration:
                                              BoxDecoration(
                                                shape:
                                                BoxShape.circle,
                                                gradient:
                                                imagePath ==
                                                    null
                                                    ? const LinearGradient(
                                                  colors: [
                                                    Color(
                                                      0xFF3B82F6,
                                                    ),
                                                    Color(
                                                      0xFF9333EA,
                                                    ),
                                                  ],
                                                )
                                                    : null,
                                              ),
                                              child:
                                              imagePath !=
                                                  null
                                                  ? ClipOval(
                                                child:
                                                Image.file(
                                                  File(
                                                    imagePath,
                                                  ),
                                                  fit: BoxFit
                                                      .cover,
                                                ),
                                              )
                                                  : const Icon(
                                                Icons
                                                    .person_rounded,
                                                color: Colors
                                                    .white,
                                                size: 42,
                                              ),
                                            ),

                                            Positioned(
                                              right: 0,
                                              bottom: 0,
                                              child:
                                              GestureDetector(
                                                onTap: () {
                                                  profileController
                                                      .pickProfileImage();
                                                },
                                                child:
                                                Container(
                                                  width: 32,
                                                  height: 32,
                                                  decoration:
                                                  BoxDecoration(
                                                    color:
                                                    AppColors
                                                        .primary,
                                                    shape: BoxShape
                                                        .circle,
                                                    border:
                                                    Border.all(
                                                      color:
                                                      Colors
                                                          .white,
                                                      width: 2,
                                                    ),
                                                  ),
                                                  child:
                                                  const Icon(
                                                    Icons
                                                        .edit_rounded,
                                                    color: Colors
                                                        .white,
                                                    size: 16,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        );
                                      }),

                                      const SizedBox(
                                        height: 24,
                                      ),

                                      /// NAME
                                      TextField(
                                        controller:
                                        profileController
                                            .nameController,
                                        textAlign:
                                        TextAlign.center,
                                        style:
                                        const TextStyle(
                                          fontSize: 24,
                                          fontWeight:
                                          FontWeight.w700,
                                        ),
                                        decoration:
                                        const InputDecoration(
                                          border:
                                          InputBorder.none,
                                          suffixIcon: Icon(
                                            Icons
                                                .edit_rounded,
                                            size: 18,
                                          ),
                                        ),
                                      ),

                                      /// EMAIL
                                      TextField(
                                        controller:
                                        profileController
                                            .emailController,
                                        textAlign:
                                        TextAlign.center,
                                        decoration:
                                        InputDecoration(
                                          border:
                                          InputBorder.none,
                                          suffixIcon:
                                          const Icon(
                                            Icons
                                                .edit_rounded,
                                            size: 18,
                                          ),
                                          hintStyle:
                                          TextStyle(
                                            color: Colors
                                                .grey
                                                .shade600,
                                          ),
                                        ),
                                      ),

                                      const SizedBox(
                                        height: 24,
                                      ),

                                      SizedBox(
                                        width:
                                        double.infinity,
                                        height: 54,
                                        child:
                                        FilledButton.icon(
                                          onPressed: () {
                                            profileController
                                                .saveProfile();
                                          },
                                          icon: const Icon(
                                            Icons
                                                .save_rounded,
                                          ),
                                          label: const Text(
                                            'Save Profile',
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      );
                    },
                    child: Obx(() {
                      final imagePath =
                          profileController
                              .state
                              .value
                              .profile
                              .imagePath;

                      return Container(
                        width: 48,
                        height: 48,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color:
                            AppColors.textPrimary,
                            width: 2,
                          ),
                          shape: BoxShape.circle,
                        ),
                        child:
                        imagePath != null &&
                            imagePath.isNotEmpty
                            ? ClipOval(
                          child: Image.file(
                            File(imagePath),
                            fit: BoxFit.cover,
                          ),
                        )
                            : const Icon(
                          Icons.person_rounded,
                          size: 28,
                        ),
                      );
                    }),
                  ),
                ],
              ),

              const SizedBox(height: 24),

              /// Total Card
              Container(
                width: double.infinity,
                padding:
                const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  color: AppColors.primary,
                  borderRadius:
                  BorderRadius.circular(
                    28,
                  ),
                ),
                child: Column(
                  crossAxisAlignment:
                  CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Total Expense',
                      style: TextStyle(
                        color: Colors.white70,
                      ),
                    ),

                    const SizedBox(
                      height: 12,
                    ),

                    Obx(
                          () => Text(
                        controller
                            .totalExpense
                            .toRupiah(),
                        style:
                        const TextStyle(
                          color:
                          Colors.white,
                          fontSize: 32,
                          fontWeight:
                          FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 24),

              /// Expense List
              Expanded(
                child: Obx(() {
                  final expenses =
                      controller
                          .state
                          .value
                          .expenses;

                  if (expenses.isEmpty) {
                    return Center(
                      child: Column(
                        mainAxisAlignment:
                        MainAxisAlignment
                            .center,
                        children: [
                          Container(
                            width: 84,
                            height: 84,
                            decoration:
                            BoxDecoration(
                              color: Colors
                                  .grey
                                  .shade100,
                              shape:
                              BoxShape.circle,
                            ),
                            child: Icon(
                              Icons
                                  .receipt_long_rounded,
                              size: 42,
                              color: Colors
                                  .grey
                                  .shade500,
                            ),
                          ),

                          const SizedBox(
                            height: 24,
                          ),

                          const Text(
                            'No expenses yet',
                            style:
                            TextStyle(
                              fontSize:
                              24,
                              fontWeight:
                              FontWeight
                                  .w700,
                            ),
                          ),

                          const SizedBox(
                            height: 10,
                          ),

                          Text(
                            'Start tracking your expenses\nby adding your first one',
                            textAlign:
                            TextAlign
                                .center,
                            style:
                            TextStyle(
                              color: Colors
                                  .grey
                                  .shade600,
                              height:
                              1.5,
                            ),
                          ),
                        ],
                      ),
                    );
                  }

                  return ListView.builder(
                    itemCount:
                    expenses.length,
                    itemBuilder:
                        (
                        context,
                        index,
                        ) {
                      final expense =
                      expenses[index];

                      return ExpenseItem(
                        expense:
                        expense,

                        onEdit:
                            () async {
                          final result =
                          await Get.toNamed(
                            AppRoutes
                                .addExpense,
                            arguments:
                            expense,
                          );

                          if (result ==
                              true) {
                            controller
                                .loadExpenses();
                          }
                        },

                        onDelete:
                            () {
                          controller
                              .deleteExpense(
                            expense.id,
                          );
                        },
                      );
                    },
                  );
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}