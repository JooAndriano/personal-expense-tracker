import 'package:flutter/material.dart';

import '../../../../app/themes/app_text_styles.dart';

class ExpenseHeader extends StatelessWidget {
  final String title;
  final String totalText;
  final VoidCallback onProfileTap;
  final Widget trailing;

  const ExpenseHeader({
    super.key,
    required this.title,
    required this.totalText,
    required this.onProfileTap,
    required this.trailing,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            const Expanded(
              child: Text(
                'Expenses',
                style: AppTextStyles.title,
              ),
            ),
            GestureDetector(
              onTap: onProfileTap,
              child: trailing,
            ),
          ],
        ),
        const SizedBox(height: 4),
        Text(
          totalText,
          style: TextStyle(
            color: Colors.grey.shade600,
            fontSize: 14,
          ),
        ),
      ],
    );
  }
}
