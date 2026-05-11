import 'package:flutter/material.dart';

class CategoryIconHelper {
  static IconData getIcon(
      String category,
      ) {
    switch (category) {
      case 'Food & Dining':
        return Icons.restaurant_rounded;

      case 'Transportation':
        return Icons.directions_car_rounded;

      case 'Shopping':
        return Icons.shopping_bag_rounded;

      case 'Bills':
        return Icons.receipt_long_rounded;

      case 'Entertainment':
        return Icons.movie_rounded;

      default:
        return Icons.payments_rounded;
    }
  }

  static Color getColor(
      String category,
      ) {
    switch (category) {
      case 'Food & Dining':
        return Colors.orange;

      case 'Transportation':
        return Colors.blue;

      case 'Shopping':
        return Colors.purple;

      case 'Bills':
        return Colors.red;

      case 'Entertainment':
        return Colors.green;

      default:
        return Colors.grey;
    }
  }
}