import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/utils/category_icon_helper.dart';
import '../../controller/expense_list_controller.dart';
import '../../../shared/models/expense_filter.dart';

class ExpenseFilterSortSection extends StatelessWidget {
  final ExpenseListController controller;
  const ExpenseFilterSortSection({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Obx(
            () => DropdownButtonFormField<String>(
              initialValue: controller.selectedCategory.value,
              isExpanded: true,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 14,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(18),
                  borderSide: BorderSide.none,
                ),
              ),
              items: controller.categories.map((category) {
                return DropdownMenuItem(
                  value: category,
                  child: Row(
                    children: [
                      if (category != 'All')
                        Icon(
                          CategoryIconHelper.getIcon(category),
                          size: 18,
                          color: CategoryIconHelper.getColor(category),
                        ),
                      if (category != 'All') const SizedBox(width: 10),
                      Expanded(
                        child: Text(
                          category,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                );
              }).toList(),
              onChanged: (value) {
                if (value != null) {
                  controller.setCategory(value);
                }
              },
            ),
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Obx(
            () => DropdownButtonFormField<ExpenseSortType>(
              initialValue: controller.selectedSort.value,
              isExpanded: true,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 14,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(18),
                  borderSide: BorderSide.none,
                ),
              ),
              items: const [
                DropdownMenuItem(
                  value: ExpenseSortType.newest,
                  child: Text('Newest', overflow: TextOverflow.ellipsis),
                ),
                DropdownMenuItem(
                  value: ExpenseSortType.oldest,
                  child: Text('Oldest', overflow: TextOverflow.ellipsis),
                ),
                DropdownMenuItem(
                  value: ExpenseSortType.highestAmount,
                  child: Text('Highest', overflow: TextOverflow.ellipsis),
                ),
                DropdownMenuItem(
                  value: ExpenseSortType.lowestAmount,
                  child: Text('Lowest', overflow: TextOverflow.ellipsis),
                ),
              ],
              onChanged: (value) {
                if (value != null) {
                  controller.setSort(value);
                }
              },
            ),
          ),
        ),
      ],
    );
  }
}
