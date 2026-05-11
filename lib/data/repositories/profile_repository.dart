import '../datasources/profile_local_datasource.dart';
import '../models/profile_model.dart';

class ProfileRepository {
  final datasource =
  ProfileLocalDataSource();

  ProfileModel getProfile() {
    return datasource.getProfile();
  }

  Future<void> saveProfile(
      ProfileModel profile,
      ) async {
    await datasource.saveProfile(profile);
  }
}