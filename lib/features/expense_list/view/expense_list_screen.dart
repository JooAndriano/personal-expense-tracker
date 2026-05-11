import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../app/routes/app_routes.dart';
import '../../../app/themes/app_colors.dart';
import '../../../app/themes/app_text_styles.dart';
import '../../../core/extensions/currency_extension.dart';
import '../../../core/utils/category_icon_helper.dart';
import '../../profile/controller/profile_controller.dart';
import '../controller/expense_list_controller.dart';
import '../../shared/models/expense_filter.dart';
import 'widgets/expense_search_bar.dart';
import '../../../core/components/app_scaffold.dart';
import '../../../core/components/cards/expense_card.dart';
import '../../../core/components/states/empty_state.dart';
import '../../../core/components/sheets/delete_confirmation.dart';

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

    return AppScaffold(
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
              /// HEADER
              Column(
                crossAxisAlignment:
                CrossAxisAlignment
                    .start,
                children: [
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
                            context:
                            context,
                            isScrollControlled:
                            true,
                            backgroundColor:
                            Colors
                                .transparent,
                            builder: (_) {
                              return AnimatedPadding(
                                duration:
                                const Duration(
                                  milliseconds:
                                  150,
                                ),
                                padding:
                                EdgeInsets.only(
                                  bottom:
                                  MediaQuery.of(
                                    context,
                                  )
                                      .viewInsets
                                      .bottom,
                                ),
                                child:
                                Container(
                                  padding:
                                  const EdgeInsets.all(
                                    24,
                                  ),
                                  decoration:
                                  const BoxDecoration(
                                    color:
                                    Colors
                                        .white,
                                    borderRadius:
                                    BorderRadius.vertical(
                                      top:
                                      Radius.circular(
                                        32,
                                      ),
                                    ),
                                  ),
                                  child:
                                  SafeArea(
                                    child:
                                    SingleChildScrollView(
                                      keyboardDismissBehavior:
                                      ScrollViewKeyboardDismissBehavior
                                          .onDrag,
                                      child:
                                      Column(
                                        mainAxisSize:
                                        MainAxisSize.min,
                                        children: [
                                          Align(
                                            alignment:
                                            Alignment.topRight,
                                            child:
                                            GestureDetector(
                                              onTap:
                                                  () {
                                                Get.back();
                                              },
                                              child:
                                              const Icon(
                                                Icons.close_rounded,
                                              ),
                                            ),
                                          ),

                                          const SizedBox(
                                            height:
                                            8,
                                          ),

                                          /// PROFILE IMAGE
                                          Obx(
                                                () {
                                              final imagePath =
                                                  profileController
                                                      .state
                                                      .value
                                                      .profile
                                                      .imagePath;

                                              return Stack(
                                                children: [
                                                  Container(
                                                    width:
                                                    96,
                                                    height:
                                                    96,
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
                                                        fit:
                                                        BoxFit.cover,
                                                      ),
                                                    )
                                                        : const Icon(
                                                      Icons.person_rounded,
                                                      color:
                                                      Colors.white,
                                                      size:
                                                      42,
                                                    ),
                                                  ),

                                                  Positioned(
                                                    right:
                                                    0,
                                                    bottom:
                                                    0,
                                                    child:
                                                    GestureDetector(
                                                      onTap:
                                                          () {
                                                        profileController.pickProfileImage();
                                                      },
                                                      child:
                                                      Container(
                                                        width:
                                                        32,
                                                        height:
                                                        32,
                                                        decoration:
                                                        BoxDecoration(
                                                          color:
                                                          AppColors.primary,
                                                          shape:
                                                          BoxShape.circle,
                                                          border:
                                                          Border.all(
                                                            color:
                                                            Colors.white,
                                                            width:
                                                            2,
                                                          ),
                                                        ),
                                                        child:
                                                        const Icon(
                                                          Icons.edit_rounded,
                                                          color:
                                                          Colors.white,
                                                          size:
                                                          16,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              );
                                            },
                                          ),

                                          const SizedBox(
                                            height:
                                            24,
                                          ),

                                          TextField(
                                            controller:
                                            profileController
                                                .nameController,
                                            textAlign:
                                            TextAlign.center,
                                            style:
                                            const TextStyle(
                                              fontSize:
                                              24,
                                              fontWeight:
                                              FontWeight.w700,
                                            ),
                                            decoration:
                                            const InputDecoration(
                                              border:
                                              InputBorder.none,
                                              suffixIcon:
                                              Icon(
                                                Icons.edit_rounded,
                                                size:
                                                18,
                                              ),
                                            ),
                                          ),

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
                                                Icons.edit_rounded,
                                                size:
                                                18,
                                              ),
                                            ),
                                          ),

                                          const SizedBox(
                                            height:
                                            24,
                                          ),

                                          SizedBox(
                                            width:
                                            double.infinity,
                                            height:
                                            54,
                                            child:
                                            FilledButton.icon(
                                              onPressed:
                                                  () {
                                                profileController.saveProfile();
                                              },
                                              icon:
                                              const Icon(
                                                Icons.save_rounded,
                                              ),
                                              label:
                                              const Text(
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
                        child: Obx(
                              () {
                            final imagePath =
                                profileController
                                    .state
                                    .value
                                    .profile
                                    .imagePath;

                            return Container(
                              width: 48,
                              height: 48,
                              decoration:
                              BoxDecoration(
                                border:
                                Border.all(
                                  color:
                                  AppColors
                                      .textPrimary,
                                  width:
                                  2,
                                ),
                                shape:
                                BoxShape.circle,
                              ),
                              child:
                              imagePath !=
                                  null &&
                                  imagePath
                                      .isNotEmpty
                                  ? ClipOval(
                                child:
                                Image.file(
                                  File(
                                    imagePath,
                                  ),
                                  fit:
                                  BoxFit.cover,
                                ),
                              )
                                  : const Icon(
                                Icons
                                    .person_rounded,
                                size:
                                28,
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(
                    height: 4,
                  ),

                  Obx(
                        () => Text(
                      'Total: ${controller.totalExpense.toRupiah()}',
                      style:
                      TextStyle(
                        color: Colors
                            .grey
                            .shade600,
                        fontSize: 14,
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 20),

              /// SEARCH
              ExpenseSearchBar(
                controller: controller.searchController,
              ),

              const SizedBox(height: 16),

              /// FILTER + SORT
              Row(
                children: [
                  Expanded(
                    child: Obx(
                          () =>
                              DropdownButtonFormField<String>(
                                initialValue:
                                controller
                                    .selectedCategory
                                    .value,
                                isExpanded: true,
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: Colors.white,
                                  contentPadding:
                                  const EdgeInsets.symmetric(
                                    horizontal: 16,
                                    vertical: 14,
                                  ),
                                  border: OutlineInputBorder(
                                    borderRadius:
                                    BorderRadius.circular(18),
                                    borderSide: BorderSide.none,
                                  ),
                                ),
                                items:
                                controller.categories.map((
                                    category,
                                    ) {
                                  return DropdownMenuItem(
                                    value: category,
                                    child: Row(
                                      children: [
                                        if (category != 'All')
                                          Icon(
                                            CategoryIconHelper.getIcon(
                                              category,
                                            ),
                                            size: 18,
                                            color:
                                            CategoryIconHelper
                                                .getColor(
                                              category,
                                            ),
                                          ),

                                        if (category != 'All')
                                          const SizedBox(width: 10),

                                        Expanded(
                                          child: Text(
                                            category,
                                            overflow:
                                            TextOverflow.ellipsis,
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                }).toList(),
                                onChanged: (value) {
                                  controller.setCategory(
                                    value!,
                                  );
                                },
                              ),
                    ),
                  ),

                  const SizedBox(
                    width: 12,
                  ),

                  Expanded(
                    child: Obx(
                          () =>
                              DropdownButtonFormField<
                                  ExpenseSortType
                              >(
                                initialValue:
                                controller
                                    .selectedSort
                                    .value,
                                isExpanded: true,
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: Colors.white,
                                  contentPadding:
                                  const EdgeInsets.symmetric(
                                    horizontal: 16,
                                    vertical: 14,
                                  ),
                                  border: OutlineInputBorder(
                                    borderRadius:
                                    BorderRadius.circular(18),
                                    borderSide: BorderSide.none,
                                  ),
                                ),
                                items: const [
                                  DropdownMenuItem(
                                    value:
                                    ExpenseSortType.newest,
                                    child: Text(
                                      'Newest',
                                      overflow:
                                      TextOverflow.ellipsis,
                                    ),
                                  ),
                                  DropdownMenuItem(
                                    value:
                                    ExpenseSortType.oldest,
                                    child: Text(
                                      'Oldest',
                                      overflow:
                                      TextOverflow.ellipsis,
                                    ),
                                  ),
                                  DropdownMenuItem(
                                    value:
                                    ExpenseSortType
                                        .highestAmount,
                                    child: Text(
                                      'Highest',
                                      overflow:
                                      TextOverflow.ellipsis,
                                    ),
                                  ),
                                  DropdownMenuItem(
                                    value:
                                    ExpenseSortType
                                        .lowestAmount,
                                    child: Text(
                                      'Lowest',
                                      overflow:
                                      TextOverflow.ellipsis,
                                    ),
                                  ),
                                ],
                                onChanged: (value) {
                                  controller.setSort(
                                    value!,
                                  );
                                },
                              ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 24),

              /// LIST
              Expanded(
                child: Obx(
                      () {
                    final expenses =
                        controller
                            .filteredExpenses;

                    if (expenses
                        .isEmpty) {
                      final isSearching =
                          controller
                              .searchController
                              .text
                              .isNotEmpty ||
                              controller
                                  .selectedCategory
                                  .value !=
                                  'All';

                      return EmptyState(
                        isSearching: isSearching,
                        titleWhenEmpty: 'No expenses yet',
                        subtitleWhenEmpty: 'Start tracking your expenses\nby adding your first one',
                        titleWhenNoResult: 'No results found',
                        subtitleWhenNoResult: 'Try using another keyword or filter',
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
                        expenses[
                        index];

                        return ExpenseCard(
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
                            Get.bottomSheet(
                              DeleteConfirmation(
                                onConfirm: () async {
                                  await controller.deleteExpense(expense.id);
                                  Get.snackbar(
                                    'Deleted',
                                    'Expense deleted successfully',
                                    snackPosition: SnackPosition.BOTTOM,
                                    margin: const EdgeInsets.all(16),
                                  );
                                },
                              ),
                              backgroundColor: Colors.transparent,
                              isScrollControlled: true,
                            );
                          },
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}