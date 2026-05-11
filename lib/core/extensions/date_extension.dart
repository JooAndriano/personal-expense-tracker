import 'package:intl/intl.dart';

extension DateExtension on DateTime {
  String toReadableDate() {
    return DateFormat(
      'dd MMM yyyy',
      'id_ID',
    ).format(this);
  }
}