import 'package:flutter/material.dart';

class EmptyState extends StatelessWidget {
  final bool isSearching;
  final String? titleWhenEmpty;
  final String? subtitleWhenEmpty;
  final String? titleWhenNoResult;
  final String? subtitleWhenNoResult;

  const EmptyState({
    super.key,
    required this.isSearching,
    this.titleWhenEmpty,
    this.subtitleWhenEmpty,
    this.titleWhenNoResult,
    this.subtitleWhenNoResult,
  });

  @override
  Widget build(BuildContext context) {
    final title = isSearching
        ? (titleWhenNoResult ?? 'No results found')
        : (titleWhenEmpty ?? 'No items yet');
    final subtitle = isSearching
        ? (subtitleWhenNoResult ?? 'Try using another keyword or filter')
        : (subtitleWhenEmpty ?? 'Start by adding your first item');

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
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
          Text(
            title,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            subtitle,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.grey.shade600,
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }
}
