import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../app/themes/app_colors.dart';
import '../../../app/themes/app_text_styles.dart';
import '../../../core/components/buttons/primary_button.dart';
import '../../../core/components/textfields/app_text_field.dart';

class AddExpenseScreen extends StatefulWidget {
  const AddExpenseScreen({super.key});

  @override
  State<AddExpenseScreen> createState() =>
      _AddExpenseScreenState();
}

class _AddExpenseScreenState
    extends State<AddExpenseScreen> {
  final titleController = TextEditingController();

  final amountController = TextEditingController();

  final categories = [
    'Food & Dining',
    'Transportation',
    'Shopping',
    'Bills',
    'Entertainment',
  ];

  String selectedCategory = 'Food & Dining';

  DateTime selectedDate = DateTime.now();

  Future<void> pickDate() async {
    final pickedDate = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2020),
      lastDate: DateTime(2100),
    );

    if (pickedDate != null) {
      setState(() {
        selectedDate = pickedDate;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        elevation: 0,
        scrolledUnderElevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(Icons.arrow_back_ios_new_rounded),
        ),
        title: const Text(
          'Add Expense',
          style: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 24,
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment:
            CrossAxisAlignment.start,
            children: [
              /// Expense Title
              const Text(
                'Expense Title',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                ),
              ),

              const SizedBox(height: 10),

              AppTextField(
                controller: titleController,
                hint: 'e.g. Grocery Shopping',
              ),

              const SizedBox(height: 24),

              /// Amount
              const Text(
                'Amount',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                ),
              ),

              const SizedBox(height: 10),

              TextField(
                controller: amountController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  hintText: '0',
                  prefixText: 'Rp  ',
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius:
                    BorderRadius.circular(18),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),

              const SizedBox(height: 24),

              /// Category
              const Text(
                'Category',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                ),
              ),

              const SizedBox(height: 10),

              DropdownButtonFormField<String>(
                value: selectedCategory,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius:
                    BorderRadius.circular(18),
                    borderSide: BorderSide.none,
                  ),
                ),
                icon: const Icon(
                  Icons.keyboard_arrow_down_rounded,
                ),
                items: categories.map((category) {
                  return DropdownMenuItem(
                    value: category,
                    child: Text(category),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    selectedCategory = value!;
                  });
                },
              ),

              const SizedBox(height: 24),

              /// Date
              const Text(
                'Date',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                ),
              ),

              const SizedBox(height: 10),

              InkWell(
                onTap: pickDate,
                borderRadius:
                BorderRadius.circular(18),
                child: Container(
                  width: double.infinity,
                  padding:
                  const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 18,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius:
                    BorderRadius.circular(18),
                  ),
                  child: Text(
                    DateFormat(
                      'dd/MM/yyyy',
                    ).format(selectedDate),
                    style: const TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ),
              ),

              const Spacer(),

              PrimaryButton(
                text: 'Save Expense',
                onTap: () {
                  Get.back();
                },
              ),

              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}