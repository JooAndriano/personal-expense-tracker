import '../../core/services/storage_service.dart';
import '../models/profile_model.dart';

class ProfileLocalDataSource {
  final storage = StorageService();

  ProfileModel getProfile() {
    final data =
    storage.read(StorageService.profileKey);

    if (data == null) {
      return ProfileModel(
        name: 'John Doe',
        email: 'john.doe@email.com',
      );
    }

    return ProfileModel.fromJson(
      Map<String, dynamic>.from(data),
    );
  }

  Future<void> saveProfile(
      ProfileModel profile,
      ) async {
    await storage.write(
      StorageService.profileKey,
      profile.toJson(),
    );
  }
}