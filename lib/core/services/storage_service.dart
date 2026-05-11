import 'package:get_storage/get_storage.dart';

class StorageService {
  final box = GetStorage();

  /// Expense Keys
  static const expensesKey = 'expenses';

  /// Profile Keys
  static const profileKey = 'profile';

  dynamic read(String key) {
    return box.read(key);
  }

  Future<void> write(
      String key,
      dynamic value,
      ) async {
    await box.write(key, value);
  }

  Future<void> remove(String key) async {
    await box.remove(key);
  }
}