import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../app/themes/app_colors.dart';
import '../../../core/components/buttons/primary_button.dart';
import '../../../core/components/textfields/app_text_field.dart';
import '../controller/add_expense_controller.dart';

class AddExpenseScreen extends StatelessWidget {
  const AddExpenseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(
      AddExpenseController(),
    );

    return Scaffold(
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
            MediaQuery.of(context)
                .viewInsets
                .bottom +
                20,
          ),
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minHeight:
              MediaQuery.of(context)
                  .size
                  .height -
                  140,
            ),
            child: IntrinsicHeight(
              child: Column(
                crossAxisAlignment:
                CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Expense Title',
                    style: TextStyle(
                      fontWeight:
                      FontWeight.w600,
                    ),
                  ),

                  const SizedBox(height: 10),

                  AppTextField(
                    controller:
                    controller
                        .titleController,
                    hint:
                    'e.g. Grocery Shopping',
                  ),

                  const SizedBox(height: 24),

                  const Text(
                    'Amount',
                    style: TextStyle(
                      fontWeight:
                      FontWeight.w600,
                    ),
                  ),

                  const SizedBox(height: 10),

                  TextField(
                    controller:
                    controller
                        .amountController,
                    keyboardType:
                    TextInputType.number,
                    decoration:
                    InputDecoration(
                      hintText: '0',
                      prefixText: 'Rp  ',
                      filled: true,
                      fillColor: Colors.white,
                      border:
                      OutlineInputBorder(
                        borderRadius:
                        BorderRadius.circular(
                          18,
                        ),
                        borderSide:
                        BorderSide.none,
                      ),
                    ),
                  ),

                  const SizedBox(height: 24),

                  const Text(
                    'Category',
                    style: TextStyle(
                      fontWeight:
                      FontWeight.w600,
                    ),
                  ),

                  const SizedBox(height: 10),

                  Obx(
                        () =>
                        DropdownButtonFormField<
                            String
                        >(
                          value:
                          controller
                              .selectedCategory
                              .value,
                          decoration:
                          InputDecoration(
                            filled: true,
                            fillColor:
                            Colors.white,
                            border:
                            OutlineInputBorder(
                              borderRadius:
                              BorderRadius.circular(
                                18,
                              ),
                              borderSide:
                              BorderSide.none,
                            ),
                          ),
                          icon: const Icon(
                            Icons
                                .keyboard_arrow_down_rounded,
                          ),
                          items:
                          controller.categories.map((
                              category,
                              ) {
                            return DropdownMenuItem(
                              value: category,
                              child: Text(
                                category,
                              ),
                            );
                          }).toList(),
                          onChanged: (value) {
                            controller
                                .selectedCategory
                                .value =
                            value!;
                          },
                        ),
                  ),

                  const SizedBox(height: 24),

                  const Text(
                    'Date',
                    style: TextStyle(
                      fontWeight:
                      FontWeight.w600,
                    ),
                  ),

                  const SizedBox(height: 10),

                  Obx(
                        () => InkWell(
                      onTap: () async {
                        final pickedDate =
                        await showDatePicker(
                          context: context,
                          initialDate:
                          controller
                              .selectedDate
                              .value,
                          firstDate:
                          DateTime(2020),
                          lastDate:
                          DateTime(2100),
                        );

                        if (pickedDate !=
                            null) {
                          controller
                              .selectedDate
                              .value =
                              pickedDate;
                        }
                      },
                      borderRadius:
                      BorderRadius.circular(
                        18,
                      ),
                      child: Container(
                        width:
                        double.infinity,
                        padding:
                        const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 18,
                        ),
                        decoration:
                        BoxDecoration(
                          color:
                          Colors.white,
                          borderRadius:
                          BorderRadius.circular(
                            18,
                          ),
                        ),
                        child: Text(
                          DateFormat(
                            'dd/MM/yyyy',
                          ).format(
                            controller
                                .selectedDate
                                .value,
                          ),
                          style:
                          const TextStyle(
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                  ),

                  const Spacer(),

                  PrimaryButton(
                    text:
                    controller
                        .editingExpense !=
                        null
                        ? 'Save Changes'
                        : 'Save Expense',
                    onTap: () {
                      controller
                          .saveExpense();
                    },
                  ),

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